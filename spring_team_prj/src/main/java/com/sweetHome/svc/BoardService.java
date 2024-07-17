package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardService {
	List<BoardVO> svcBoardList(int communitySeq);
	BoardVO svcBoardDetail(int boardSeq); //(�Խñ� �� ������ȸ)
//	void svcBoardInsert(BoardVO bvo, List<BoardImagesVO> flist);// (�Խñ� +�̹��� �߰�)
	void svcBoardInsert(BoardVO bvo);
	void svcBoardUpdate(BoardVO bvo); //(�Խñ� ����)
	void svcBoardDelete(BoardVO bvo); //(�Խñ� ����)
	int svcBoardRecommendInsert(BoardVO bvo); //(�Խñ� ��õ)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ����+���� �˻�)
//	svcBoardSearch (Ư�� ���� �Խñ� �˻�)
}
