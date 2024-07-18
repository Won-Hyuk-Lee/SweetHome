package com.sweetHome.ctl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sweetHome.svc.RecommendationService;



@RestController
@RequestMapping("/recommendations")
public class RecommendationController {
    @Autowired
    private RecommendationService recommendationService;

    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public ResponseEntity<Object> getRecommendations(@RequestBody Map<String, Object> request) {
        try {
            double latitude = ((Number) request.get("latitude")).doubleValue();
            double longitude = ((Number) request.get("longitude")).doubleValue();
            Map<String, Integer> preferences = (Map<String, Integer>) request.get("preferences");
            List<Map<String, Object>> recommendations = 
                recommendationService.getRecommendations(latitude, longitude, preferences);
            return new ResponseEntity<>(recommendations, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error occurred: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}