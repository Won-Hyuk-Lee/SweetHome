package com.sweetHome.mapper;

/**
 * 지도 관련 데이터베이스 매퍼 인터페이스
 * 
 * 이 인터페이스는 지도 관련 데이터를 데이터베이스에서 조회하는 메서드를 정의합니다.
 */
public interface MapMapper {
    
    /**
     * 지정된 자치구의 정보를 조회합니다.
     * 
     * @param district 조회할 자치구의 이름
     * @return 자치구 정보 (문자열 형태)
     */
    String selectDistrictInfo(String district);
}