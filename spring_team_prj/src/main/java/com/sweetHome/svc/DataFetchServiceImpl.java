package com.sweetHome.svc;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;

@Service
public class DataFetchServiceImpl implements DataFetchService {
	private final RecommendMapper recommendMapper;

	@Autowired
	public DataFetchServiceImpl(RecommendMapper recommendMapper) {
		this.recommendMapper = recommendMapper;
	}

	@Override
	public List<DistrictVO> getAllDistrictsFromDB() {
		List<DistrictVO> districts = recommendMapper.getAllDistricts();
		return districts != null ? districts : new ArrayList<DistrictVO>();
	}

	@Override
	public DistrictVO getDistrictFromDB(String districtCode) {
		DistrictVO district = recommendMapper.getDistrictByCode(districtCode);
		return district;
	}

	@Override
	public Map<String, BigDecimal> getCrimeTotalByDistrict() {
		List<Map<String, Object>> crimeList = recommendMapper.getCrimeTotalByDistrict();
		return convertListToMap(crimeList, "districtCode", "crimeTotal", String.class, BigDecimal.class);
	}

	@Override
	public Map<String, BigDecimal> getCCTVDensityByDistrict() {
		List<Map<String, Object>> cctvList = recommendMapper.getCCTVDensityByDistrict();
		return convertListToMap(cctvList, "districtCode", "cctvDensity", String.class, BigDecimal.class);
	}

	@Override
	public Map<String, BigDecimal> getPopulationByDistrict() {
		List<Map<String, Object>> populationList = recommendMapper.getPopulationByDistrict();
		return convertListToMap(populationList, "districtCode", "population", String.class, BigDecimal.class);
	}

	private <K, V> Map<K, V> convertListToMap(List<Map<String, Object>> list, String keyField, String valueField,
			Class<K> keyClass, Class<V> valueClass) {
		Map<K, V> resultMap = new HashMap<K, V>();
		if (list != null) {
			for (Map<String, Object> map : list) {
				K key = keyClass.cast(map.get(keyField));
				Object value = map.get(valueField);
				if (key != null && value != null) {
					resultMap.put(key, valueClass.cast(value));
				}
			}
		}
		return resultMap;
	}

	@Override
	public Map<String, String> getDistrictCodeToNameMap() {
		List<DistrictVO> districts = getAllDistrictsFromDB();
		Map<String, String> codeToNameMap = new HashMap<String, String>();
		for (DistrictVO district : districts) {
			codeToNameMap.put(district.getDistrictCode(), district.getDistrictName());
		}
		return codeToNameMap;
	}
}