package com.sweetHome.svc;

import java.util.List;
import com.sweetHome.vo.CommunityVO;
import com.sweetHome.vo.CommunityImagesVO;

public interface CommunityService {
    public List<CommunityVO> svcCommunitySelect();
    public CommunityImagesVO svcCommunityImageSelect(int communitySeq);
}