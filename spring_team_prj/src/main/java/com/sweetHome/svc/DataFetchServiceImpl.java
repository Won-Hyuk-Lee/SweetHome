package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

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
        System.out.println("Fetched " + (districts != null ? districts.size() : "null") + " districts from DB");
        return Objects.requireNonNullElse(districts, new ArrayList<>());
    }

    @Override
    public Optional<DistrictVO> getDistrictFromDB(String districtCode) {
        DistrictVO district = recommendMapper.getDistrictByCode(districtCode);
        System.out.println("Fetched district for code " + districtCode + ": " + (district != null ? "found" : "not found"));
        return Optional.ofNullable(district);
    }

    @Override
    public Map<String, Integer> getCrimeTotalByDistrict() {
        Map<String, Object> crimeMap = recommendMapper.getCrimeTotalByDistrict();
        System.out.println("Fetched crime data: " + (crimeMap != null ? crimeMap.size() : "null") + " entries");
        return convertToMap(crimeMap, "districtCode", "crimeTotal", String.class, Integer.class);
    }

    @Override
    public Map<String, Double> getCCTVDensityByDistrict() {
        Map<String, Object> cctvMap = recommendMapper.getCCTVDensityByDistrict();
        System.out.println("Fetched CCTV data: " + (cctvMap != null ? cctvMap.size() : "null") + " entries");
        return convertToMap(cctvMap, "districtCode", "cctvDensity", String.class, Double.class);
    }

    @Override
    public Map<String, Integer> getPopulationByDistrict() {
        Map<String, Object> populationMap = recommendMapper.getPopulationByDistrict();
        System.out.println("Fetched population data: " + (populationMap != null ? populationMap.size() : "null") + " entries");
        return convertToMap(populationMap, "districtCode", "population", String.class, Integer.class);
    }

    @Override
    public Map<String, String> getDistrictCodeToNameMap() {
        List<DistrictVO> districts = getAllDistrictsFromDB();
        Map<String, String> codeToNameMap = districts.stream()
                .collect(Collectors.toMap(
                    DistrictVO::getDistrictCode,
                    DistrictVO::getDistrictName,
                    (v1, v2) -> v1
                ));
        System.out.println("Created district code to name map: " + codeToNameMap.size() + " entries");
        System.out.println("District Code to Name Map: " + codeToNameMap);
        return codeToNameMap;
    }

    private <K, V> Map<K, V> convertToMap(Map<String, Object> objectMap, String keyField, String valueField, Class<K> keyClass, Class<V> valueClass) {
        return Objects.requireNonNullElse(objectMap, new HashMap<>())
            .entrySet().stream()
            .collect(Collectors.toMap(
                e -> keyClass.cast(e.getKey()),
                e -> valueClass.cast(e.getValue())
            ));
    }
}