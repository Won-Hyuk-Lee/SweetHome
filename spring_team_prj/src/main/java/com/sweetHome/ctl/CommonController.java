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
	private AuthService authService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String ctlEmailRequest(@RequestParam("seq") int seq,HttpSession session) {
		System.out.println("받은seq값"+seq);
		session.setAttribute("userSeq", seq);
		System.out.println( authService.svcFindUserRole(seq));
		session.setAttribute("userRole", authService.svcFindUserRole(seq));
		return "jsp/index";
	}
	@RequestMapping(value = "/indexm", method = RequestMethod.GET)
	public String ctlMove(HttpSession session) {
		return "jsp/index";
	}
	@RequestMapping(value = "/registerm", method = RequestMethod.GET)
	public String ctlRegisterm(HttpSession session) {
		return "/jsp/register";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String ctlLogOut(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "jsp/index";
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String ctlRegister(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "/jsp/register";
	}
}
