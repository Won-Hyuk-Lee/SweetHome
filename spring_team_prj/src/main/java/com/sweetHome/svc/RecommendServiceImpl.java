package com.sweetHome.svc;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

	private static final double EARTH_RADIUS = 6371;

	@Override
	public List<String> getRecommendations(String districtName, double latitude, double longitude,
			int distanceImportance, int safetyImportance) {
		System.out.println(
				"getRecommendations called with: district=" + districtName + ", safetyImportance=" + safetyImportance);

		List<DistrictVO> allDistricts = dataFetchService.getAllDistrictsFromDB();
		System.out.println("Fetched " + allDistricts.size() + " districts from DB");

		Map<String, Double> distanceMap = calculateDistancesToDistricts(latitude, longitude, allDistricts);
		Map<String, Double> filteredDistanceMap = filterDistanceMap(distanceMap, distanceImportance);

		Map<String, Double> scoreMap = calculateScores(filteredDistanceMap, safetyImportance);
		System.out.println("Final Score Map: " + scoreMap);

		List<String> recommendations = getRecommendationsFromScoreMap(scoreMap);

		if (recommendations.isEmpty()) {
			recommendations.add(districtName);
			System.out.println("No recommendations found. Returning original district: " + districtName);
		}

		System.out.println("Final Recommendations: " + recommendations);
		return recommendations;
	}

	private Map<String, Double> calculateScores(Map<String, Double> filteredDistanceMap, int safetyImportance) {
		System.out.println("Calculating scores for " + filteredDistanceMap.size() + " districts");

		Map<String, Integer> crimeMap = dataFetchService.getCrimeTotalByDistrict();
		System.out.println("추천서비스구현체에서 크라임 맵은 = " + crimeMap);
		Map<String, Double> cctvMap = dataFetchService.getCCTVDensityByDistrict();
		System.out.println(cctvMap);
		Map<String, Integer> populationMap = dataFetchService.getPopulationByDistrict();
		System.out.println(populationMap);

		Map<String, Double> crimeRateMap = new HashMap<>();
		Map<String, Double> cctvDensityMap = new HashMap<>();

		for (String districtCode : filteredDistanceMap.keySet()) {
			Integer crimeTotal = crimeMap.get(districtCode);
			Double cctvDensity = cctvMap.get(districtCode);
			Integer population = populationMap.get(districtCode);

			if (crimeTotal == null || cctvDensity == null || population == null || population == 0) {
				System.out.println("Missing or invalid data for district: " + districtCode);
				continue;
			}

			double crimeRate = (double) crimeTotal / population;
			crimeRateMap.put(districtCode, crimeRate);
			cctvDensityMap.put(districtCode, cctvDensity);

			System.out.println(
					"District: " + districtCode + ", Crime Rate: " + crimeRate + ", CCTV Density: " + cctvDensity);
		}

		List<String> crimeRateRanking = rankDistricts(crimeRateMap, false);
		List<String> cctvDensityRanking = rankDistricts(cctvDensityMap, false);

		System.out.println("Crime Rate Ranking: " + crimeRateRanking);
		System.out.println("CCTV Density Ranking: " + cctvDensityRanking);

		Map<String, Double> scoreMap = new HashMap<>();
		for (String districtCode : filteredDistanceMap.keySet()) {
			int crimeRateRank = crimeRateRanking.indexOf(districtCode) + 1;
			int cctvDensityRank = cctvDensityRanking.indexOf(districtCode) + 1;
			double crimeRateScore = calculateRankScore(crimeRateRank);
			double cctvDensityScore = calculateRankScore(cctvDensityRank);
			double totalScore = (crimeRateScore + cctvDensityScore) / 2 * safetyImportance;
			scoreMap.put(districtCode, totalScore);

			System.out.println("District: " + districtCode + ", Crime Rank: " + crimeRateRank + ", CCTV Rank: "
					+ cctvDensityRank + ", Total Score: " + totalScore);
		}

		return scoreMap;
	}

	private List<String> rankDistricts(Map<String, Double> dataMap, boolean ascending) {
		return dataMap.entrySet().stream()
				.sorted(ascending ? Map.Entry.comparingByValue()
						: Map.Entry.comparingByValue(Comparator.reverseOrder()))
				.map(Map.Entry::getKey).collect(Collectors.toList());
	}

	private double calculateRankScore(int rank) {
		return 26 - rank;
	}

	private List<String> getRecommendationsFromScoreMap(Map<String, Double> scoreMap) {
		Map<String, String> districtCodeToNameMap = dataFetchService.getDistrictCodeToNameMap();

		List<String> topDistrictCodes = scoreMap.entrySet().stream()
				.sorted(Map.Entry.<String, Double>comparingByValue().reversed()).limit(5).map(Map.Entry::getKey)
				.collect(Collectors.toList());

		List<String> recommendations = topDistrictCodes.stream()
				.map(code -> districtCodeToNameMap.getOrDefault(code, "Unknown District: " + code))
				.collect(Collectors.toList());

		System.out.println("Top 5 District Codes: " + topDistrictCodes);
		System.out.println("Recommendations: " + recommendations);

		return recommendations;
	}

	// 거리 중요도에 따른 자치구 필터링
	private Map<String, Double> filterDistanceMap(Map<String, Double> distanceMap, int distanceImportance) {
		double maxDistance;
		switch (distanceImportance) {
		case 5:
			maxDistance = 1.5; // 도보 10분 이내
			break;
		case 4:
			maxDistance = 3.0; // 대중교통 10분 이내
			break;
		case 3:
			maxDistance = 5.0; // 대중교통 30분 이내
			break;
		case 2:
			maxDistance = 15.0; // 대중교통 1시간 이내
			break;
		default:
			return distanceMap; // 1인 경우 또는 그 외의 경우 모든 결과 반환
		}

		return distanceMap.entrySet().stream().filter(entry -> entry.getValue() <= maxDistance)
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	// 목적지로부터 각 자치구까지의 거리 계산
	private Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude,
			List<DistrictVO> allDistricts) {
		Map<String, Double> distanceMap = new HashMap<>();
		for (DistrictVO district : allDistricts) {
			try {
				double distance = calculateHaversineDistance(destLatitude, destLongitude, district.getLatitude(),
						district.getLongitude());
				distanceMap.put(district.getDistrictName(), distance);
			} catch (Exception e) {
				System.err.println(
						"Error calculating distance for " + district.getDistrictName() + ": " + e.getMessage());
				e.printStackTrace();
			}
		}
		return distanceMap;
	}

	// 하버사인 공식을 사용한 두 지점 간 거리 계산
	private double calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {

		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);
		lat1 = Math.toRadians(lat1);
		lat2 = Math.toRadians(lat2);

		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
				+ Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

		double distance = EARTH_RADIUS * c;
		return distance;
	}
}