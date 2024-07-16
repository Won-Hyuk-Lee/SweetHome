package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardService {
	List<BoardVO> svcBoardList(int communitySeq);
	BoardVO svcBoardDetail(int boardSeq); //(게시글 상세 정보조회)
	void svcBoardInsert(BoardVO bvo, List<BoardImagesVO> flist);// (게시글 +이미지 추가)
//	svcBoardUpdate (게시글 수정)
//	svcBoardDelete (게시글 삭제)
	void svcBoardRecommend(int boardSeq, int userSeq); //(게시글 추천)
//	svcBoardSearch (게시글 제목 검색)
//	svcBoardSearch (게시글 내용 검색)
//	svcBoardSearch (게시글 제목+내용 검색)
//	svcBoardSearch (특정 유저 게시글 검색)
}
