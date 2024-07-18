package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardService {
    // 커뮤니티 시퀀스를 기반으로 게시글 목록을 가져오는 메서드
    List<BoardVO> svcBoardList(int communitySeq);    

    // 게시글 시퀀스를 기반으로 게시글 세부 정보를 가져오는 메서드
    BoardVO svcBoardDetail(int boardSeq);            

    // 게시글을 삽입하는 메서드
    void svcBoardInsert(BoardVO bvo);

    // 게시글을 업데이트하는 메서드
    void svcBoardUpdate(BoardVO bvo);                

    // 게시글을 삭제하는 메서드
    void svcBoardDelete(BoardVO bvo);                

    // 게시글 추천을 삽입하는 메서드
    int svcBoardRecommendInsert(BoardVO bvo);    
//	svcBoardSearch 제목
//	svcBoardSearch 내용
//	svcBoardSearch 제목+내용
}
