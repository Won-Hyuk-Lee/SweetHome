package com.sweetHome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sweetHome.vo.UserVO;
import com.sweetHome.vo.UsersOauthVO;
@Repository
@Mapper
public interface UserMapper {
    void insertUser(UserVO userVO);
    UserVO selectUser(int userSeq);
    UsersOauthVO selectUserOauth(int userSeq);
    List<UserVO> selectAllUser();
    void userUpdate(UserVO userVO);
    void deleteUser(int userSeq);
    UserVO selectUserByEmail(String userEmail);
    public void insertUsersOauthTbl(UsersOauthVO userVO);
    public void updateUserOauthTbl(UsersOauthVO userVO);
}
