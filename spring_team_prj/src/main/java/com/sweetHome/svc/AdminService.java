package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;

public interface AdminService {
	
	List<BoardVO> svcAllBoardList();
	void svcBoardDelete(int boardSeq);
}
