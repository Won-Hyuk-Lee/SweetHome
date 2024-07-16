package com.sweetHome.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
@Repository
@Mapper
public interface AuthMapper {
	void login(); //(기본 로그인 실행)
	void loginOauth(); //(Oauth 로그인)
	void register(); //(회원가입)
	void emailCheck(); //(이메일 인증)
	int nicknameCheck(String userNinkname); //(닉네임 중복체크)
	void findPassword(); //(비밀번호 찾기)
	void passwordUpdate(); //(비밀번호 수정)
}
