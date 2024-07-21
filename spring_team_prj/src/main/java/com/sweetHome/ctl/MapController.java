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

    // 지도 뷰를 반환하는 메서드
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String showMap(@RequestParam("district") String district, Model model) {
        model.addAttribute("district", district);
        return "map";  // map.jsp를 렌더링
    }

    // AJAX 요청을 처리하는 메서드
    @RequestMapping(value = "/recommend", method = RequestMethod.POST)
    @ResponseBody
    public List<String> getRecommendations(@RequestParam String district,
                                           @RequestParam double latitude,
                                           @RequestParam double longitude,
                                           @RequestParam int distanceImportance) {
        System.out.println("Recommendation request received for district: " + district);
        List<String> recommendations = recommendService.getRecommendations(district, latitude, longitude, distanceImportance);
        System.out.println("Controller sending recommendations: " + recommendations);
        return recommendations;
    }
}