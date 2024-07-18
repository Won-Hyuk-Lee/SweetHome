package com.sweetHome.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/map")
public class MapController {
    
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String showMap(@RequestParam("destination") String destination, Model model) {
        model.addAttribute("destination", destination);
        return "map";
    }
}