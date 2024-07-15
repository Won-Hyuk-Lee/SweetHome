package com.sweetHome.mapper;

import java.util.List;
import com.sweetHome.vo.CommunityVO;
import com.sweetHome.vo.CommunityImageVO;

public interface CommunityMapper {
    public List<CommunityVO> selectCommunity();
    public List<CommunityImageVO> selectCommunityImages(int communitySeq);
}