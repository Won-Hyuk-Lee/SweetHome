package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;


/**
 * 추천 서비스 구현 클래스
 * 사용자의 선택을 바탕으로 적합한 자치구를 추천하는 로직구현부
 */
@Service
public class RecommendServiceImpl implements RecommendService {
    @Autowired
    private RecommendMapper recommendMapper;
    @Autowired
    private DataFetchService dataFetchService;
    
    //지구의 반지름(km)
    private static final double EARTH_RADIUS = 6371;

    /**
     * 사용자 선택을 바탕으로 추천자치구목록 반환
     *
     * @param districtName 사용자가 선택한 자치구 이름
     * @param latitude 사용자가 선택한 위치의 위도
     * @param longitude 사용자가 선택한 위치의 경도
     * @param distanceImportance 거리 중요도 (1-5)
     * @param safetyImportance 안전 중요도 (1-5)
     * @return 추천된 자치구 이름 목록
     */
    @Override
    public List<String> getRecommendations(String districtName, double latitude, double longitude,
            int distanceImportance, int safetyImportance) {
        //자치구 정보 조회
        List<DistrictVO> allDistricts = dataFetchService.getAllDistrictsFromDB();

        //목적지와 각 자치구의 중심 거리 계산
        Map<String, Double> distanceMap = calculateDistancesToDistricts(latitude, longitude, allDistricts);
        
        //거리 중요도에 따라 필터링
        Map<String, Double> filteredDistanceMap = filterDistanceMap(distanceMap, distanceImportance);

        //필터링된 지역들의 점수 계산
        Map<String, Double> scoreMap = calculateScores(filteredDistanceMap, safetyImportance);

        //추천 지역 목록 생성
        List<String> recommendations = getRecommendationsFromScoreMap(scoreMap);

        //추천 지역이 없을 경우 원래 지역을 반환
        if (recommendations.isEmpty()) {
            recommendations.add(districtName);
        }

        return recommendations;
    }
    
    /**
     * 전체 점수 계산 메서드
     * 현재는 안전 점수만 반영하나, 다른 요소들을 추가가능.
     *
     * @param filteredDistanceMap 거리로 필터링된 자치구 맵
     * @param safetyImportance 안전 중요도
     * @return 각 자치구의 최종 점수 맵
     */
    private Map<String, Double> calculateScores(Map<String, Double> filteredDistanceMap, int safetyImportance) {
        Map<String, Double> safetyScores = calculateSafetyScores(filteredDistanceMap);
        
        Map<String, Double> totalScoreMap = new HashMap<>();
        for (String districtCode : filteredDistanceMap.keySet()) {
            double safetyScore = safetyScores.getOrDefault(districtCode, 0.0);
            
            double safetyMultiplier = getSafetyMultiplier(safetyImportance);
            
            double totalScore = safetyScore * safetyMultiplier;
            
            totalScoreMap.put(districtCode, totalScore);
        }
        
        return totalScoreMap;
    }
    
    /**
     * 안전 점수 계산 메서드
     *
     * @param filteredDistanceMap 거리로 필터링된 자치구 맵
     * @return 각 자치구의 안전 점수 맵
     */
    private Map<String, Double> calculateSafetyScores(Map<String, Double> filteredDistanceMap) {
        //각 자치구 5대 범죄 총합, 단위면적당 CCTV설치, 인구 데이터를 가져옴
        Map<String, Double> crimeMap = dataFetchService.getCrimeTotalByDistrict();
        Map<String, Double> cctvMap = dataFetchService.getCCTVDensityByDistrict();
        Map<String, Double> populationMap = dataFetchService.getPopulationByDistrict();

        Map<String, Double> crimeRateMap = new HashMap<>();
        Map<String, Double> cctvDensityMap = new HashMap<>();

        //각 지역의 단위 인구당 범죄율과 단위 면적당 CCTV수 계산
        for (String districtCode : filteredDistanceMap.keySet()) {
            Double crimeTotal = crimeMap.get(districtCode);
            Double cctvDensity = cctvMap.get(districtCode);
            Double population = populationMap.get(districtCode);

            if (crimeTotal == null || cctvDensity == null || population == null || population == 0) {
                continue;
            }

            double crimeRate = crimeTotal / population;
            crimeRateMap.put(districtCode, crimeRate);
            cctvDensityMap.put(districtCode, cctvDensity);
        }

        //범죄율이 낮은 순으로, CCTV 밀도가 높은 순으로 지역 순위를 매김
        //CCTV수가 많다는 것은 범죄가 많이 일어나는 것과 어느정도 관련성이 있음.
        List<String> crimeRateRanking = rankDistricts(crimeRateMap, false);
        List<String> cctvDensityRanking = rankDistricts(cctvDensityMap, true);

        Map<String, Double> safetyScoreMap = new HashMap<>();
        for (String districtCode : filteredDistanceMap.keySet()) {
            int crimeRateRank = crimeRateRanking.indexOf(districtCode) + 1;
            int cctvDensityRank = cctvDensityRanking.indexOf(districtCode) + 1;
            double crimeRateScore = calculateRankScore(crimeRateRank);
            double cctvDensityScore = calculateRankScore(cctvDensityRank);

            double safetyScore = (crimeRateScore + cctvDensityScore) / 2;
            safetyScoreMap.put(districtCode, safetyScore);
        }

        return safetyScoreMap;
    }

