package com.sweetHome.vo;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;

@Component   
@Data     
public class UsersOauthVO {
	private int userSeq;
	private String imageUrl;
	private String accessToken;
	private String refreshToken;
	private String updatedDate;
}
