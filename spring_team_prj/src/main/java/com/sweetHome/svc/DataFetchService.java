package com.sweetHome.svc;

import java.util.List;
import java.util.Map;

import com.sweetHome.vo.DistrictVO;
import com.sweetHome.vo.RealEstateData;

/**
 * 데이터 조회 서비스 인터페이스
 * 
 * 이 인터페이스는 다양한 데이터 소스로부터 필요한 정보를 조회하는 메서드를 정의합니다.
 */
public interface DataFetchService {
    
    /**
     * 데이터베이스로부터 모든 자치구 정보를 조회합니다.
     * 
     * @return 모든 자치구의 정보 리스트
     */
    List<DistrictVO> getAllDistrictsFromDB();

    /**
     * 데이터베이스로부터 특정 자치구 정보를 조회합니다.
     * 
     * @param districtCode 조회할 자치구 코드
     * @return 해당 자치구의 정보
     */
    DistrictVO getDistrictFromDB(String districtCode);

    /**
     * 각 자치구별 총 범죄 건수를 조회합니다.
     * 
     * @return 자치구별 총 범죄 건수 맵 (키: 자치구 코드, 값: 총 범죄 건수)
     */
    Map<String, Double> getCrimeTotalByDistrict();

    /**
     * 각 자치구별 CCTV 밀도를 조회합니다.
     * 
     * @return 자치구별 CCTV 밀도 맵 (키: 자치구 코드, 값: CCTV 밀도)
     */
    Map<String, Double> getCCTVDensityByDistrict();

    /**
     * 각 자치구별 인구수를 조회합니다.
     * 
     * @return 자치구별 인구수 맵 (키: 자치구 코드, 값: 인구수)
     */
    Map<String, Double> getPopulationByDistrict();

    /**
     * 자치구 코드와 이름의 매핑을 조회합니다.
     * 
     * @return 자치구 코드-이름 매핑 맵 (키: 자치구 코드, 값: 자치구 이름)
     */
    Map<String, String> getDistrictCodeToNameMap();

    /**
     * 자치구 이름과 코드의 매핑을 조회합니다.
     * 
     * @return 자치구 이름-코드 매핑 맵 (키: 자치구 이름, 값: 자치구 코드)
     */
    Map<String, String> getDistrictNameToCodeMap();

    /**
     * 부동산 데이터를 조회합니다.
     * 
     * @return 부동산 데이터 리스트
     */
    List<RealEstateData> fetchRealEstateData();

    /**
     * 각 자치구별 평균 부동산 가격을 조회합니다.
     * 
     * @return 자치구별 평균 부동산 가격 맵 (키: 자치구 코드, 값: 평균 가격)
     */
    Map<String, Double> getRealEstateAveragePrices();
}