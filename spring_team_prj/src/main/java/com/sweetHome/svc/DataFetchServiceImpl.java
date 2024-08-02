package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;

/**
 * 데이터 가져오는 서비스 구현부 db에서 필요한 정보를 가져오는 역할
 */
@Service
public class DataFetchServiceImpl implements DataFetchService {
	private final RecommendMapper recommendMapper;

	@Autowired
	public DataFetchServiceImpl(RecommendMapper recommendMapper) {
		this.recommendMapper = recommendMapper;
	}

	/**
	 * db에서 모든 자치구 정보를 가져옴
	 * 
	 * @return 자치구 리스트반환, 데이터가 없을 경우 빈 리스트를 반환함(필터링하다보면 없을수도있음)
	 */
	@Override
	public List<DistrictVO> getAllDistrictsFromDB() {
		List<DistrictVO> districts = recommendMapper.getAllDistricts();
		return districts != null ? districts : new ArrayList<DistrictVO>();
	}

	/**
	 * 자치구 코드에 해당하는 자치구 정보 가져옴
	 * 
	 * @param districtCode 자치구 코드
	 * @return 해당 자치구 정보 조회 없을 경우 null
	 */
	@Override
	public DistrictVO getDistrictFromDB(String districtCode) {
		DistrictVO district = recommendMapper.getDistrictByCode(districtCode);
		return district;
	}

	/**
	 * 각 자치구별 5대범죄 총합
	 * 
	 * @return 자치구 코드 = key, 범죄 총합 = value인 Map
	 */
	@Override
	public Map<String, Double> getCrimeTotalByDistrict() {
		List<Map<String, Object>> crimeList = recommendMapper.getCrimeTotalByDistrict();
		return convertListToMap(crimeList, "districtCode", "crimeTotal", String.class, Double.class);
	}

	/**
	 * 각 자치구별 단위면적당 CCTV 설치수
	 * 
	 * @return 자치구 코드를 키로, CCTV 밀도를 값으로 하는 Map
	 */
	@Override
	public Map<String, Double> getCCTVDensityByDistrict() {
		List<Map<String, Object>> cctvList = recommendMapper.getCCTVDensityByDistrict();
		return convertListToMap(cctvList, "districtCode", "cctvDensity", String.class, Double.class);
	}

	/**
	 * 각 자치구별 인구수
	 * 
	 * @return 자치구 코드를 키로, 인구수를 값으로 하는 Map
	 */
	@Override
	public Map<String, Double> getPopulationByDistrict() {
		List<Map<String, Object>> populationList = recommendMapper.getPopulationByDistrict();
		return convertListToMap(populationList, "districtCode", "population", String.class, Double.class);
	}

	/**
	 * List<Map<String, Object>> 형태의 데이터를 Map<K, V> 형태로 변환
	 * 
	 * @param list       변환할 리스트
	 * @param keyField   키로 사용할 필드명
	 * @param valueField 값으로 사용할 필드명
	 * @param keyClass   키의 클래스
	 * @param valueClass 값의 클래스
	 * @return 변환된 Map
	 */
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

	/**
	 * 자치구 코드와 이름을 매핑 Map 생성
	 * 
	 * @return 자치구 코드를 키로, 자치구 이름을 값으로 하는 Map
	 */
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