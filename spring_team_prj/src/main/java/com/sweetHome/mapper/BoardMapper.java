package com.sweetHome.mapper;

import com.sweetHome.vo.BoardVO;

public interface BoardMapper {
	
	BoardVO boardDetail(int boardSeq); //(�Խñ� �� ������ȸ)
//	boardInsert (�Խñ� +�̹��� �߰�)
//	boardUpdate (�Խñ� ����)
//	boardDelete (�Խñ� ����)
	void boardRecommend(int boardSeq, int userSeq); //(�Խñ� ��õ)
//	boardSearch (�Խñ� ���� �˻�)
//	boardSearch (�Խñ� ���� �˻�)
//	boardSearch (�Խñ� ����+���� �˻�)
//	boardSearch (Ư�� ���� �Խñ� �˻�)
}
