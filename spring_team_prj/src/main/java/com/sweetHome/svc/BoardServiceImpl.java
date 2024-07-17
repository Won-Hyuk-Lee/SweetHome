package com.sweetHome.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.BoardMapper;
import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<BoardVO> svcBoardList(int communitySeq){
		return boardMapper.boardList(communitySeq);
	}
	
	public BoardVO svcBoardDetail(int boardSeq){
		return boardMapper.boardDetail(boardSeq);
	} // (게시글 상세 정보조회)
	
//	public void svcBoardInsert(BoardVO bvo, List<BoardImagesVO> files) {
//		boardMapper.boardInsert(bvo);
//		if (files.isEmpty() == true) {
//			for(BoardImagesVO file : files) {
//				file.setBoardSeq(bvo.getBoardSeq());
//				boardMapper.boardImagesInsert(file);
//			}
//		}
//	} //(게시글 +이미지 추가)
	public void svcBoardInsert(BoardVO bvo) {
		boardMapper.boardInsert(bvo);
	}
	
	public void svcBoardUpdate(BoardVO bvo) {
		boardMapper.boardUpdate(bvo);
	} //(게시글 수정)
	
	public void svcBoardDelete(BoardVO bvo) {
		boardMapper.boardDelete(bvo);
	} //(게시글 삭제)
	public void svcBoardRecommend(int boardSeq, int userSeq){
		boardMapper.boardRecommend(boardSeq, userSeq);
	} //(게시글 추천)
//	svcBoardSearch (게시글 제목 검색)
//	svcBoardSearch (게시글 내용 검색)
//	svcBoardSearch (게시글 제목+내용 검색)
//	svcBoardSearch (특정 유저 게시글 검색)
}
