package com.sweetHome.svc;

import java.util.Map;
import java.util.List;

public interface RecommendationService {
    List<Map<String, Object>> getRecommendations(double latitude, double longitude, Map<String, Integer> preferences);
}