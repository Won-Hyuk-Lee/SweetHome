package com.sweetHome.svc;

import java.util.List;
import com.sweetHome.vo.CommunityVO;
import com.sweetHome.vo.CommunityImagesVO;

public interface CommunityService {
    // 모든 커뮤니티를 선택하는 메서드
    List<CommunityVO> svcCommunitySelect(); 

    // 커뮤니티 시퀀스를 기반으로 커뮤니티 이미지를 선택하는 메서드
    CommunityImagesVO svcCommunityImageSelect(int communitySeq);
}