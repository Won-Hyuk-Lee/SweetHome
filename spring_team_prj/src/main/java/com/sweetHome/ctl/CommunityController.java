package com.sweetHome.ctl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sweetHome.svc.CommunityService;
import com.sweetHome.vo.CommunityVO;

@Controller
@RequestMapping(value = "/community")
public class CommunityController {

    @Autowired
    private CommunityService communityService;
    
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String getCommunityList(Model model) {
        List<CommunityVO> communities = communityService.svcCommunitySelect();
        model.addAttribute("KEY_COMMUNITYLIST", communities);
        return "jsp/community";
    }
}