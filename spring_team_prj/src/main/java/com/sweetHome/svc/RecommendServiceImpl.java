package com.sweetHome.svc;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;

@Service
public class RecommendServiceImpl implements RecommendService {
	@Autowired
	private RecommendMapper recommendMapper;
	@Autowired
	private DataFetchService dataFetchService;
	
	//지구의 반지름(km)
	private static final double EARTH_RADIUS = 6371;

	@Override
	public List<String> getRecommendations(String districtName, double latitude, double longitude,
			int distanceImportance, int safetyImportance) {
		//자치구 정보 조회
		List<DistrictVO> allDistricts = dataFetchService.getAllDistrictsFromDB();

		//목적지와 각 자치구의 중심 거리 계산
		Map<String, BigDecimal> distanceMap = calculateDistancesToDistricts(latitude, longitude, allDistricts);
		
		//거리 중요도에 따라 필터링
		Map<String, BigDecimal> filteredDistanceMap = filterDistanceMap(distanceMap, distanceImportance);

		//필터링 지역들만 점수 계산
		Map<String, BigDecimal> scoreMap = calculateScores(filteredDistanceMap, safetyImportance);

		//추천 지역 목록 생성
		List<String> recommendations = getRecommendationsFromScoreMap(scoreMap);

		//추천 지역이 없을 경우 원래 지역을 반환
		if (recommendations.isEmpty()) {
			recommendations.add(districtName);
		}

		return recommendations;
	}
	
	//점수계산 메서드부분
	//BigDecimal 클래스 사용 이유는 Double은 이진부동소수점으로 64비트이므로 0.1을 double로 표현하면 약간의 오차들이 발생한다.
	//BigDecimal 클래스는 십진부동소수점을 사용(우리가 사용하는 십진수)하므로 계산의 오차가 거의 없다. 객체 기반으로 연산하기 때문에 double형에 비해 느릴수 있다.
	//아마 추후에 큰 데이터(수십만건 이상)를 다루게 된다면 성능을 위해 double형으로 변환 후 오차를 테스트해서 오차범위를 보고 리팩토링을 진행해야한다. 
	private Map<String, BigDecimal> calculateScores(Map<String, BigDecimal> filteredDistanceMap, int safetyImportance) {
		//각 자치구 5대 범죄 총합, 단위면적당 CCTV설치량, 인구 데이터를 가져옴
		Map<String, BigDecimal> crimeMap = dataFetchService.getCrimeTotalByDistrict();
		Map<String, BigDecimal> cctvMap = dataFetchService.getCCTVDensityByDistrict();
		Map<String, BigDecimal> populationMap = dataFetchService.getPopulationByDistrict();

		Map<String, BigDecimal> crimeRateMap = new HashMap<>();
		Map<String, BigDecimal> cctvDensityMap = new HashMap<>();

		//각 지역의 단위 인구당 범죄율과 단위 면적당 CCTV수 계산
		for (String districtCode : filteredDistanceMap.keySet()) {
			BigDecimal crimeTotal = crimeMap.get(districtCode);
			BigDecimal cctvDensity = cctvMap.get(districtCode);
			BigDecimal population = populationMap.get(districtCode);

			if (crimeTotal == null || cctvDensity == null || population == null
					|| population.compareTo(BigDecimal.ZERO) == 0) {
				continue;
			}

			BigDecimal crimeRate = crimeTotal.divide(population, 10, RoundingMode.HALF_UP);
			crimeRateMap.put(districtCode, crimeRate);
			cctvDensityMap.put(districtCode, cctvDensity);
		}

		//범죄율이 낮은 순으로, CCTV 밀도가 낮은 순으로 지역 순위를 매김
		//CCTV의 숫자와 단위인구당 범죄 발생을 분석한결과 범죄가 많이 일어나는 지역일수록,
		//사람이 많은지역일수록 cctv 설치 대수가 많음.
		//그러므로 범죄율이 낮고 단위면적당 cctv 설치가 적은거에 가산점을 줌
		List<String> crimeRateRanking = rankDistricts(crimeRateMap, false);
		List<String> cctvDensityRanking = rankDistricts(cctvDensityMap, true);

		Map<String, BigDecimal> scoreMap = new HashMap<>();
		for (String districtCode : filteredDistanceMap.keySet()) {
			int crimeRateRank = crimeRateRanking.indexOf(districtCode) + 1;
			int cctvDensityRank = cctvDensityRanking.indexOf(districtCode) + 1;
			BigDecimal crimeRateScore = calculateRankScore(crimeRateRank);
			BigDecimal cctvDensityScore = calculateRankScore(cctvDensityRank);

			//안전 중요도(선택사항)에 따른 배율 적용
			BigDecimal safetyMultiplier = getSafetyMultiplier(safetyImportance);

			BigDecimal totalScore = (crimeRateScore.add(cctvDensityScore))
					.divide(BigDecimal.valueOf(2), 10, RoundingMode.HALF_UP).multiply(safetyMultiplier);
			scoreMap.put(districtCode, totalScore);
		}
		return scoreMap;
	}

