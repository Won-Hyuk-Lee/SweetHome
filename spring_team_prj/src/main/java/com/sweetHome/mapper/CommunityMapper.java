package com.sweetHome.mapper;

import java.util.List;
import com.sweetHome.vo.CommunityVO;
import com.sweetHome.vo.CommunityImagesVO;

public interface CommunityMapper {
    public List<CommunityVO> selectCommunity();
    public CommunityImagesVO selectCommunityImages(int communitySeq);
}