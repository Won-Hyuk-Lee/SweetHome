package com.sweetHome.mapper;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;
import com.sweetHome.vo.ReplyVO;

public interface ReplyMapper {
	
	// 게시글 목록 조회
	List<ReplyVO> replyList(int boardSeq);
	void replyInsert(ReplyVO replyVO);
	void replyDelete(int replySeq);
}
