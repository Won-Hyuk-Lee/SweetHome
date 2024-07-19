package com.sweetHome.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.BoardMapper;
import com.sweetHome.mapper.ReplyMapper;
import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;
import com.sweetHome.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyMapper replyMapper;
	
	// 커뮤니티 시퀀스를 기반으로 게시글 목록을 가져오는 메서드
    public List<ReplyVO> svcReplyList(int boardSeq){
        return replyMapper.replyList(boardSeq);
    }
    public String svcReplyInsert(ReplyVO replyVO) {
    	if (replyVO.getReply().isEmpty()) {
    		return "error";
    	} else {
    		replyMapper.replyInsert(replyVO);
    		return "success";
    	}
    }
    
    public void svcReplyDelete(int replySeq) {
    	replyMapper.replyDelete(replySeq);
    }

}
