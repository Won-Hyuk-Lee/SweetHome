package com.sweetHome.svc;

import java.util.List;
import java.util.Map;

import com.sweetHome.vo.DistrictVO;

public interface DataFetchService {
	List<DistrictVO> getAllDistrictsFromDB();

	DistrictVO getDistrictFromDB(String districtCode);

	Map<String, Double> getCrimeTotalByDistrict();

	Map<String, Double> getCCTVDensityByDistrict();

	Map<String, Double> getPopulationByDistrict();

	Map<String, String> getDistrictCodeToNameMap();
}