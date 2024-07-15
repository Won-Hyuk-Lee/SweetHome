package com.sweetHome.svc;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.BoardMapper;
import com.sweetHome.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public ArrayList<BoardVO> svcBoardList(int communitySeq){
		return boardMapper.boardList(communitySeq);
	}
	
	public BoardVO svcBoardDetail(int boardSeq){
		return boardMapper.boardDetail(boardSeq);
	} // (�Խñ� �� ������ȸ)
//	svcBoardInsert (�Խñ� +�̹��� �߰�)
//	svcBoardUpdate (�Խñ� ����)
//	svcBoardDelete (�Խñ� ����)
	public void svcBoardRecommend(int boardSeq, int userSeq){
		boardMapper.boardRecommend(boardSeq, userSeq);
	} //(�Խñ� ��õ)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ����+���� �˻�)
//	svcBoardSearch (Ư�� ���� �Խñ� �˻�)
}
