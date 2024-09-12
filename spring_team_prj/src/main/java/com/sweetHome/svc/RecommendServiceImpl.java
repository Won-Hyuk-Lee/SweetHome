package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.vo.DistrictVO;

@Service
public class RecommendServiceImpl implements RecommendService {

	private static final double EARTH_RADIUS = 6371;

	@Autowired
	private DataFetchService dataFetchService;

	@Override
	public List<String> getRecommendations(String districtName, double latitude, double longitude,
			int distanceImportance, int safetyImportance, int realEstateImportance) {
		List<DistrictVO> allDistricts = dataFetchService.getAllDistrictsFromDB();
		Map<String, Double> distanceMap = calculateDistancesToDistricts(latitude, longitude, allDistricts);
		System.out.println("Distance Map: " + distanceMap);

		Map<String, Double> filteredDistanceMap = filterDistanceMap(distanceMap, distanceImportance);
		System.out.println("Filtered Distance Map (Importance: " + distanceImportance + "): " + filteredDistanceMap);

		Map<String, Double> safetyScores = calculateSafetyScores(filteredDistanceMap);
		System.out.println("Safety Scores: " + safetyScores);

		Map<String, Double> realEstateScores = calculateRealEstateScores(dataFetchService.getRealEstateAveragePrices());
		System.out.println("Real Estate Scores: " + realEstateScores);

		Map<String, Double> totalScoreMap = calculateScores(filteredDistanceMap, safetyScores, realEstateScores,
				safetyImportance, realEstateImportance);
		System.out.println("Total Scores (Safety Importance: " + safetyImportance + ", Real Estate Importance: "
				+ realEstateImportance + "): " + totalScoreMap);

		List<String> recommendations = getRecommendationsFromScoreMap(totalScoreMap);
		System.out.println("Final Recommendations: " + recommendations);

		return recommendations;
	}

