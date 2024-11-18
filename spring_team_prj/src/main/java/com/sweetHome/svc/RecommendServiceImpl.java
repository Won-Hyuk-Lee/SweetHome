package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.vo.DistrictVO;

/**
 * 추천 서비스 구현 클래스
 * 
 * 이 클래스는 RecommendService 인터페이스를 구현하여 실제 추천 로직을 제공합니다.
 * 사용자의 선호도와 다양한 데이터를 기반으로 최적의 자치구를 추천합니다.
 */
@Service
public class RecommendServiceImpl implements RecommendService {

    /**
     * 지구의 반지름 (km)
     */
    private static final double EARTH_RADIUS = 6371;

    /**
     * 데이터 조회 서비스
     */
    @Autowired
    private DataFetchService dataFetchService;

    /**
     * 사용자의 선호도에 따라 자치구를 추천합니다.
     * 
     * @param districtName 기준 자치구 이름
     * @param latitude 기준 위치의 위도
     * @param longitude 기준 위치의 경도
     * @param distanceImportance 거리의 중요도 (1-5)
     * @param safetyImportance 안전의 중요도 (1-5)
     * @param realEstateImportance 부동산 가격의 중요도 (1-5)
     * @return 추천된 자치구 이름 리스트
     */
    @Override
    public List<String> getRecommendations(String districtName, double latitude, double longitude,
            int distanceImportance, int safetyImportance, int realEstateImportance) {
        // 모든 자치구 정보 조회
        List<DistrictVO> allDistricts = dataFetchService.getAllDistrictsFromDB();
        
        // 각 자치구까지의 거리 계산
        Map<String, Double> distanceMap = calculateDistancesToDistricts(latitude, longitude, allDistricts);
        System.out.println("거리 맵: " + distanceMap);

        // 거리 기준으로 필터링
        Map<String, Double> filteredDistanceMap = filterDistanceMap(distanceMap, distanceImportance);
        System.out.println("필터링된 거리 맵 (중요도: " + distanceImportance + "): " + filteredDistanceMap);

        // 안전 점수 계산
        Map<String, Double> safetyScores = calculateSafetyScores(filteredDistanceMap);
        System.out.println("안전 점수: " + safetyScores);

        // 부동산 점수 계산
        Map<String, Double> realEstateScores = calculateRealEstateScores(dataFetchService.getRealEstateAveragePrices());
        System.out.println("부동산 점수: " + realEstateScores);

        // 최종 점수 계산
        Map<String, Double> totalScoreMap = calculateScores(filteredDistanceMap, safetyScores, realEstateScores,
                safetyImportance, realEstateImportance);
        System.out.println("총점 (안전 중요도: " + safetyImportance + ", 부동산 중요도: "
                + realEstateImportance + "): " + totalScoreMap);

        // 추천 결과 생성
        List<String> recommendations = getRecommendationsFromScoreMap(totalScoreMap);
        System.out.println("최종 추천 결과: " + recommendations);

        return recommendations;
    }

