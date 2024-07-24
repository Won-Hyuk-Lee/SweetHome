package com.sweetHome.ctl;


import javax.servlet.http.HttpSession;

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
	private AuthService authService;

	@RequestMapping(value = "/email_send", method = RequestMethod.POST)
	public String ctlEmailRequest(@RequestParam("email") String email,@RequestParam("num") String num) {
		authService.sendEmail(email,num);
		System.out.println("받은이메일값"+email);
		return num;
	}
	@RequestMapping(value = "/nick_check", method = RequestMethod.POST)
	public String ctlNicknameCheck (@RequestParam("userNickname") String userNickname) {
		System.out.println("받은닉네임값"+userNickname);
		return Integer.toString( authService.svcNicknameCheck(userNickname));
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST,produces="application/json; charset=utf8")
	public String ctlLogin (@RequestParam("userEmail") String userEmail,@RequestParam("userPw") String userPw,HttpSession session) {
		System.out.println("받은이메일값"+userEmail+"받은비밀번호"+userPw);
		Integer seq = authService.svcLogin(userEmail, userPw);
		System.out.println(seq);
		if(seq==null) {
			return "로그인 실패";
		}
		else {
			session.setAttribute("userSeq", seq);
			session.setAttribute("userRole", authService.svcFindUserRole(seq));
			return Integer.toString(seq);
		}
		
	}


}