	private Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude,
			List<DistrictVO> allDistricts) {
		Map<String, Double> distanceMap = new HashMap<>();
		for (DistrictVO district : allDistricts) {
			try {
				double distance = calculateHaversineDistance(destLatitude, destLongitude, district.getLatitude(),
						district.getLongitude());
				distanceMap.put(district.getDistrictCode(), distance);
			} catch (Exception e) {
				System.err.println(
						"Error calculating distance for " + district.getDistrictName() + ": " + e.getMessage());
			}
		}
		return distanceMap;
	}

	private double calculateHaversineDistance(double lat1, double lon1, double lat2, double lon2) {
		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);
		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1))
				* Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		return EARTH_RADIUS * c;
	}

	private Map<String, Double> filterDistanceMap(Map<String, Double> distanceMap, int distanceImportance) {
		double maxDistance;
		switch (distanceImportance) {
		case 5:
			maxDistance = 1.5;
			break;
		case 4:
			maxDistance = 3.0;
			break;
		case 3:
			maxDistance = 5.0;
			break;
		case 2:
			maxDistance = 15.0;
			break;
		default:
			return distanceMap;
		}

		return distanceMap.entrySet().stream().filter(entry -> entry.getValue() <= maxDistance)
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	private Map<String, Double> calculateSafetyScores(Map<String, Double> filteredDistanceMap) {
		Map<String, Double> crimeMap = dataFetchService.getCrimeTotalByDistrict();
		Map<String, Double> cctvMap = dataFetchService.getCCTVDensityByDistrict();
		Map<String, Double> populationMap = dataFetchService.getPopulationByDistrict();

		Map<String, Double> crimeRateMap = new HashMap<>();
		Map<String, Double> cctvDensityMap = new HashMap<>();

		for (String districtCode : filteredDistanceMap.keySet()) {
			Double crimeTotal = crimeMap.get(districtCode);
			Double cctvDensity = cctvMap.get(districtCode);
			Double population = populationMap.get(districtCode);

			if (crimeTotal != null && cctvDensity != null && population != null && population != 0) {
				crimeRateMap.put(districtCode, crimeTotal / population);
				cctvDensityMap.put(districtCode, cctvDensity);
			}
		}

		List<String> crimeRateRanking = rankDistricts(crimeRateMap, false);
		List<String> cctvDensityRanking = rankDistricts(cctvDensityMap, true);

		Map<String, Double> safetyScoreMap = new HashMap<>();
		for (String districtCode : filteredDistanceMap.keySet()) {
			int crimeRateRank = crimeRateRanking.indexOf(districtCode) + 1;
			int cctvDensityRank = cctvDensityRanking.indexOf(districtCode) + 1;
			double crimeRateScore = calculateRankScore(crimeRateRank);
			double cctvDensityScore = calculateRankScore(cctvDensityRank);

			safetyScoreMap.put(districtCode, (crimeRateScore + cctvDensityScore) / 2);
		}

		return safetyScoreMap;
	}

	private Map<String, Double> calculateRealEstateScores(Map<String, Double> averagePrices) {
		List<Map.Entry<String, Double>> sortedPrices = new ArrayList<>(averagePrices.entrySet());
		sortedPrices.sort(Map.Entry.comparingByValue());

		Map<String, Double> scores = new HashMap<>();
		for (int i = 0; i < sortedPrices.size(); i++) {
			String district = sortedPrices.get(i).getKey();
			double score = (sortedPrices.size() - i) / (double) sortedPrices.size() * 100;
			scores.put(district, score);
		}
		return scores;
	}

	private Map<String, Double> calculateScores(Map<String, Double> filteredDistanceMap,
			Map<String, Double> safetyScores, Map<String, Double> realEstateScores, int safetyImportance,
			int realEstateImportance) {
		Map<String, Double> totalScoreMap = new HashMap<>();
		for (String districtCode : filteredDistanceMap.keySet()) {
			double safetyScore = safetyScores.getOrDefault(districtCode, 0.0);
			double realEstateScore = realEstateScores.getOrDefault(districtCode, 0.0);

			double safetyMultiplier = getSafetyMultiplier(safetyImportance);
			double realEstateMultiplier = getRealEstateMultiplier(realEstateImportance);

			double totalScore = (safetyScore * safetyMultiplier + realEstateScore * realEstateMultiplier)
					/ (safetyMultiplier + realEstateMultiplier);

			totalScoreMap.put(districtCode, totalScore);
		}
		return totalScoreMap;
	}

	private double getSafetyMultiplier(int safetyImportance) {
		switch (safetyImportance) {
		case 1:
			return 0.3;
		case 2:
			return 0.5;
		case 3:
			return 1.0;
		case 4:
			return 1.2;
		case 5:
			return 1.5;
		default:
			return 1.0;
		}
	}

	private double getRealEstateMultiplier(int realEstateImportance) {
		switch (realEstateImportance) {
		case 1:
			return 0.3;
		case 2:
			return 0.5;
		case 3:
			return 1.0;
		case 4:
			return 1.2;
		case 5:
			return 1.5;
		default:
			return 1.0;
		}
	}

	private List<String> rankDistricts(Map<String, Double> dataMap, boolean ascending) {
		List<Map.Entry<String, Double>> list = new ArrayList<>(dataMap.entrySet());
		if (ascending) {
			list.sort(Map.Entry.comparingByValue());
		} else {
			list.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));
		}
		return list.stream().map(Map.Entry::getKey).collect(Collectors.toList());
	}

	private double calculateRankScore(int rank) {
		return Math.max(26 - rank, 1);
	}

	private List<String> getRecommendationsFromScoreMap(Map<String, Double> scoreMap) {
		Map<String, String> districtCodeToNameMap = dataFetchService.getDistrictCodeToNameMap();

		List<Map.Entry<String, Double>> sortedEntries = new ArrayList<>(scoreMap.entrySet());
		sortedEntries.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));

		List<String> recommendations = new ArrayList<>();
		for (int i = 0; i < Math.min(5, sortedEntries.size()); i++) {
			String code = sortedEntries.get(i).getKey();
			recommendations.add(districtCodeToNameMap.getOrDefault(code, "Unknown District: " + code));
		}
		return recommendations;
	}
}