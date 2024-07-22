package com.sweetHome.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DistrictVO {
	private String districtCode; //자치구 코드
    private String districtName; //자치구명
    private double latitude; //위도
    private double longitude; //경도
}
