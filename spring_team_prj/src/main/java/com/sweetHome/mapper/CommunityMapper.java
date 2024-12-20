package com.sweetHome.mapper;

import java.util.List;
import com.sweetHome.vo.CommunityVO;
import com.sweetHome.vo.CommunityImagesVO;

public interface CommunityMapper {
	// 커뮤니티 목록 조회
	List<CommunityVO> selectCommunity();

	// 커뮤니티 이미지 조회
	CommunityImagesVO selectCommunityImages(int communitySeq);
}