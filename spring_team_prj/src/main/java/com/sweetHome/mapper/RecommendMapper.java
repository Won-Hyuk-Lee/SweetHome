package com.sweetHome.mapper;
import org.apache.ibatis.annotations.Mapper;
import com.sweetHome.vo.DistrictVO;
import java.util.List;
import java.util.Map;

/**
 * 추천 서비스 관련 데이터베이스 매퍼 인터페이스
 * 
 * 이 인터페이스는 추천 서비스에 필요한 데이터를 데이터베이스에서 조회하는 메서드를 정의합니다.
 */
@Mapper
public interface RecommendMapper {
    
    /**
     * 모든 자치구 정보를 조회합니다.
     * 
     * @return 모든 자치구의 정보 리스트
     */
    List<DistrictVO> getAllDistricts();
    
    /**
     * 특정 자치구 코드에 해당하는 자치구 정보를 조회합니다.
     * 
     * @param districtCode 조회할 자치구 코드
     * @return 해당 자치구의 정보
     */
    DistrictVO getDistrictByCode(String districtCode);
    
    /**
     * 각 자치구별 총 범죄 건수를 조회합니다.
     * 
     * @return 자치구별 총 범죄 건수 맵 (키: 자치구 코드, 값: 총 범죄 건수)
     */
    List<Map<String, Object>> getCrimeTotalByDistrict();
    
    /**
     * 각 자치구별 CCTV 밀도를 조회합니다.
     * 
     * @return 자치구별 CCTV 밀도 맵 (키: 자치구 코드, 값: CCTV 밀도)
     */
    List<Map<String, Object>> getCCTVDensityByDistrict();
    
    /**
     * 각 자치구별 인구수를 조회합니다.
     * 
     * @return 자치구별 인구수 맵 (키: 자치구 코드, 값: 인구수)
     */
    List<Map<String, Object>> getPopulationByDistrict();
}