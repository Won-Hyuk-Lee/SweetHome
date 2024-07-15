package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sweetHome.mapper.CommunityMapper;
import com.sweetHome.vo.CommunityVO;
import com.sweetHome.vo.CommunityImageVO;

@Service
public class CommunityServiceImpl implements CommunityService {
    @Autowired
    private CommunityMapper communityMapper;
    
    @Override
    public List<CommunityVO> svcCommunitySelect() {
        List<CommunityVO> communities = communityMapper.selectCommunity();
        for (CommunityVO community : communities) {
            community.setImages((ArrayList)communityMapper.selectCommunityImages(community.getCommunitySeq()));
        }
        return communities;
    }

    @Override
    public List<CommunityImageVO> svcCommunityImageSelect(int communitySeq) {
        return communityMapper.selectCommunityImages(communitySeq);
    }
}