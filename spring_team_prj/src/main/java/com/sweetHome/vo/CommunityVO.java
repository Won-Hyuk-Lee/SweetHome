package com.sweetHome.vo;


import java.util.ArrayList;
import java.util.Date;


import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommunityVO {
	private int communitySeq;
	private String communityName;
	private String communityDescription;
	private ArrayList<CommunityImageVO> images;
	private Date createdDate;
}