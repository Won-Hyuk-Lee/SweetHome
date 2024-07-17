package com.sweetHome.mapper;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardMapper {
	
	List<BoardVO> boardList(int CommunitySeq);
	BoardVO boardDetail(int boardSeq); //(게시글 상세 정보조회)
	void boardInsert(BoardVO bvo); //(게시글 추가)
	void boardImagesInsert(BoardImagesVO files); // (이미지 추가) 이거 새로생김 설계할때 없던거
	void boardUpdate(BoardVO bvo); //(게시글 수정)
	void boardDelete(BoardVO bvo); //(게시글 삭제)
	void boardRecommend(int boardSeq, int userSeq); //(게시글 추천)
//	boardSearch (게시글 제목 검색)
//	boardSearch (게시글 내용 검색)
//	boardSearch (게시글 제목+내용 검색)
//	boardSearch (특정 유저 게시글 검색)
}
