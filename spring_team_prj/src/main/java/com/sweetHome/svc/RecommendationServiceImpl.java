package com.sweetHome.svc;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationServiceImpl implements RecommendationService {
    
    @Autowired
    private ExternalDataService externalDataService;
    
    @Override
    public List<Map<String, Object>> getRecommendations(double latitude, double longitude, Map<String, Integer> preferences) {
        // 외부 데이터 서비스에서 모든 구의 데이터를 가져옵니다.
        List<Map<String, Object>> districtsData = externalDataService.getDistrictsData();
        List<Map<String, Object>> recommendations = new ArrayList<>();
        
        // 각 구에 대해 점수를 계산하고 결과 리스트에 추가합니다.
        for (Map<String, Object> district : districtsData) {
            double score = calculateScore(district, preferences, latitude, longitude);
            district.put("score", score);  // 계산된 점수를 구 데이터에 추가합니다.
            recommendations.add(district);
        }
        
        // 점수를 기준으로 내림차순 정렬합니다. (높은 점수가 먼저 오도록)
        recommendations.sort((a, b) -> Double.compare((Double)b.get("score"), (Double)a.get("score")));
        
        // 상위 5개(또는 전체 결과가 5개 미만이면 전체)를 반환합니다.
        return recommendations.subList(0, Math.min(5, recommendations.size()));
    }
    
    private double calculateScore(Map<String, Object> district, Map<String, Integer> preferences, double targetLat, double targetLon) {
        double score = 0;
        double districtLat = (double) district.get("latitude");
        double districtLon = (double) district.get("longitude");
        
        // 목적지와 구 사이의 거리를 계산합니다.
        double distance = calculateDistance(targetLat, targetLon, districtLat, districtLon);
        
        // 거리 점수: 5km 이내일 때 최고 점수, 거리가 멀어질수록 점수 감소
        score += (5 - distance / 1000) * preferences.get("distance");
        
        // 대중교통 점수: 구의 대중교통 점수와 사용자 선호도를 곱합니다.
        score += (int)district.get("publicTransport") * preferences.get("publicTransport");
        
        // 인구 점수: 중간 값(3)에 가까울수록 높은 점수, 사용자 선호도를 곱합니다.
        score += (5 - Math.abs(3 - (int)district.get("population"))) * preferences.get("population");
        
        // 치안 점수: 구의 치안 점수와 사용자 선호도를 곱합니다.
        score += (int)district.get("security") * preferences.get("security");
        
        return score;
    }
    
    private double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        // Haversine 공식을 사용하여 두 지점 사이의 거리를 계산합니다.
        // 지구를 완벽한 구로 가정하고 계산하는 방식입니다.
        
        double R = 6371; // 지구의 반경 (km)
        double dLat = Math.toRadians(lat2 - lat1);  // 위도 차이
        double dLon = Math.toRadians(lon2 - lon1);  // 경도 차이
        
        // Haversine 공식
        double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLon/2) * Math.sin(dLon/2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        
        // 최종 거리 계산 (km 단위)
        return R * c;
    }
}