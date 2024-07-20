package com.sweetHome.svc;

import java.util.Map;

public interface RecommendService {
    Map<String, Double> calculateDistancesToDistricts(double destLatitude, double destLongitude);
}