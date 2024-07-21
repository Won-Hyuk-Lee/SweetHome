package com.sweetHome.svc;

import com.sweetHome.vo.DistrictVO;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface DataFetchService {
    List<DistrictVO> getAllDistrictsFromDB();
    Optional<DistrictVO> getDistrictFromDB(String districtCode);
    Map<String, Integer> getCrimeTotalByDistrict();
    Map<String, Double> getCCTVDensityByDistrict();
    Map<String, Integer> getPopulationByDistrict();
    Map<String, String> getDistrictCodeToNameMap();
}