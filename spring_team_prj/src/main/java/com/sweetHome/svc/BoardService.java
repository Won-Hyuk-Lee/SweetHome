package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardService {
	List<BoardVO> svcBoardList(int communitySeq);
	BoardVO svcBoardDetail(int boardSeq); //(�Խñ� �� ������ȸ)
	void svcBoardInsert(BoardVO bvo, List<BoardImagesVO> flist);// (�Խñ� +�̹��� �߰�)
//	svcBoardUpdate (�Խñ� ����)
//	svcBoardDelete (�Խñ� ����)
	void svcBoardRecommend(int boardSeq, int userSeq); //(�Խñ� ��õ)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ����+���� �˻�)
//	svcBoardSearch (Ư�� ���� �Խñ� �˻�)
}
