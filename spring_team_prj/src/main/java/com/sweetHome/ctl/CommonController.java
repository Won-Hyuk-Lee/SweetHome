package com.sweetHome.ctl;


import javax.servlet.http.HttpSession;

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
	public String ctlEmailRequest(@RequestParam("seq") int seq,HttpSession session) {
		System.out.println("받은seq값"+seq);
		session.setAttribute("userSeq", seq);
		return "jsp/index";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String ctlLogOut(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "jsp/index";
	}
}
