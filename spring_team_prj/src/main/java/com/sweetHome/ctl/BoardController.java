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
	} // (게시글 전체 조회)
	
	@RequestMapping(value = "/board_detail", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<BoardVO> ctlBoardDetail(@RequestParam("boardSeq") int boardSeq, Model model) {
		BoardVO bvo = boardService.svcBoardDetail(boardSeq);
		model.addAttribute("KEY_BOARDVO", bvo);
		
		return new ResponseEntity<BoardVO> (bvo, HttpStatus.OK);
	} //(게시글 상세 정보조회)
	
	
//	ctlBoardInsert (게시글 +이미지 추가)
//	ctlBoardUpdate (게시글 수정)
//	ctlBoardDelete (게시글 삭제)
	
	@RequestMapping(value="board_recommend", method=RequestMethod.POST)
	public void ctlBoardRecommend(@RequestParam("boardSeq") int boardSeq, @RequestParam("userSeq") int userSeq) {
		boardService.svcBoardRecommend(boardSeq, userSeq);
	} //(게시글 추천)
//	ctlBoardSearch (게시글 제목 검색)
//	ctlBoardSearch (게시글 내용 검색)
//	ctlBoardSearch (게시글 제목+내용 검색)
//	ctlBoardSearch (특정 유저 게시글 검색)
}
