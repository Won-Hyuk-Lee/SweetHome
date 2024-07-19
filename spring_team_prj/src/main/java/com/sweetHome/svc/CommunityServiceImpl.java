package com.sweetHome.svc;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sweetHome.mapper.CommunityMapper;
import com.sweetHome.vo.CommunityImagesVO;
import com.sweetHome.vo.CommunityVO;

@Service
public class CommunityServiceImpl implements CommunityService {
    @Autowired
    private CommunityMapper communityMapper;
    
    // 모든 커뮤니티와 해당 이미지를 조회
    @Override
    public List<CommunityVO> svcCommunitySelect() {
        List<CommunityVO> communities = communityMapper.selectCommunity();
        for (CommunityVO community : communities) {
            community.setImage(communityMapper.selectCommunityImages(community.getCommunitySeq()));
        }
        return communities;
    }

    // 커뮤니티 시퀀스로 이미지를 조회
    @Override
    public CommunityImagesVO svcCommunityImageSelect(int communitySeq) {
        return communityMapper.selectCommunityImages(communitySeq);
    }
}