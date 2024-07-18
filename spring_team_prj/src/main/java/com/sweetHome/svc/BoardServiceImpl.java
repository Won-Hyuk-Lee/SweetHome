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
	
	// 커뮤니티 시퀀스를 기반으로 게시글 목록을 가져오는 메서드
    public List<BoardVO> svcBoardList(int communitySeq){
        List<BoardVO> blist = boardMapper.boardList(communitySeq);
        for (BoardVO bvo : blist) {
            bvo.setRecommend(boardMapper.boardRecommend(bvo.getBoardSeq()));
        }
        return blist;
    }
    
    // 게시글 시퀀스를 기반으로 게시글 세부 정보를 가져오는 메서드
    public BoardVO svcBoardDetail(int boardSeq){
        BoardVO bvo = boardMapper.boardDetail(boardSeq);       // 추천 수를 포함한 게시글 상세 정보를 가져옴
        bvo.setRecommend(boardMapper.boardRecommend(boardSeq));  // 추천 수를 BoardVO 객체에 설정
        return bvo;
    } // (게시글 상세 조회)
    
    // 게시글을 삽입하는 메서드
    public void svcBoardInsert(BoardVO bvo) {
        boardMapper.boardInsert(bvo);
    }
    
    // 게시글을 업데이트하는 메서드
    public void svcBoardUpdate(BoardVO bvo) {
        boardMapper.boardUpdate(bvo);
    } // (게시글 수정)
    
    // 게시글을 삭제하는 메서드
    public void svcBoardDelete(BoardVO bvo) {
        boardMapper.boardDelete(bvo);
    } // (게시글 삭제)
    
    // 게시글 추천을 삽입하는 메서드
    public int svcBoardRecommendInsert(BoardVO bvo){
        int check = boardMapper.boardRecommendCheck(bvo);
        if (check == 0) {
            boardMapper.boardRecommendInsert(bvo);
        }
        return check;
    } // (게시글 추천 삽입)
    
//	svcBoardSearch 제목
//	svcBoardSearch 내용
//	svcBoardSearch 제목+내용
}
