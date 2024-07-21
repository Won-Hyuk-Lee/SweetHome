package com.sweetHome.svc;

import java.util.List;

public interface RecommendService {
    List<String> getRecommendations(String districtName, double latitude, double longitude, int distanceImportance, int safetyImportance);
}