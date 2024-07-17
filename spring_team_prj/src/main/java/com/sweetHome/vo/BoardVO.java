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
	private UserVO user;							// userNickname �޴� join ���ؼ�
	private CommunityVO community;					// community name �޴� join ���ؼ�
	private List<ReplyVO> reply;				// board �� reply �� 1:n ����� arrayList�� ����
	private List<BoardImagesVO> boardImages;	// board �� boardImages�� 1:n ����� arrayList�� ����
	private List<RecommendVO> recommend;		// board �� recommend�� 1:n ����� arrayList�� ����
}
