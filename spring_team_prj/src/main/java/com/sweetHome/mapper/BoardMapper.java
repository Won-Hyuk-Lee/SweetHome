package com.sweetHome.mapper;

import java.util.ArrayList;

import com.sweetHome.vo.BoardVO;

public interface BoardMapper {
	
	ArrayList<BoardVO> boardList(int CommunitySeq);
	BoardVO boardDetail(int boardSeq); //(게시글 상세 정보조회)
//	boardInsert (게시글 +이미지 추가)
//	boardUpdate (게시글 수정)
//	boardDelete (게시글 삭제)
	void boardRecommend(int boardSeq, int userSeq); //(게시글 추천)
//	boardSearch (게시글 제목 검색)
//	boardSearch (게시글 내용 검색)
//	boardSearch (게시글 제목+내용 검색)
//	boardSearch (특정 유저 게시글 검색)
}
