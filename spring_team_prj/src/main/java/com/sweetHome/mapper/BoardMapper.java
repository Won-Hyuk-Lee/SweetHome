package com.sweetHome.mapper;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardMapper {
	
	// 게시글 목록 조회
	List<BoardVO> boardList(BoardVO boardVO);

	int boardCount(int communitySeq); //총게시물수
	
	// 게시글 상세 정보조회
	BoardVO boardDetail(int boardSeq);

	// 게시글 추천 조회(개수 가져오는거)
	int boardRecommend(int boardSeq);

	// 게시글 추가
	void boardInsert(BoardVO bvo);

	// 이미지 추가 (새로 생성됨)
	void boardImagesInsert(BoardImagesVO files);

	// 게시글 수정
	void boardUpdate(BoardVO bvo);

	// 게시글 삭제
	void boardDelete(BoardVO bvo);

	// 게시글 추천 추가
	void boardRecommendInsert(BoardVO bvo);

	// 게시글 추천 중복 확인
	int boardRecommendCheck(BoardVO bvo);

	// 게시글 제목 검색
	// boardSearch

	// 게시글 내용 검색
	// boardSearch

	// 게시글 제목+내용 검색
	// boardSearch

	// 특정 유저 게시글 검색
	// boardSearch
}
