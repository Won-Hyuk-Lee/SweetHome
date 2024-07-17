package com.sweetHome.svc;

public interface AuthService {

    void sendEmail(String to,String num);
	
	Integer svcLogin(String userEmail,String userPw);
	void svcLoginOauth ();
	void svcLogOut ();
	void svcRegister ();
	void svcEmailCheck ();
	int svcNicknameCheck(String userNickname);
	void svcFindPassword();
	void svcPasswordUpdate();
}