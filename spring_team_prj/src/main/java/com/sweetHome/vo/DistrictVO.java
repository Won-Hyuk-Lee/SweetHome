package com.sweetHome.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

/**
 * 자치구 정보를 담는 Value Object 클래스
 * 
 * 이 클래스는 자치구의 기본 정보를 저장하고 전달하는 데 사용됩니다.
 */
@Component
@Data
public class DistrictVO {
    /**
     * 자치구 코드
     */
    private String districtCode;
    
    /**
     * 자치구명
     */
    private String districtName;
    
    /**
     * 자치구의 위도
     */
    private double latitude;
    
    /**
     * 자치구의 경도
     */
    private double longitude;
}