package com.sweetHome.oauth;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Component
public class NaverOauth implements Oauth {
	@Value("${naver.loginform.url}")
	private String LOGIN_FORM_URL;
	@Value("${naver.client.id}")
	private String CLIENT_ID;
	@Value("${naver.client.pw}")
	private String CLIENT_PW;
	@Value("${naver.redirect.uri}")
	private String CALLBACK_URL;
	@Value("${naver.endpoint.token}")
	private String ENDPOINT_URL_TOKEN;
	@Value("${naver.endpoint.userinfo}")
	private String ENDPOINT_URL_USERINFO;
	private String ACCESS_TOKEN  = "";
	@Override
	public String getLoginFormURL() {
		Map<String, Object> params = new HashMap<>();
		params.put("scope"			, "email%20profile%20openid");
		params.put("response_type"	, "code");
		params.put("client_id"		, CLIENT_ID);
		params.put("redirect_uri"	, CALLBACK_URL);
		params.put("access_type"	, "offline");		
		params.put("prompt"			, "consent");

		//String parameterString = commonBuildQueryString(params);
		String parameterString = params.entrySet().stream()
				.map(x -> x.getKey() + "=" + x.getValue())
				.collect(Collectors.joining("&"));  

		//https://accounts.google.com/o/oauth2/v2/auth?client_id=__&redirect_uri=__&response_type=code&scope=email profile openid&access_type=offline
		return LOGIN_FORM_URL + "?" + parameterString;
	}

	@Override
	public String getAccessTokenByRefreshToken(String refreshToken) {
		Map<String, String> bodys = new HashMap<>();
		bodys.put("client_id"     , CLIENT_ID);
		bodys.put("client_secret" , CLIENT_PW);
		bodys.put("refresh_token" , refreshToken);
		bodys.put("grant_type"    , "refresh_token");
        
        // HttpEntity (바디) 생성
		RestTemplate restTemplate = new RestTemplate();
		HttpEntity<Map<String, String>> entity = new HttpEntity<>(bodys);
        ResponseEntity<Map<String, String>> responseEntity = restTemplate.exchange(
        		ENDPOINT_URL_TOKEN,
			    HttpMethod.POST,
			    entity,
			    new ParameterizedTypeReference<Map<String, String>>() {}
			);
        System.out.println("4.토큰재발급 응답(body):" + responseEntity.getBody().toString());
        String accessToken= responseEntity.getBody().get("access_token");
        System.out.println("4.토큰요청 응답(갱신된access_token): " + accessToken);
        return accessToken;
	}

	@Override
	public Map<String, String> getUserInfo(String accessToken) {
		
		 //필수 헤더 정보
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + this.ACCESS_TOKEN);
		HttpEntity<Map<String, String>> entity = new HttpEntity<>(headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Map<String, String>> responseEntity = restTemplate.exchange(
				ENDPOINT_URL_USERINFO,
			    HttpMethod.GET,
			    entity,
			    new ParameterizedTypeReference<Map<String, String>>() {}
			);		
		System.out.println("4.유저정보 응답:" +responseEntity.getBody().toString());    
		
		return responseEntity.getBody();
	}


	@Override
	public boolean isTokenExpired(String accessToken) {

		try {
			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", "Bearer " + accessToken);
			HttpEntity<String> entity = new HttpEntity<>(headers);
			
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<Map<String, String>> responseEntity = restTemplate.exchange(
					ENDPOINT_URL_USERINFO,
				    HttpMethod.POST,
				    entity,
				    new ParameterizedTypeReference<Map<String, String>>() {}
				);
			System.out.println("5.유저정보 응답:" + responseEntity.getBody().toString());
			return false; // 요청 성공 -> 토큰 유효
		} catch (HttpClientErrorException e) {
			if (e.getStatusCode().value() == 401) {
				return true; // 401 Unauthorized -> 토큰 만료
			}
			throw e; // 다른 오류는 예외로 처리
		}
	}


	@Override
	public Map<String, String> requestAccessToken(String code) {
		Map<String, String> bodys = new HashMap<String, String>();
		bodys.put("code"			, code);
		bodys.put("client_id"		, CLIENT_ID);
		bodys.put("client_secret"	, CLIENT_PW);
		bodys.put("redirect_uri"	, CALLBACK_URL);
		bodys.put("grant_type"		, "authorization_code");

		//--------------------------------------------------			
		//방법1) RestTemplate Map 바인딩 + 키로 토큰만 꺼내기
		//--------------------------------------------------
		HttpEntity<Map<String, String>> entity = new HttpEntity<>(bodys);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Map<String, String>> responseEntity = restTemplate.exchange(
		    ENDPOINT_URL_TOKEN,
		    HttpMethod.POST,
		    entity,
		    new ParameterizedTypeReference<Map<String, String>>() {}
		);		
		this.ACCESS_TOKEN = (String)responseEntity.getBody().get("access_token");
		System.out.println("GoogleOauth.requestAccessToken() accessToken:"+ this.ACCESS_TOKEN);
		if (responseEntity.getStatusCode() == HttpStatus.OK) 
			System.out.println(responseEntity.getBody().toString());
		
		//			--------------------------------------------------			
		//			방법2) GoogleRequestVo  Builder + Entity에 담아서 꺼내기
		//			--------------------------------------------------			
		//			RestTemplate restTemplate = new RestTemplate();
		//			GoogleRequest googleRequest = GoogleRequest
		//					.builder()
		//					.clientId(CLIENT_ID)
		//					.clientSecret(CLIENT_PW)
		//					.code(code)
		//					.redirectUri(CALLBACK_URL)
		//					.grantType("authorization_code").build();
		//			System.out.println(googleRequest.toString());
		//			ResponseEntity<GoogleResponse> googleResponse = restTemplate.postForEntity("https://oauth2.googleapis.com/token", googleRequest, GoogleResponse.class);
		//			System.out.println(googleResponse.toString());

		//			--------------------------------------------------
		//			방법3) commonBuildQueryString() 쿼리스트링 만들기
		//			--------------------------------------------------
		//			LOGIN_FORM_URL + "?" + parameterString;
		return responseEntity.getBody();
	}

}