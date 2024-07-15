package com.sweetHome.vo;


import java.util.Date;


import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommunityVO {
	private int communitySeq;
	private String communityName;
	private String communityDescription;
	private CommunityImagesVO image;
	private Date createdDate;
}