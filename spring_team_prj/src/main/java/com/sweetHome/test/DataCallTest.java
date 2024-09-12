package com.sweetHome.test;

import java.util.List;
import java.util.Map;
import com.sweetHome.svc.DataFetchServiceImpl;
import com.sweetHome.vo.RealEstateData;

public class DataCallTest {
    public static void main(String[] args) {
        DataFetchServiceImpl service = new DataFetchServiceImpl(null); // RecommendMapper는 null로 설정

        // 전체 실행 시간 측정 시작
        long startTime = System.currentTimeMillis();

        // 데이터 가져오기
        System.out.println("데이터 가져오기 시작...");
        long fetchStartTime = System.currentTimeMillis();
        List<RealEstateData> data = service.fetchRealEstateData();
        long fetchEndTime = System.currentTimeMillis();
        System.out.println("데이터 가져오기 완료. 소요 시간: " + (fetchEndTime - fetchStartTime) / 1000.0 + "초");

        System.out.println("Total data fetched: " + data.size());

        // 데이터 샘플 출력
        System.out.println("\n데이터 샘플 (처음 10개):");
        data.stream().limit(10)
                .forEach(d -> System.out.println(d.getDistrict() + ": " + d.getPrice() + " (면적: " + d.getArea() + ")"));

        // 평균 가격 계산 및 출력
        System.out.println("\n평균 가격 계산 시작...");
        long averageStartTime = System.currentTimeMillis();
        Map<String, Double> averagePrices = service.getRealEstateAveragePrices();
        long averageEndTime = System.currentTimeMillis();
        System.out.println("평균 가격 계산 완료. 소요 시간: " + (averageEndTime - averageStartTime) / 1000.0 + "초");

        System.out.println("\n각 지역 평균 가격:");
        averagePrices.forEach((district, price) -> System.out.println(district + ": 평균 가격 " + price));

        // 전체 실행 시간 측정 종료
        long endTime = System.currentTimeMillis();
        System.out.println("\n전체 실행 시간: " + (endTime - startTime) / 1000.0 + "초");
    }
}