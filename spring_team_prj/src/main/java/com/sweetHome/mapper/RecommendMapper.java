package com.sweetHome.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.sweetHome.vo.DistrictVO;
import java.util.List;
import java.util.Map;

@Mapper
public interface RecommendMapper {
    List<DistrictVO> getAllDistricts();
    DistrictVO getDistrictByCode(String districtCode);
    Map<String, Object> getCrimeTotalByDistrict();
    Map<String, Object> getCCTVDensityByDistrict();
    Map<String, Object> getPopulationByDistrict();
}