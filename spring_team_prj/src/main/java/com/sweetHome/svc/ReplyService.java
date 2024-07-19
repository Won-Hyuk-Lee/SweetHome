package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;
import com.sweetHome.vo.ReplyVO;

public interface ReplyService {
    List<ReplyVO> svcReplyList(int boardSeq);
    String svcReplyInsert(ReplyVO replyVO);
    void svcReplyDelete(int replySeq);
}
