package com.sweetHome.ctl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sweetHome.svc.AuthService;

@RestController
@RequestMapping(value = "/auth")
public class AuthController {
	@Autowired
	private AuthService AuthService;

	@RequestMapping(value = "/email_send", method = RequestMethod.POST)
	public String ctlEmailRequest(@RequestParam("email") String email,@RequestParam("num") String num) {
		AuthService.sendEmail(email,num);
		System.out.println("받은이메일값"+email);
		return num;
	}


}
