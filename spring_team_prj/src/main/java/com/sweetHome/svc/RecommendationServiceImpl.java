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
        List<Map<String, Object>> districtsData = externalDataService.getDistrictsData();
        List<Map<String, Object>> recommendations = new ArrayList<>();

        for (Map<String, Object> district : districtsData) {
            double score = calculateScore(district, preferences, latitude, longitude);
            district.put("score", score);
            recommendations.add(district);
        }

        recommendations.sort((a, b) -> Double.compare((Double)b.get("score"), (Double)a.get("score")));
        return recommendations.subList(0, Math.min(5, recommendations.size()));
    }

    private double calculateScore(Map<String, Object> district, Map<String, Integer> preferences, double targetLat, double targetLon) {
        double score = 0;
        double districtLat = (double) district.get("latitude");
        double districtLon = (double) district.get("longitude");
        
        double distance = calculateDistance(targetLat, targetLon, districtLat, districtLon);
        score += (5 - distance / 1000) * preferences.get("distance"); // 거리 점수 (5km 이내 만점)

        score += (int)district.get("publicTransport") * preferences.get("publicTransport");
        score += (5 - Math.abs(3 - (int)district.get("population"))) * preferences.get("population"); // 인구 중간값이 가장 높은 점수
        score += (int)district.get("security") * preferences.get("security");

        return score;
    }

    private double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        // Haversine formula
        double R = 6371; // Earth's radius in km
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLon/2) * Math.sin(dLon/2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        return R * c;
    }
}