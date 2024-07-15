package com.sweetHome.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class UserVO {
	private int userSeq;
    private String userEmail;
    private String userPw;
    private String userNickname;
    private String phoneNumber;
    private String userName;
    private String address;
    private String addressDetail;
    private String provider = "LOCAL";
    private Date createdDate; //이거 데이트타입으로 할거임? 아니면 String할거임
    private Date updatedDate;
    private char userRole = 'U';
}
