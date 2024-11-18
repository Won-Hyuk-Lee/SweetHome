package com.sweetHome.vo;

import lombok.Data;

/**
 * 부동산 데이터를 담는 Value Object 클래스
 * 
 * 이 클래스는 부동산 정보를 저장하고 전달하는 데 사용됩니다.
 */
@Data
public class RealEstateData {
    /**
     * 자치구 이름
     */
    private String district;
    
    /**
     * 부동산 가격
     */
    private double price;
    
    /**
     * 부동산 면적
     */
    private double area;
    
    /**
     * 단위 면적당 가격
     */
    private double pricePerArea;
}