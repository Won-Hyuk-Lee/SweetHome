package com.sweetHome.svc;

import java.util.List;

/**
 * 추천 서비스 인터페이스
 * 
 * 이 인터페이스는 사용자에게 자치구를 추천하는 비즈니스 로직을 정의합니다.
 */
public interface RecommendService {
    
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
    List<String> getRecommendations(String districtName, double latitude, double longitude, int distanceImportance,
            int safetyImportance, int realEstateImportance);
}