package com.sweetHome.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sweetHome.svc.RecommendService;

@Controller
@RequestMapping("/map")
public class MapController {
	@Autowired
	private RecommendService recommendService;

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String showMap(@RequestParam("district") String district, Model model) {
		model.addAttribute("district", district);
		return "map";
	}

	@RequestMapping(value = "/recommend", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getRecommendations(@RequestParam String district, @RequestParam double latitude,
			@RequestParam double longitude, @RequestParam int distanceImportance, @RequestParam int safetyImportance) {
		System.out.println("Recommendation request received for district: " + district);
		List<String> recommendations = recommendService.getRecommendations(district, latitude, longitude,
				distanceImportance, safetyImportance);
		System.out.println("Controller sending recommendations: " + recommendations);
		return recommendations;
	}
}