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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.sweetHome.vo.GoogleRequestVO;
import com.sweetHome.vo.GoogleResponseVO;

@Component
public class KakaoOauth implements Oauth {

	@Value("${kakao.loginform.url}")
	private String LOGIN_FORM_URL;
	@Value("${kakao.client.id}")
	private String CLIENT_ID;
	@Value("${kakao.redirect.uri}")
	private String CALLBACK_URL;
	@Value("${kakao.endpoint.token}")
	private String ENDPOINT_URL_TOKEN;
	@Value("${kakao.endpoint.userinfo}")
	private String ENDPOINT_URL_USERINFO;
	@Value("${kakao.client.secret}")
	private String client_secret;
	private String ACCESS_TOKEN  = "";
	@Override
	public String getLoginFormURL() {
		Map<String, Object> params = new HashMap<>();
		params.put("scope"			, "account_email%20profile_nickname%20profile_image");
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
		// 필수 헤더 정보
	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	    headers = new HttpHeaders();
	    headers.set("Authorization", "Bearer " + accessToken);
	    RestTemplate restTemplate = new RestTemplate();
	    // 사용자 정보 요청
	    HttpEntity<String> userInfoEntity = new HttpEntity<>(headers);

	    ResponseEntity<Map> userinfoResponse = restTemplate.exchange(ENDPOINT_URL_USERINFO, HttpMethod.GET, userInfoEntity, Map.class);
	    System.out.println("5.유저정보 응답:" + userinfoResponse.toString());

	    // 유저 정보 추출
	    Map<String, Object> userinfoMap = userinfoResponse.getBody();
	    Map<String, Object> kakaoAccount = (Map<String, Object>) userinfoMap.get("kakao_account");
	    Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");

	    // 필요한 정보만 추출하여 반환할 맵 생성
	    Map<String, String> result = new HashMap<>();
	    result.put("access_token", accessToken);
	    result.put("email", (String) kakaoAccount.get("email"));
	    result.put("name", (String) profile.get("nickname"));
	    result.put("picture", (String) profile.get("profile_image_url"));
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
	    // 필수 헤더 정보
	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	    // 필수 바디정보
	    MultiValueMap<String, String> bodys = new LinkedMultiValueMap<>();
	    bodys.add("code", code); // 인가 코드
	    bodys.add("client_id", CLIENT_ID); // 클라이언트 ID
	    bodys.add("redirect_uri", CALLBACK_URL); // 리다이렉트 URI
	    bodys.add("grant_type", "authorization_code"); // 인가 코드 부여 타입
	    bodys.add("client_secret", client_secret); // 클라이언트 시크릿

	    // HttpEntity (헤더+바디) 생성
	    HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(bodys, headers);

	    RestTemplate restTemplate = new RestTemplate();
	    ResponseEntity<Map> tokenResponse = restTemplate.exchange(ENDPOINT_URL_TOKEN, HttpMethod.POST, entity, Map.class);
	    Map<String, String> bodyMap = tokenResponse.getBody();
	    String accessToken = (String) bodyMap.get("access_token");

	    System.out.println("2.토큰 응답(body): " + tokenResponse.toString());
	    System.out.println("2.토큰 응답(token): " + accessToken);
	    return bodyMap;
	}


	

}
