package com.sweetHome.mapper;

import java.util.ArrayList;

import com.sweetHome.vo.BoardVO;

public interface BoardMapper {
	
	ArrayList<BoardVO> boardList(int CommunitySeq);
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
