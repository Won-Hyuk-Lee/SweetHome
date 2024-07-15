package com.sweetHome.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommunityImagesVO {
	private int commuityImageSeq;
	private String oname;
	private String sname;
	private int fsize;
	private String fpath;
	private int communitySeq;
}
