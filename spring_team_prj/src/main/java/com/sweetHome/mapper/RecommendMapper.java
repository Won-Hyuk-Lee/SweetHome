package com.sweetHome.mapper;
import org.apache.ibatis.annotations.Mapper;
import com.sweetHome.vo.DistrictVO;
import java.util.List;
import java.util.Map;

@Mapper
public interface RecommendMapper {
    List<DistrictVO> getAllDistricts();
    DistrictVO getDistrictByCode(String districtCode);
    List<Map<String, Object>> getCrimeTotalByDistrict();
    List<Map<String, Object>> getCCTVDensityByDistrict();
    List<Map<String, Object>> getPopulationByDistrict();
}