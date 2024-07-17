package com.sweetHome.ctl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sweetHome.svc.AuthService;

@Controller
@RequestMapping(value = "/common")
public class CommonController {
	@Autowired
	private AuthService AuthService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String ctlEmailRequest(@RequestParam("seq") int seq) {
		System.out.println("받은seq값"+seq);
		return "jsp/testindex";
	}
}
