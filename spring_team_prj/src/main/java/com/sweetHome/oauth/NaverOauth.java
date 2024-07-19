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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
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
		
		// 헤더 정보 설정
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + accessToken);

		// 요청 엔티티 설정
		HttpEntity<String> entity = new HttpEntity<>(headers);

		// RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();

		// 사용자 정보 요청
		ResponseEntity<Map> userinfoResponse = restTemplate.exchange(
		        ENDPOINT_URL_USERINFO,
		        HttpMethod.GET,
		        entity,
		        Map.class
		);

		// 응답에서 사용자 정보 추출
		Map<String, Object> responseBody = (Map<String, Object>) userinfoResponse.getBody().get("response");

		// 필요한 정보만 추출하여 반환할 맵 생성
		Map<String, String> result = new HashMap<>();
		result.put("access_token", accessToken);
		result.put("email", (String) responseBody.get("email"));
		result.put("name", (String) responseBody.get("name"));
		result.put("picture", (String) responseBody.get("profile_image"));
		result.put("phone", (String) responseBody.get("mobile"));

		// 결과 출력
		System.out.println(result.toString());

		    return result;
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
	public Map<String, String> requestAccessToken(String code,String state) {
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
        System.out.println(code);
        System.out.println(CLIENT_ID);
        System.out.println(CLIENT_PW);
        System.out.println(CALLBACK_URL);
        System.out.println(state);
    	// HttpEntity (헤더+바디) 생성
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(bodys, headers);
        
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Map> tokenResponse = restTemplate.exchange(ENDPOINT_URL_TOKEN, HttpMethod.POST, entity, Map.class);
		Map<String, String> bodyMap = tokenResponse.getBody();
		String accessToken = (String) bodyMap.get("access_token");
		System.out.println("2.토큰 응답(body): "  + bodyMap.toString());
		System.out.println("2.토큰 응답(token): " + accessToken);
		   
        
		return bodyMap;
	}


}