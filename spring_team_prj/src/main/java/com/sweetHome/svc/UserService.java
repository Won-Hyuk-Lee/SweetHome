package com.sweetHome.svc;

import java.util.List;

import com.sweetHome.vo.UserVO;

public interface UserService {
    UserVO svcUserDetail(int userSeq);
    void svcUserUpdate(UserVO userVO);
    List<UserVO> svcUserBoardList(int userSeq);
    List<UserVO> svcUserReplies(int userSeq);
    
    void svcUserJoin(UserVO userVO);
    boolean svcUserLogin(UserVO userVO);
}