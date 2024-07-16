package com.sweetHome.svc;

public interface AuthService {

	    void sendEmail(String to,String num);
	
	void svcLogin ();
	void svcLoginOauth ();
	void svcLogOut ();
	void svcRegister ();
	void svcEmailCheck ();
	void svcNicknameCheck();
	void svcFindPassword();
	void svcPasswordUpdate();
}