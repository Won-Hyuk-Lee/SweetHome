package com.sweetHome.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

@Service
public class RecommendServiceImpl implements RecommendService {
    
    @Autowired
    private RecommendMapper recommendMapper;

    // 지구반지름(km)
    private static final double EARTH_RADIUS = 6371; 

    /**
     * 주어진 목적지 좌표로부터 모든 자치구까지의 거리를 계산
     *
     * @param destLatitude 목적지의 위도
     * @param destLongitude 목적지의 경도
     * @return 각 자치구 이름과 그 거리를 포함하는 Map
     */
    @Override
    public Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude) {
        List<DistrictVO> districts = recommendMapper.getAllDistricts();
        
        Map<String, Double> distanceMap = new HashMap<>();

        // 각 자치구에 대해 거리 계산
        for (DistrictVO district : districts) {
            // 하버사인 공식을 사용하여 목적지와 자치구 중심 간의 거리 계산
            double distance = calculateHaversineDistance(destLatitude, destLongitude, 
                                                         district.getLatitude(), district.getLongitude());
            
            // 계산된 거리를 Map에 저장 (키: 자치구 이름, 값: 거리)
            distanceMap.put(district.getDistrictName(), distance);
        }

        // 계산된 거리 Map 반환
        return distanceMap;
    }

    /**
     * 두 지점 간의 거리를 하버사인 공식을 사용하여 계산합니다.
     *
     * @param lat1 첫 번째 지점의 위도
     * @param lon1 첫 번째 지점의 경도
     * @param lat2 두 번째 지점의 위도
     * @param lon2 두 번째 지점의 경도
     * @return 두 지점 간의 거리 (단위: km)
     */
    private double calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {
    	// 하버사인 공식이란 지구를 완벽한 구체라고 가정하고 위도와 경도를 가지고 계산하는 공식으로
    	// 중위도이고 평지가 많은 한국에서 사용하기 적합하며 서울로 한정할경우 남산을 제외하고는 오차가 거의 없다.
        // 위도와 경도의 차이를 라디안으로 변환
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        
        // 위도를 라디안으로 변환
        lat1 = Math.toRadians(lat1);
        lat2 = Math.toRadians(lat2);

        // 하버사인 공식
        double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                   Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        
        // 최종 거리
        return EARTH_RADIUS * c;
    }
}