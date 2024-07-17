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
		List<BoardVO> blist = boardMapper.boardList(communitySeq);
		for (BoardVO bvo : blist) {
			bvo.setRecommend(boardMapper.boardRecommend(bvo.getBoardSeq()));
		}
		return blist;
	}
	
	public BoardVO svcBoardDetail(int boardSeq){
		BoardVO bvo = boardMapper.boardDetail(boardSeq);		// recommend 제외 detail 가져오기
		bvo.setRecommend(boardMapper.boardRecommend(boardSeq));	// recommend 수 뽑아와서 vo에 넣기
		return bvo;
				
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
	
	public int svcBoardRecommendInsert(BoardVO bvo){
		int check = boardMapper.boardRecommendCheck(bvo);
		if (check == 0) {
			boardMapper.boardRecommendInsert(bvo);
		}
		return check;
		
	} //(게시글 추천)
//	svcBoardSearch (게시글 제목 검색)
//	svcBoardSearch (게시글 내용 검색)
//	svcBoardSearch (게시글 제목+내용 검색)
//	svcBoardSearch (특정 유저 게시글 검색)
}
