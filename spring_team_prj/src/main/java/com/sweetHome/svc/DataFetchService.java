package com.sweetHome.svc;

import com.sweetHome.vo.DistrictVO;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface DataFetchService {
    List<DistrictVO> getAllDistrictsFromDB();
    DistrictVO getDistrictFromDB(String districtCode);
    Map<String, BigDecimal> getCrimeTotalByDistrict();
    Map<String, BigDecimal> getCCTVDensityByDistrict();
    Map<String, BigDecimal> getPopulationByDistrict();
    Map<String, String> getDistrictCodeToNameMap();
}

