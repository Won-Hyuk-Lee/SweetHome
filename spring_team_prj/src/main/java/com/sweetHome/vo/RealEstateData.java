package com.sweetHome.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class RealEstateData {
	private String district;
	private double price;
	private double area;
	private double pricePerArea;

}