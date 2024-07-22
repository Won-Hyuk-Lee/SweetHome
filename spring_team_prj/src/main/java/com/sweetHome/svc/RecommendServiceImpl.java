package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;

@Service
public class RecommendServiceImpl implements RecommendService {
	@Autowired
	private RecommendMapper recommendMapper;
	@Autowired
	private DataFetchService dataFetchService;

	// 지구반지름(km)
	private static final double EARTH_RADIUS = 6371;

	@Override
	public List<String> getRecommendations(String districtName, double latitude, double longitude,
			int distanceImportance) {

		// 데이터베이스에서 모든 자치구 정보를 가져옴
		List<DistrictVO> allDistricts = dataFetchService.getAllDistrictsFromDB();

		// 모든 자치구와의 거리를 계산
		Map<String, Double> distanceMap = calculateDistancesToDistricts(latitude, longitude, allDistricts);

		// 거리 중요도에 따른 자치구 필터링
		Map<String, Double> filteredDistanceMap = filterDistanceMap(distanceMap, distanceImportance);

		// 필터링된 결과가 없을 경우, 입력받은 자치구를 반환
		if (filteredDistanceMap.isEmpty()) {
			return Collections.singletonList(districtName);
		}

		// 거리가 가장 가까운 5개 자치구 이름 반환
		List<Map.Entry<String, Double>> sortedEntries = new ArrayList<>(filteredDistanceMap.entrySet());
		Collections.sort(sortedEntries, new Comparator<Map.Entry<String, Double>>() {
			@Override
			public int compare(Map.Entry<String, Double> e1, Map.Entry<String, Double> e2) {
				return e1.getValue().compareTo(e2.getValue());
			}
		});

		List<String> recommendations = new ArrayList<>();
		for (int i = 0; i < Math.min(5, sortedEntries.size()); i++) {
			recommendations.add(sortedEntries.get(i).getKey());
		}
		return recommendations;
	}

	// 거리 중요도에 따른 자치구 필터링 메서드
	private Map<String, Double> filterDistanceMap(Map<String, Double> distanceMap, int distanceImportance) {
		double maxDistance;
		switch (distanceImportance) {
		case 5:
			maxDistance = 1.5; // 도보 10분 이내
			break;
		case 4:
			maxDistance = 3.0; // 대중교통 10분 이내
			break;
		case 3:
			maxDistance = 5.0; // 대중교통 30분 이내
			break;
		case 2:
			maxDistance = 15.0; // 대중교통 1시간 이내
			break;
		default:
			return distanceMap; // 1인 경우 또는 그 외의 경우 모든 결과 반환
		}

		// 최대 거리를 넘지 않는 자치구들만 필터링하여 반환
		return distanceMap.entrySet().stream().filter(entry -> entry.getValue() <= maxDistance)
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	@Override
	public Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude,
			List<DistrictVO> allDistricts) {
		Map<String, Double> distanceMap = new HashMap<>();
		for (DistrictVO district : allDistricts) {
			try {
				// 두 지점 간의 거리를 계산
				double distance = calculateHaversineDistance(destLatitude, destLongitude, district.getLatitude(),
						district.getLongitude());
				distanceMap.put(district.getDistrictName(), distance);
			} catch (Exception e) {
				System.err.println(district.getDistrictName() + "의 거리 계산 중 오류: " + e.getMessage());
				e.printStackTrace();
			}
		}
		return distanceMap;
	}

	// 두 지점 간의 하버사인 공식을 이용한 거리 계산
	private double calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {

		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);
		lat1 = Math.toRadians(lat1);
		lat2 = Math.toRadians(lat2);

		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
				+ Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

		double distance = EARTH_RADIUS * c;
		return distance;
	}
}
