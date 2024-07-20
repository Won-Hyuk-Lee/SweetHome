package com.sweetHome.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.sweetHome.svc.RecommendService;

@RestController
@RequestMapping("/map")
public class MapController {
    
    @Autowired
    private RecommendService recommendService;

    // 인덱스 페이지 표시
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView showIndex() {
        return new ModelAndView("jsp/maptestindex");
    }

    // 지도 뷰 표시
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public ModelAndView showMap(@RequestParam("district") String district) {
        ModelAndView mav = new ModelAndView("jsp/map");
        mav.addObject("district", district);
        return mav;
    }

    // 구역 정보 가져오기
    @RequestMapping(value = "/api/district", method = RequestMethod.GET)
    public String getDistrictInfo(@RequestParam("name") String name) {
        // 여기에 구역 정보를 가져오는 로직 구현
        return "구역 정보: " + name;
    }

    // 추천 서비스 호출
    /*
    @RequestMapping(value = "/recommend", method = RequestMethod.POST)
    public String getRecommendations(@RequestParam String district, 
                                     @RequestParam double latitude, 
                                     @RequestParam double longitude,
                                     @RequestParam int distanceImportance,
                                     @RequestParam int facilitiesImportance,
                                     @RequestParam int costImportance) {
        // 추천 서비스 호출
        return recommendService.getRecommendations(district, latitude, longitude, 
                                                   distanceImportance, facilitiesImportance, costImportance);
    }
    */
}