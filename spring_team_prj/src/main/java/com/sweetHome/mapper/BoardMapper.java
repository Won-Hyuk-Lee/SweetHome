package com.sweetHome.mapper;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface BoardMapper {
	
	List<BoardVO> boardList(int CommunitySeq);
	BoardVO boardDetail(int boardSeq); //(�Խñ� �� ������ȸ)
	void boardInsert(BoardVO bvo); //(�Խñ� �߰�)
	void boardImagesInsert(BoardImagesVO files); // (�̹��� �߰�) �̰� ���λ��� �����Ҷ� ������
	void boardUpdate(BoardVO bvo); //(�Խñ� ����)
	void boardDelete(BoardVO bvo); //(�Խñ� ����)
	void boardRecommend(int boardSeq, int userSeq); //(�Խñ� ��õ)
//	boardSearch (�Խñ� ���� �˻�)
//	boardSearch (�Խñ� ���� �˻�)
//	boardSearch (�Խñ� ����+���� �˻�)
//	boardSearch (Ư�� ���� �Խñ� �˻�)
}