    /**
     * 기준 위치로부터 각 자치구까지의 거리를 계산합니다.
     * 
     * @param destLatitude 기준 위치의 위도
     * @param destLongitude 기준 위치의 경도
     * @param allDistricts 모든 자치구 정보
     * @return 자치구 코드를 키로, 거리를 값으로 하는 맵
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
                        district.getDistrictName() + "까지의 거리 계산 중 오류 발생: " + e.getMessage());
            }
        }
        return distanceMap;
    }

    /**
     * 두 지점 간의 Haversine 거리를 계산합니다.
     * 
     * @param lat1 첫 번째 지점의 위도
     * @param lon1 첫 번째 지점의 경도
     * @param lat2 두 번째 지점의 위도
     * @param lon2 두 번째 지점의 경도
     * @return 두 지점 간의 거리 (km)
     */
    private double calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1))
                * Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return EARTH_RADIUS * c;
    }

    /**
     * 거리 맵을 필터링합니다. 사용자의 거리 중요도에 따라 최대 거리를 설정합니다.
     * 
     * @param distanceMap 원본 거리 맵
     * @param distanceImportance 거리 중요도 (1-5)
     * @return 필터링된 거리 맵
     */
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
            return distanceMap; // 서울 전체
        }

        return distanceMap.entrySet().stream().filter(entry -> entry.getValue() <= maxDistance)
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }

    /**
     * 각 자치구의 안전 점수를 계산합니다.
     * 
     * @param filteredDistanceMap 필터링된 거리 맵
     * @return 자치구 코드를 키로, 안전 점수를 값으로 하는 맵
     */
    private Map<String, Double> calculateSafetyScores(Map<String, Double> filteredDistanceMap) {
        Map<String, Double> crimeMap = dataFetchService.getCrimeTotalByDistrict();
        Map<String, Double> cctvMap = dataFetchService.getCCTVDensityByDistrict();
        Map<String, Double> populationMap = dataFetchService.getPopulationByDistrict();

        Map<String, Double> crimeRateMap = new HashMap<>();
        Map<String, Double> cctvDensityMap = new HashMap<>();

        for (String districtCode : filteredDistanceMap.keySet()) {
            Double crimeTotal = crimeMap.get(districtCode);
            Double cctvDensity = cctvMap.get(districtCode);
            Double population = populationMap.get(districtCode);

            if (crimeTotal != null && cctvDensity != null && population != null && population != 0) {
                crimeRateMap.put(districtCode, crimeTotal / population);
                cctvDensityMap.put(districtCode, cctvDensity);
            }
        }

        List<String> crimeRateRanking = rankDistricts(crimeRateMap, false);
        List<String> cctvDensityRanking = rankDistricts(cctvDensityMap, true);

        Map<String, Double> safetyScoreMap = new HashMap<>();
        for (String districtCode : filteredDistanceMap.keySet()) {
            int crimeRateRank = crimeRateRanking.indexOf(districtCode) + 1;
            int cctvDensityRank = cctvDensityRanking.indexOf(districtCode) + 1;
            double crimeRateScore = calculateRankScore(crimeRateRank);
            double cctvDensityScore = calculateRankScore(cctvDensityRank);

            safetyScoreMap.put(districtCode, (crimeRateScore + cctvDensityScore) / 2);
        }

        return safetyScoreMap;
    }

    /**
     * 부동산 가격 점수를 계산합니다.
     * 
     * @param averagePrices 각 자치구의 평균 부동산 가격
     * @return 자치구 코드를 키로, 부동산 가격 점수를 값으로 하는 맵
     */
    private Map<String, Double> calculateRealEstateScores(Map<String, Double> averagePrices) {
        List<Map.Entry<String, Double>> sortedPrices = new ArrayList<>(averagePrices.entrySet());
        sortedPrices.sort(Map.Entry.comparingByValue());

        Map<String, Double> scores = new HashMap<>();
        for (int i = 0; i < sortedPrices.size(); i++) {
            String district = sortedPrices.get(i).getKey();
            double score = (sortedPrices.size() - i) / (double) sortedPrices.size() * 100;
            scores.put(district, score);
        }
        return scores;
    }

    /**
     * 최종 점수를 계산합니다.
     * 
     * @param filteredDistanceMap 필터링된 거리 맵
     * @param safetyScores 안전 점수 맵
     * @param realEstateScores 부동산 가격 점수 맵
     * @param safetyImportance 안전 중요도 (1-5)
     * @param realEstateImportance 부동산 가격 중요도 (1-5)
     * @return 자치구 코드를 키로, 최종 점수를 값으로 하는 맵
     */
    private Map<String, Double> calculateScores(Map<String, Double> filteredDistanceMap,
            Map<String, Double> safetyScores, Map<String, Double> realEstateScores, int safetyImportance,
            int realEstateImportance) {
        Map<String, Double> totalScoreMap = new HashMap<>();
        for (String districtCode : filteredDistanceMap.keySet()) {
            double safetyScore = safetyScores.getOrDefault(districtCode, 0.0);
            double realEstateScore = realEstateScores.getOrDefault(districtCode, 0.0);

            double safetyMultiplier = getSafetyMultiplier(safetyImportance);
            double realEstateMultiplier = getRealEstateMultiplier(realEstateImportance);

            double totalScore = (safetyScore * safetyMultiplier + realEstateScore * realEstateMultiplier)
                    / (safetyMultiplier + realEstateMultiplier);

            totalScoreMap.put(districtCode, totalScore);
        }
        return totalScoreMap;
    }

    /**
     * 안전 중요도에 따른 가중치를 반환합니다.
     * 
     * @param safetyImportance 안전 중요도 (1-5)
     * @return 안전 가중치
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
     * 부동산 가격 중요도에 따른 가중치를 반환합니다.
     * 
     * @param realEstateImportance 부동산 가격 중요도 (1-5)
     * @return 부동산 가격 가중치
     */
    private double getRealEstateMultiplier(int realEstateImportance) {
        switch (realEstateImportance) {
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
     * 자치구들을 특정 기준에 따라 순위를 매깁니다.
     * 
     * @param dataMap 순위를 매길 데이터 맵
     * @param ascending 오름차순 정렬 여부
     * @return 순위가 매겨진 자치구 코드 리스트
     */
    private List<String> rankDistricts(Map<String, Double> dataMap, boolean ascending) {
        List<Map.Entry<String, Double>> list = new ArrayList<>(dataMap.entrySet());
        if (ascending) {
            list.sort(Map.Entry.comparingByValue());
        } else {
            list.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));
        }
        return list.stream().map(Map.Entry::getKey).collect(Collectors.toList());
    }

    /**
     * 순위에 따른 점수를 계산합니다.
     * 
     * @param rank 순위
     * @return 계산된 점수
     */
    private double calculateRankScore(int rank) {
        return Math.max(26 - rank, 1);
    }

    /**
     * 최종 점수 맵에서 추천 결과를 생성합니다.
     * 
     * @param scoreMap 최종 점수 맵
     * @return 추천된 자치구 이름 리스트
     */
    private List<String> getRecommendationsFromScoreMap(Map<String, Double> scoreMap) {
        Map<String, String> districtCodeToNameMap = dataFetchService.getDistrictCodeToNameMap();

        List<Map.Entry<String, Double>> sortedEntries = new ArrayList<>(scoreMap.entrySet());
        sortedEntries.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));

        List<String> recommendations = new ArrayList<>();
        for (int i = 0; i < Math.min(5, sortedEntries.size()); i++) {
            String code = sortedEntries.get(i).getKey();
            recommendations.add(districtCodeToNameMap.getOrDefault(code, "알 수 없는 자치구: " + code));
        }
        return recommendations;
    }
}