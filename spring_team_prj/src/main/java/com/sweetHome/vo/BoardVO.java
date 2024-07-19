package com.sweetHome.vo;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardVO {
	private int boardSeq;
	private String boardTitle;
	private String boardContents;
	private Date createdDate;
	private Date updatedDate;
	private int userSeq;
	private int communitySeq;
	private UserVO user;	
	private CommunityVO community;
	private List<ReplyVO> reply;	
	private List<BoardImagesVO> boardImages;
	private int recommend;
	private int startSeq = 1;
	private int endSeq = 1;
	private int currentPage = 1;
	private int rnum;
	private String searchStr;
}
