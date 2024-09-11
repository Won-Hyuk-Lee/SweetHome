package com.sweetHome.test;

import java.util.List;
import java.util.Map;

import com.sweetHome.svc.DataFetchServiceImpl;
import com.sweetHome.vo.RealEstateData;

public class DataCallTest {
	public static void main(String[] args) {
		DataFetchServiceImpl service = new DataFetchServiceImpl(null); // RecommendMapper는 null로 설정

		// 데이터 가져오기 시간 측정
		long startTime = System.currentTimeMillis();
		List<RealEstateData> data = service.fetchRealEstateData();
		long endTime = System.currentTimeMillis();
		long fetchDuration = endTime - startTime;

		System.out.println("Total data fetched: " + data.size());
		System.out.println("Time taken to fetch data: " + fetchDuration + " ms");

		// 데이터 샘플 출력
		System.out.println("\nSample data:");
		data.stream().limit(10)
				.forEach(d -> System.out.println(d.getDistrict() + ": " + d.getPrice() + " (면적: " + d.getArea() + ")"));

		// 평균 가격 계산 및 출력 시간 측정
		startTime = System.currentTimeMillis();
		Map<String, Double> averagePrices = service.getRealEstateAveragePrices();
		endTime = System.currentTimeMillis();
		long calculateDuration = endTime - startTime;

		System.out.println("\nAverage prices per district:");
		averagePrices.forEach((district, price) -> System.out.println(district + ": 평균 가격 " + price));
		System.out.println("Time taken to calculate average prices: " + calculateDuration + " ms");

		// 전체 실행 시간 계산
		long totalDuration = fetchDuration + calculateDuration;
		System.out.println("\nTotal execution time: " + totalDuration + " ms");
	}
}