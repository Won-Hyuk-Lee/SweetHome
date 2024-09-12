package com.sweetHome.svc;

import java.util.List;
import java.util.Map;

import com.sweetHome.vo.DistrictVO;
import com.sweetHome.vo.RealEstateData;

public interface DataFetchService {
	List<DistrictVO> getAllDistrictsFromDB();

	DistrictVO getDistrictFromDB(String districtCode);

	Map<String, Double> getCrimeTotalByDistrict();

	Map<String, Double> getCCTVDensityByDistrict();

	Map<String, Double> getPopulationByDistrict();

	Map<String, String> getDistrictCodeToNameMap();

	Map<String, String> getDistrictNameToCodeMap();

	List<RealEstateData> fetchRealEstateData();

	Map<String, Double> getRealEstateAveragePrices();
}