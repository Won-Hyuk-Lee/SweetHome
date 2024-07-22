package com.sweetHome.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.AdminMapper;
import com.sweetHome.vo.BoardVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	public List<BoardVO> svcAllBoardList(){
        List<BoardVO> blist = adminMapper.allBoardList();
        for (BoardVO bvo : blist) {
            bvo.setRecommend(adminMapper.boardRecommend(bvo.getBoardSeq()));
        }
		return adminMapper.allBoardList();
	};
	
	public void svcBoardDelete(int boardSeq) {
		adminMapper.deleteBoard(boardSeq);
	}
}
