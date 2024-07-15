package com.sweetHome.ctl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sweetHome.svc.BoardService;
import com.sweetHome.vo.BoardVO;


@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/board_list", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<ArrayList<BoardVO>> ctlBoardList(@RequestParam("communitySeq") int communitySeq, Model model){
		ArrayList<BoardVO> boardList = boardService.svcBoardList(communitySeq);
		model.addAttribute("KEY_BOARDLIST", boardList);
		
		return new ResponseEntity<ArrayList<BoardVO>> (boardList, HttpStatus.OK);
	} // (�Խñ� ��ü ��ȸ)
	
	@RequestMapping(value = "/board_detail", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<BoardVO> ctlBoardDetail(@RequestParam("boardSeq") int boardSeq, Model model) {
		BoardVO bvo = boardService.svcBoardDetail(boardSeq);
		model.addAttribute("KEY_BOARDVO", bvo);
		
		return new ResponseEntity<BoardVO> (bvo, HttpStatus.OK);
	} //(�Խñ� �� ������ȸ)
	
	
//	ctlBoardInsert (�Խñ� +�̹��� �߰�)
//	ctlBoardUpdate (�Խñ� ����)
//	ctlBoardDelete (�Խñ� ����)
	
	@RequestMapping(value="board_recommend", method=RequestMethod.POST)
	public void ctlBoardRecommend(@RequestParam("boardSeq") int boardSeq, @RequestParam("userSeq") int userSeq) {
		boardService.svcBoardRecommend(boardSeq, userSeq);
	} //(�Խñ� ��õ)
//	ctlBoardSearch (�Խñ� ���� �˻�)
//	ctlBoardSearch (�Խñ� ���� �˻�)
//	ctlBoardSearch (�Խñ� ����+���� �˻�)
//	ctlBoardSearch (Ư�� ���� �Խñ� �˻�)
}
