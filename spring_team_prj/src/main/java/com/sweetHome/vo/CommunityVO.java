package com.sweetHome.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommunityVO {
	private int communitySeq;
	private String communityName;
	private String communityDescription;
	private String createdDate;
	private List<CommunityImageVO> images;

}
