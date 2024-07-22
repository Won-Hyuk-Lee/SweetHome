package com.sweetHome.svc;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.AuthMapper;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
    private AuthMapper authMapper;
	
	@Value("${mail.username}")
	private String emailUsername;

	@Override
	public void sendEmail(String to,String num) {
		System.out.println(emailUsername);
		System.out.println(to);
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper;
	    StringBuilder sb;
	    try {
	        //helper = new MimeMessageHelper(message, true); // true indicates multipart message
	        helper = new MimeMessageHelper(message, true, "UTF-8"); 
	        String subject = "스위트홈 회원가입 인증번호 발송";
	        String body = "다음의 코드를 입력하여 인증을 완료해 주세요<br/>";
	        body += num;
	        helper.setFrom(emailUsername); // Set from address using email.username property
	        helper.setTo(to);
	        helper.setSubject(subject);
	        helper.setText(body, true); // true indicates HTML format

	        mailSender.send(message);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	        // handle exception
	    }

	}
	@Override
	public Integer svcLogin(String userEmail,String userPw) {
		return authMapper.login(userEmail, userPw);
		
	}

	@Override
	public void svcEmailCheck() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int svcNicknameCheck(String userNickname) {
		return authMapper.nicknameCheck(userNickname);
	}

	@Override
	public void svcFindPassword() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void svcPasswordUpdate() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String svcFindUserRole(int userSeq) {
		return authMapper.findUserRole(userSeq);
	}
}
