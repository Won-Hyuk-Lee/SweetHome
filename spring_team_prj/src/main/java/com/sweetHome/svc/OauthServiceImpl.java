package com.sweetHome.svc;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.UserMapper;
import com.sweetHome.oauth.Oauth;
import com.sweetHome.oauth.SocialType;
import com.sweetHome.vo.UserVO;
import com.sweetHome.vo.UsersOauthVO;


@Service
public class OauthServiceImpl {
	@Autowired
	private List<Oauth> socialOauthList;    

	@Autowired
	private UserMapper userMapper;
	
	//OAuth :: GOOGLE/KAKAO/NAVER Oauth 클래스 인스턴스 가져오기 - (JDK1.8이상)
	public Oauth getSocialInstance(SocialType socialType) {
		return socialOauthList.stream()
				.filter(x -> x.type() == socialType)
				.findFirst()
				.orElseThrow(() -> new IllegalArgumentException("Unknown SocialType"));
	}

	//OAuth :: 로그인창 URL 가져오기
	public String svcLoginFormURL(SocialType socialType) {
		//Oauth socialOauth = new GoogleOauth();  //다형성
		//Oauth socialOauth = new KakaoOauth();   //다형성
		Oauth socialOauth = getSocialInstance(socialType);
		return socialOauth.getLoginFormURL();
	}

	//OAuth :: 콜백URL을 통한 엑세스 토근 발급
	public Map<String, String> svcRequestAccessToken(SocialType socialType, String code, String state) {
	Oauth socialOauth = getSocialInstance(socialType);
	return socialOauth.requestAccessToken(code,state);
	}

	//OAuth :: 엑세스 토근을 사용한 구글서비스(profile) 가져오기
	public Map<String, String> svcRequestUserInfo(SocialType socialType, String accessToken) {
		Oauth socialOauth = getSocialInstance(socialType);
		return socialOauth.getUserInfo(accessToken);
	}
	
	//OAuth :: 기존회원/신규회원 구분을 위한 DB조회
	public UserVO svcCheckExistUser(String email) {
		//System.out.println(email+"이메읽밧");
		UserVO existingUserVO  = userMapper.selectUserByEmail(email);
		return existingUserVO;
	}
	
	//OAuth :: 기존유저 토큰저장
	public int svcInsertToken(UsersOauthVO usersTblVO) {
        userMapper.insertUsersOauthTbl(usersTblVO);
        return usersTblVO.getUserSeq();
	}
	//OAuth :: 신규회원: 회원정보저장 + 토큰저장
		public int svcInsertUserToken(UserVO usersTblVO) {
			userMapper.insertUser(usersTblVO);
	        //System.out.println("SEQ CURRVAL:" + usersTblVO.getUserSeq());
	        
	        //user_tbl에 입력한 user_seq 시퀀스번호를 user_oauth의 user_seq값으로 사용
	        usersTblVO.getUsersOauthVO().setUserSeq(usersTblVO.getUserSeq());
	        userMapper.insertUsersOauthTbl(usersTblVO.getUsersOauthVO());
	        return usersTblVO.getUserSeq();
		}
		
	//OAuth :: 기존회원:토큰갱신
	public void svcUpdateToken(UsersOauthVO usersOauthVO) {
		userMapper.updateUserOauthTbl(usersOauthVO);
	}

}