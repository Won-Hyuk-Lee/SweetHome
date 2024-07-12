package com.sweetHome.mapper;

import java.util.List;

import com.sweetHome.vo.UserVO;

public interface UserMapper {
    void insertUser(UserVO userVO);
    UserVO selectUser(int usereq);
    List<UserVO> selectAllUser();
    void updateUser(UserVO userVO);
    void deleteUser(int userSeq);
    UserVO selectUserByEmail(String userEmail);
}
