package com.sweetHome.svc;

import java.util.ArrayList;

import com.sweetHome.vo.BoardVO;

public interface BoardService {
	ArrayList<BoardVO> svcBoardList(int communitySeq);
	BoardVO svcBoardDetail(int boardSeq); //(�Խñ� �� ������ȸ)
//	svcBoardInsert (�Խñ� +�̹��� �߰�)
//	svcBoardUpdate (�Խñ� ����)
//	svcBoardDelete (�Խñ� ����)
	void svcBoardRecommend(int boardSeq, int userSeq); //(�Խñ� ��õ)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ����+���� �˻�)
//	svcBoardSearch (Ư�� ���� �Խñ� �˻�)
}
