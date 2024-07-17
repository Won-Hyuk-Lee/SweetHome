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
	
	public List<BoardVO> svcBoardList(int communitySeq){
		return boardMapper.boardList(communitySeq);
	}
	
	public BoardVO svcBoardDetail(int boardSeq){
		return boardMapper.boardDetail(boardSeq);
	} // (�Խñ� �� ������ȸ)
	
//	public void svcBoardInsert(BoardVO bvo, List<BoardImagesVO> files) {
//		boardMapper.boardInsert(bvo);
//		if (files.isEmpty() == true) {
//			for(BoardImagesVO file : files) {
//				file.setBoardSeq(bvo.getBoardSeq());
//				boardMapper.boardImagesInsert(file);
//			}
//		}
//	} //(�Խñ� +�̹��� �߰�)
	public void svcBoardInsert(BoardVO bvo) {
		boardMapper.boardInsert(bvo);
	}
	
	public void svcBoardUpdate(BoardVO bvo) {
		boardMapper.boardUpdate(bvo);
	} //(�Խñ� ����)
	
	public void svcBoardDelete(BoardVO bvo) {
		boardMapper.boardDelete(bvo);
	} //(�Խñ� ����)
	public void svcBoardRecommend(int boardSeq, int userSeq){
		boardMapper.boardRecommend(boardSeq, userSeq);
	} //(�Խñ� ��õ)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ���� �˻�)
//	svcBoardSearch (�Խñ� ����+���� �˻�)
//	svcBoardSearch (Ư�� ���� �Խñ� �˻�)
}
