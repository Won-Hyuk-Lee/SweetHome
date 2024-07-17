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
	@RequestMapping(value = "/nick_check", method = RequestMethod.POST)
	public String ctlNicknameCheck (@RequestParam("userNickname") String userNickname) {
		System.out.println("받은닉네임값"+userNickname);
		return Integer.toString( AuthService.svcNicknameCheck(userNickname));
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST,produces="application/json; charset=utf8")
	public String ctlLogin (@RequestParam("userEmail") String userEmail,@RequestParam("userPw") String userPw) {
		System.out.println("받은이메일값"+userEmail+"받은비밀번호"+userPw);
		Integer seq = AuthService.svcLogin(userEmail, userPw);
		System.out.println(seq);
		if(seq==null) {
			return "로그인 실패";
		}
		else {
			return Integer.toString(seq);
		}
		
	}


}