    /**
     * 안전 중요도에 따른 배율 반환 메서드
     *
     * @param safetyImportance 안전 중요도 (1-5)
     * @return 안전 중요도에 따른 배율
     */
    private double getSafetyMultiplier(int safetyImportance) {
        switch (safetyImportance) {
        case 1:
            return 0.3;
        case 2:
            return 0.5;
        case 3:
            return 1.0;
        case 4:
            return 1.2;
        case 5:
            return 1.5;
        default:
            return 1.0;
        }
    }

    /**
     * 지역을 주어진 기준에 따라 순위를 매기는 메서드
     *
     * @param dataMap 순위를 매길 데이터 맵
     * @param ascending true일 경우 오름차순, false일 경우 내림차순으로 정렬
     * @return 순위가 매겨진 지역 코드 리스트
     */
    private List<String> rankDistricts(Map<String, Double> dataMap, boolean ascending) {
        List<Map.Entry<String, Double>> list = new ArrayList<>(dataMap.entrySet());
        if (ascending) {
            list.sort(Map.Entry.comparingByValue());
        } else {
            list.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));
        }
        List<String> result = new ArrayList<>();
        for (Map.Entry<String, Double> entry : list) {
            result.add(entry.getKey());
        }
        return result;
    }

    /**
     * 순위에 따른 점수를 계산하는 메서드
     * 1등지역은 25점 ~ 25등 지역은 1점
     *
     * @param rank 순위
     * @return 계산된 점수
     */
    private double calculateRankScore(int rank) {
        return 26 - rank;
    }

    /**
     * 점수 맵에서 상위 5개 지역을 추출하는 메서드
     *
     * @param scoreMap 각 지역의 점수 맵
     * @return 추천된 지역 이름 리스트
     */
    private List<String> getRecommendationsFromScoreMap(Map<String, Double> scoreMap) {
        Map<String, String> districtCodeToNameMap = dataFetchService.getDistrictCodeToNameMap();

        List<Map.Entry<String, Double>> sortedEntries = new ArrayList<>(scoreMap.entrySet());
        sortedEntries.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));

        List<String> recommendations = new ArrayList<>();
        for (int i = 0; i < Math.min(5, sortedEntries.size()); i++) {
            String code = sortedEntries.get(i).getKey();
            recommendations.add(districtCodeToNameMap.getOrDefault(code, "Unknown District: " + code));
        }
        return recommendations;
    }

    /**
     * 거리 중요도에 따라 지역 필터링 메서드
     *
     * @param distanceMap 각 지역까지의 거리 맵
     * @param distanceImportance 거리 중요도 (1-5)
     * @return 필터링된 거리 맵
     */
    private Map<String, Double> filterDistanceMap(Map<String, Double> distanceMap, int distanceImportance) {
        double maxDistance;
        switch (distanceImportance) {
        case 5:
            maxDistance = 1.5; //도보 10분 이내
            break;
        case 4:
            maxDistance = 3.0; //대중교통 10분 이내
            break;
        case 3:
            maxDistance = 5.0; //대중교통 30분 이내
            break;
        case 2:
            maxDistance = 15.0; //대중교통 1시간 이내
            break;
        default:
            return distanceMap; //그외
        }

        Map<String, Double> filteredMap = new HashMap<>();
        for (Map.Entry<String, Double> entry : distanceMap.entrySet()) {
            if (entry.getValue() <= maxDistance) {
                filteredMap.put(entry.getKey(), entry.getValue());
            }
        }
        return filteredMap;
    }

    /**
     * 입력된 위치와 각 지역 간의 거리 계산 메서드
     *
     * @param destLatitude 목적지 위도
     * @param destLongitude 목적지 경도
     * @param allDistricts 모든 자치구 정보 리스트
     * @return 각 지역까지의 거리 맵
     */
    private Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude,
            List<DistrictVO> allDistricts) {
        Map<String, Double> distanceMap = new HashMap<>();
        for (DistrictVO district : allDistricts) {
            try {
                double distance = calculateHaversineDistance(destLatitude, destLongitude, district.getLatitude(),
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

    /**
     * 두 지점 간의 거리를 계산하는 하버사인 공식 메서드
     * 하버사인 공식은 지구를 완벽한 구로 가정하고 계산하는 방식으로,
     * 중위도의 지역일수록, 지역의 높이 편차가 크지 않을수록 정확해집니다.
     * 한국은 중위도 구역이고 서울은 대체로 평지이므로 오차범위가 수 미터 이내로 예상
     *
     * @param lat1 시작점 위도
     * @param lon1 시작점 경도
     * @param lat2 도착점 위도
     * @param lon2 도착점 경도
     * @return 두 지점 간의 거리 (km)
     */
    private double calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        return EARTH_RADIUS * c;
    }
}