package com.sweetHome.svc;

import java.util.List;
import java.util.Map;

import com.sweetHome.vo.DistrictVO;

public interface RecommendService {
	Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude,List<DistrictVO> allDistricts);
	List<String> getRecommendations(String districtName, double latitude, double longitude, int distanceImportance);
}