	//안전 중요도에 따른 배율 미리 지정 반환하는 메서드
	//이게 하나의 요인에서 너무 높은 배율를 받아버리면 다른 점수와 상관없이 집계되는 경우가 생겨서 조정함 
	private BigDecimal getSafetyMultiplier(int safetyImportance) {
		switch (safetyImportance) {
		case 1:
			return BigDecimal.valueOf(0.3);
		case 2:
			return BigDecimal.valueOf(0.5);
		case 3:
			return BigDecimal.valueOf(1.0);
		case 4:
			return BigDecimal.valueOf(1.2);
		case 5:
			return BigDecimal.valueOf(1.5);
		default:
			return BigDecimal.valueOf(1.0);
		}
	}

	//지역 순위별 정렬
	private List<String> rankDistricts(Map<String, BigDecimal> dataMap, boolean ascending) {
		List<Map.Entry<String, BigDecimal>> list = new ArrayList<>(dataMap.entrySet());
		if (ascending) {
			list.sort(Map.Entry.comparingByValue());
		} else {
			list.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));
		}
		List<String> result = new ArrayList<>();
		for (Map.Entry<String, BigDecimal> entry : list) {
			result.add(entry.getKey());
		}
		return result;
	}

	//순위에 따른 점수 계산
	private BigDecimal calculateRankScore(int rank) {
		return BigDecimal.valueOf(26 - rank);
	}

	//점수 상위 5개 지역
	private List<String> getRecommendationsFromScoreMap(Map<String, BigDecimal> scoreMap) {
		Map<String, String> districtCodeToNameMap = dataFetchService.getDistrictCodeToNameMap();

		List<Map.Entry<String, BigDecimal>> sortedEntries = new ArrayList<>(scoreMap.entrySet());
		sortedEntries.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));

		List<String> recommendations = new ArrayList<>();
		for (int i = 0; i < Math.min(5, sortedEntries.size()); i++) {
			String code = sortedEntries.get(i).getKey();
			recommendations.add(districtCodeToNameMap.getOrDefault(code, "Unknown District: " + code));
		}
		return recommendations;
	}

	//거리 중요도에 따라 필터링
	private Map<String, BigDecimal> filterDistanceMap(Map<String, BigDecimal> distanceMap, int distanceImportance) {
		BigDecimal maxDistance;
		switch (distanceImportance) {
		case 5:
			maxDistance = BigDecimal.valueOf(1.5); // 도보 10분 이내
			break;
		case 4:
			maxDistance = BigDecimal.valueOf(3.0); // 대중교통 10분 이내
			break;
		case 3:
			maxDistance = BigDecimal.valueOf(5.0); // 대중교통 30분 이내
			break;
		case 2:
			maxDistance = BigDecimal.valueOf(15.0); // 대중교통 1시간 이내
			break;
		default:
			return distanceMap; // 그외
		}

		Map<String, BigDecimal> filteredMap = new HashMap<>();
		for (Map.Entry<String, BigDecimal> entry : distanceMap.entrySet()) {
			if (entry.getValue().compareTo(maxDistance) <= 0) {
				filteredMap.put(entry.getKey(), entry.getValue());
			}
		}
		return filteredMap;
	}

	//입력된 위치와 각 지역 간의 거리를 계산하는 메서드
	private Map<String, BigDecimal> calculateDistancesToDistricts(double destLatitude, double destLongitude,
			List<DistrictVO> allDistricts) {
		Map<String, BigDecimal> distanceMap = new HashMap<>();
		for (DistrictVO district : allDistricts) {
			try {
				BigDecimal distance = calculateHaversineDistance(destLatitude, destLongitude, district.getLatitude(),
						district.getLongitude());
				distanceMap.put(district.getDistrictCode(), distance);
			} catch (Exception e) {
				System.err.println(
						"Error calculating distance for " + district.getDistrictName() + ": " + e.getMessage());
				e.printStackTrace();
			}
		}
		return distanceMap;
	}

	//두 지점 간의 거리를 계산하는 하버사인 공식 메서드
	//하버사인 공식이란 지구를 완벽한 구라고 가정하고 계산하는 방식으로
	//중위도의 지역일수록, 지역의 높이 편차가 크지 않을수록 정확해진다.
	//한국은 중위도 구역이고 남산을 제외하고는 서울은 거의 평지이므로 오차범위가 수 미터 이하로 예상됨
	private BigDecimal calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {
		BigDecimal dLat = BigDecimal.valueOf(Math.toRadians(lat2 - lat1));
		BigDecimal dLon = BigDecimal.valueOf(Math.toRadians(lon2 - lon1));
		BigDecimal a = BigDecimal.valueOf(Math.sin(dLat.doubleValue() / 2)).pow(2)
				.add(BigDecimal.valueOf(Math.cos(Math.toRadians(lat1)))
						.multiply(BigDecimal.valueOf(Math.cos(Math.toRadians(lat2))))
						.multiply(BigDecimal.valueOf(Math.sin(dLon.doubleValue() / 2)).pow(2)));
		BigDecimal c = BigDecimal.valueOf(2)
				.multiply(BigDecimal.valueOf(Math.atan2(Math.sqrt(a.doubleValue()), Math.sqrt(1 - a.doubleValue()))));

		return BigDecimal.valueOf(EARTH_RADIUS).multiply(c);
	}
}