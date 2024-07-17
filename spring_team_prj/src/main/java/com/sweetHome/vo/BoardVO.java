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
	private UserVO user;							// userNickname 받는 join 위해서
	private CommunityVO community;					// community name 받는 join 위해서
	private List<ReplyVO> reply;				// board 랑 reply 랑 1:n 관계라서 arrayList로 받음
	private List<BoardImagesVO> boardImages;	// board 랑 boardImages랑 1:n 관계라서 arrayList로 받음
	private List<RecommendVO> recommend;		// board 랑 recommend랑 1:n 관계라서 arrayList로 받음
}
