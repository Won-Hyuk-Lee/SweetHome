package com.sweetHome.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.sweetHome.vo.DistrictVO;
import java.util.List;

@Mapper
public interface RecommendMapper {
    List<DistrictVO> getAllDistricts();
    DistrictVO getDistrictByCode(String districtCode);
}