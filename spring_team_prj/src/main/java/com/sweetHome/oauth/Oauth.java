package com.sweetHome.oauth;

import java.util.Map;

public interface Oauth {
    
	
	public String getLoginFormURL();
    public Map<String, String> requestAccessToken(String code);
    public Map<String, String> getUserInfo(String accessToken);
    public boolean isTokenExpired(String accessToken);
	public String getAccessTokenByRefreshToken(String refreshToken);
		
    default SocialType type() {
        if (this instanceof GoogleOauth) {
            return SocialType.GOOGLE;
        } else if (this instanceof NaverOauth) {
            return SocialType.NAVER;
        } else if (this instanceof KakaoOauth) {
            return SocialType.KAKAO;
        } else {
            return null;
        }
    }
}