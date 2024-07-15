package com.sweetHome.svc;

import java.util.List;
import com.sweetHome.vo.CommunityVO;
import com.sweetHome.vo.CommunityImageVO;

public interface CommunityService {
    public List<CommunityVO> svcCommunitySelect();
    public List<CommunityImageVO> svcCommunityImageSelect(int communitySeq);
}