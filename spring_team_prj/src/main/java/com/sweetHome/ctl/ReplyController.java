package com.sweetHome.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sweetHome.svc.BoardService;
import com.sweetHome.svc.ReplyService;
import com.sweetHome.vo.BoardVO;
import com.sweetHome.vo.ReplyVO;


@RequestMapping(value = "/reply")
@Controller
public class ReplyController {
	
	@Autowired
	ReplyService replyService;

	@RequestMapping(value = "/reply_list", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<ReplyVO>> ctlReplyDetail(@RequestParam("boardSeq") int boardSeq){
			List<ReplyVO> rlist = replyService.svcReplyList(boardSeq);
			return new ResponseEntity<List<ReplyVO>> (rlist, HttpStatus.OK);
	}// (댓글 정보 조회 REST)
	
	@RequestMapping(value = "/reply_insert", method=RequestMethod.POST)
	@ResponseBody
	public String ctlReplyInsert(@ModelAttribute ReplyVO replyVO){
		String result = replyService.svcReplyInsert(replyVO);
		return result;
	}// (댓글 추가 REST)
	
	@RequestMapping(value = "/reply_delete", method=RequestMethod.POST)
	@ResponseBody
	public void ctlReplyDelete(@RequestParam("replySeq") int replySeq){
		replyService.svcReplyDelete(replySeq);
	}// (댓글 삭제 REST)
//	ctlReplySearch// (댓글 검색)
//	ctlReplySearch// (특정 유저 댓글 검색)
}
