package com.sweetHome.svc;

/**
 * 지도 관련 서비스 인터페이스
 * 
 * 이 인터페이스는 지도와 관련된 비즈니스 로직을 정의합니다.
 */
public interface MapService {
    
    /**
     * 특정 자치구의 정보를 조회합니다.
     * 
     * @param district 정보를 조회할 자치구 이름
     * @return 자치구 정보 (문자열 형태)
     */
    String getDistrictInfo(String district);
}