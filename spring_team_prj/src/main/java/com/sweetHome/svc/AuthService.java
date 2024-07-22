package com.sweetHome.svc;

public interface AuthService {

    void sendEmail(String to,String num);
	
	Integer svcLogin(String userEmail,String userPw);
	void svcEmailCheck ();
	int svcNicknameCheck(String userNickname);
	void svcFindPassword();
	void svcPasswordUpdate();
	String svcFindUserRole(int userSeq);
}