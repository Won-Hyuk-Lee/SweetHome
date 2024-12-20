package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardService {
	
	
	
	int svcBoardCount(int communitySeq);
	
    // 커뮤니티 시퀀스를 기반으로 게시글 목록을 가져오는 메서드
    List<BoardVO> svcBoardList(BoardVO boardVO);    

    // 게시글 시퀀스를 기반으로 게시글 세부 정보를 가져오는 메서드
    BoardVO svcBoardDetail(int boardSeq);            

    // 게시글을 삽입하는 메서드
    void svcBoardInsert(BoardVO bvo);

    // 게시글을 업데이트하는 메서드
    void svcBoardUpdate(BoardVO bvo);                

    // 게시글을 삭제하는 메서드
    void svcBoardDelete(BoardVO bvo);                

    // 게시글 추천을 삽입하는 메서드
    String svcBoardRecommendInsert(BoardVO bvo);    
    
	List<BoardVO> svcBoardSearchByTitle(BoardVO bvo); // 제목
}
