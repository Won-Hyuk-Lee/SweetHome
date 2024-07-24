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

import com.sweetHome.vo.GoogleRequestVO;
import com.sweetHome.vo.GoogleResponseVO;

import lombok.RequiredArgsConstructor;


@Component
@RequiredArgsConstructor
public class GoogleOauth implements Oauth {
	@Value("${google.loginform.url}")
	private String LOGIN_FORM_URL;
	@Value("${google.client.id}")
	private String CLIENT_ID;
	@Value("${google.client.pw}")
	private String CLIENT_PW;
	@Value("${google.redirect.uri}")
	private String CALLBACK_URL;
	@Value("${google.endpoint.token}")
	private String ENDPOINT_URL_TOKEN;
	@Value("${google.endpoint.userinfo}")
	private String ENDPOINT_URL_USERINFO;
	private String ACCESS_TOKEN  = "";
    
	//	public static String commonBuildQueryString(Map<String, Object> params) {
	//		StringBuilder queryString = new StringBuilder();
	//		try {
	//			for (Map.Entry<String, Object> entry : params.entrySet()) {
	//				if (queryString.length() > 0) {
	//					queryString.append("&");
	//				}
	//				queryString.append(URLEncoder.encode(entry.getKey(), "UTF-8"))
	//				.append("=")
	//				.append(URLEncoder.encode(entry.getValue().toString(), "UTF-8"));
	//			}
	//		} catch(UnsupportedEncodingException e) {
	//			e.printStackTrace();
	//		}
	//		return queryString.toString();
	//	}

	/** 
	 * 구글의 로그인창 주소
	 */
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

	/** 
	 * AccessToken 받기
	 */
	@Override
	public Map<String, String> requestAccessToken(String code,String state) {
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
//					RestTemplate restTemplate2 = new RestTemplate();
//					GoogleRequestVO googleRequest = GoogleRequestVO
//							.builder()
//							.clientId(CLIENT_ID)
//							.clientSecret(CLIENT_PW)
//							.code(code)
//							.redirectUri(CALLBACK_URL)
//							.grantType("authorization_code").build();
//					System.out.println(googleRequest.toString());
//					ResponseEntity<GoogleResponseVO> googleResponse = restTemplate2.postForEntity("https://oauth2.googleapis.com/token", googleRequest, GoogleResponseVO.class);
//					System.out.println(googleResponse.toString());

		//			--------------------------------------------------
		//			방법3) commonBuildQueryString() 쿼리스트링 만들기
		//			--------------------------------------------------
		//			LOGIN_FORM_URL + "?" + parameterString;
		return responseEntity.getBody();
	}

	/** 
	 * AccessToken을 사용해 유저정보 받기
	 */
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
		  // 유저 정보 추출

	    // 필요한 정보만 추출하여 반환할 맵 생성
	    Map<String, String> result = new HashMap<>();
	    result.put("access_token", accessToken);
	    result.put("email", (String) responseEntity.getBody().get("email"));
	    result.put("name", (String) responseEntity.getBody().get("name"));
	    result.put("picture", (String) responseEntity.getBody().get("picture"));
	    System.out.println(result.toString());
	    return result;
	}

	/** 
	 * refreshToken을 사용해 AccessToken 재발급 받기
	 */
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

	/** 
	 * AccessToken 만료 여부 체크
	 */
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




}