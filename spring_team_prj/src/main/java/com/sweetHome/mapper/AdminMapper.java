package com.sweetHome.mapper;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface AdminMapper {
	
	List<BoardVO> allBoardList();
	void deleteBoard(int boardSeq);
	// 게시글 추천 조회(개수 가져오는거)
	int boardRecommend(int boardSeq);
}
