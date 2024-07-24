package com.sweetHome.test;


import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.view.RedirectView;


@PropertySource("classpath:lec14-oauth.properties")
@Controller
public class NaverCallTestCtl {
	
	@Value("${naver.loginform.url}")
	private String LOGIN_FORM_URL;
	@Value("${naver.client.id}")
	private String CLIENT_ID;
	@Value("${naver.client.pw}")
	private String CLIENT_PW;
	//@Value("${kakao.redirect.uri}")
	private String CALLBACK_URL = "http://localhost:8089/test_naver_oauth2callback";
	@Value("${naver.endpoint.token}")
	private String ENDPOINT_URL_TOKEN;
	@Value("${naver.endpoint.userinfo}")
	private String ENDPOINT_URL_USERINFO;
	
    
	//http://localhost:8089/test_naver_loginForm
    
	@RequestMapping(value="/test_naver_loginForm")
   	public RedirectView loginForm(Model model) {
    	//-------------------------------------------------------------------------
        //로그인폼 요청을 위한 주소  
    	// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}
    	//-------------------------------------------------------------------------
    	String loginFormUrl = LOGIN_FORM_URL 
    			+ "?client_id=" + CLIENT_ID			//
    			+ "&redirect_uri="+CALLBACK_URL		//
    			+ "&response_type=code"				//
    			+ "&state=this-is-my-test-state-msg";
    	
    	System.out.println("0.로그인폼URL:" + loginFormUrl);
    	return new RedirectView(loginFormUrl);
   	}
    	
    	
    /**  
     * access_token 토큰 획득
     */
    @RequestMapping(value="/test_naver_oauth2callback", method = RequestMethod.GET)
    public void loginNaver( @RequestParam(value = "code") String code, 
    						@RequestParam(value = "state") String state){
    	System.out.println("1.authCode:" + code);
    	
    	//-------------------------------------------------------------------------
        //토큰 요청 
    	// curl -v -X POST "https://nid.naver.com/oauth2.0/token" 
		// 			-H "Content-Type: application/x-www-form-urlencoded;charset=utf-8" 
    	// 			-d "code=${리턴된code}"
    	// 			-d "state=${리턴된state}"
		// 			-d "client_id=${CLIENT_ID}"
    	// 			-d "client_secret=${CLIENT_SECRET}" 
    	// 			-d "grant_type=authorization_code" 
    	//			--data-urlencode "redirect_uri=${REDIRECT_URI}"
    	//-------------------------------------------------------------------------
    	
    	//필수 헤더 정보
    	HttpHeaders headers = new HttpHeaders();
        headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        //필수 바디 정보
        MultiValueMap<String, String> bodys = new LinkedMultiValueMap<>();
        bodys.add("code"			, code);
        bodys.add("client_id"		, CLIENT_ID);
        bodys.add("client_secret"	, CLIENT_PW);
        bodys.add("grant_type"		, "authorization_code");
        bodys.add("redirect_uri"	, CALLBACK_URL);
        bodys.add("state"			, state);
    	// HttpEntity (헤더+바디) 생성
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(bodys, headers);
        
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Map> tokenResponse = restTemplate.exchange(ENDPOINT_URL_TOKEN, HttpMethod.POST, entity, Map.class);
		Map<String, Object> bodyMap = tokenResponse.getBody();
		String accessToken = (String) bodyMap.get("access_token");
		System.out.println("2.토큰 응답(body): "  + bodyMap.toString());
		System.out.println("2.토큰 응답(token): " + accessToken);
		
		
        //-------------------------------------------------------------------------
        // 획득한 AccessToken으로 유저정보 가져오기
        // GET "https://kapi.kakao.com/v2/user/me" \
		//	-H "Authorization: Bearer ${ACCESS_TOKEN}"
        //-------------------------------------------------------------------------
		
		//필수 헤더 정보
		headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        entity = new HttpEntity<>(headers);
        
        restTemplate = new RestTemplate();
        ResponseEntity<Map> userinfoResponse = restTemplate.exchange(ENDPOINT_URL_USERINFO, HttpMethod.POST, entity, Map.class);
        System.out.println("5.유저정보:" + userinfoResponse.toString());       
    }
    
}
