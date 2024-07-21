package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
    
    // 지구반지름(km)
    private static final double EARTH_RADIUS = 6371;

    @Override
    public List<String> getRecommendations(String districtName, double latitude, double longitude, int distanceImportance) {
        System.out.println("getRecommendations called with: district=" + districtName + ", lat=" + latitude + ", lon=" + longitude + ", importance=" + distanceImportance);
        
        List<DistrictVO> allDistricts = dataFetchService.getAllDistrictsFromDB();
        System.out.println("Fetched " + allDistricts.size() + " districts from DB");
        
        // 각 지구의 정보 출력
        for (DistrictVO district : allDistricts) {
            System.out.println("District: " + district.getDistrictName() + ", Lat: " + district.getLatitude() + ", Lon: " + district.getLongitude());
        }

        Map<String, Double> distanceMap = calculateDistancesToDistricts(latitude, longitude, allDistricts);
        System.out.println("Distance Map: " + distanceMap);
        
        // 거리가 가장 가까운 5개 자치구 이름 반환 (Java 7 compatible)
        List<Map.Entry<String, Double>> sortedEntries = new ArrayList<>(distanceMap.entrySet());
        Collections.sort(sortedEntries, new Comparator<Map.Entry<String, Double>>() {
            @Override
            public int compare(Map.Entry<String, Double> e1, Map.Entry<String, Double> e2) {
                return e1.getValue().compareTo(e2.getValue());
            }
        });

        List<String> recommendations = new ArrayList<>();
        for (int i = 0; i < Math.min(5, sortedEntries.size()); i++) {
            recommendations.add(sortedEntries.get(i).getKey());
        }

        System.out.println("Recommendations: " + recommendations);
        return recommendations;
    }

    @Override
    public Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude, List<DistrictVO> allDistricts) {
        Map<String, Double> distanceMap = new HashMap<>();
        for (DistrictVO district : allDistricts) {
            try {
                double distance = calculateHaversineDistance(destLatitude, destLongitude, district.getLatitude(), district.getLongitude());
                System.out.println("Calculated distance to " + district.getDistrictName() + ": " + distance);
                distanceMap.put(district.getDistrictName(), distance);
            } catch (Exception e) {
                System.err.println("Error calculating distance for " + district.getDistrictName() + ": " + e.getMessage());
                e.printStackTrace();
            }
        }
        return distanceMap;
    }

    private double calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {
        System.out.println("Calculating distance between (" + lat1 + "," + lon1 + ") and (" + lat2 + "," + lon2 + ")");
        
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        lat1 = Math.toRadians(lat1);
        lat2 = Math.toRadians(lat2);
        
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        
        double distance = EARTH_RADIUS * c;
        System.out.println("Calculated distance: " + distance + " km");
        return distance;
    }
}