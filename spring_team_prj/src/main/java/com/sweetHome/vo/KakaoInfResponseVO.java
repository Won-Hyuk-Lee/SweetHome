package com.sweetHome.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class KakaoInfResponseVO {
    private String iss;					//ID 토큰을 발급한 인증 기관 정보
    private String aud;					//ID 토큰이 발급된 앱의 앱 키
    private String sub;					//ID 토큰에 해당하는 사용자의 회원번호
    private String iat;					//ID 토큰 발급 또는 갱신 시각, UNIX 타임스탬프(Timestamp)
    private String exp;					//ID 토큰 만료 시간, UNIX 타임스탬프(Timestamp)
    private String authTime;	
    private String nonce;
    private String nickName;
    private String picture;
    private String email;
}