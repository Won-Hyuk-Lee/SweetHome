package com.sweetHome.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sweetHome.svc.MapService;

@RestController
@RequestMapping(value = "/map")
public class MapController {

    @Autowired
    private MapService mapService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView showIndex() {
        return new ModelAndView("jsp/maptestindex");
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public ModelAndView showMap(@RequestParam("district") String district) {
        ModelAndView mav = new ModelAndView("jsp/map");
        mav.addObject("district", district);
        return mav;
    }

    @RequestMapping(value = "/api/district", method = RequestMethod.GET)
    public String getDistrictInfo(@RequestParam("name") String name) {
        return mapService.getDistrictInfo(name);
    }
}