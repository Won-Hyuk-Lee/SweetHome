package com.sweetHome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sweetHome.vo.UserVO;
@Repository
@Mapper
public interface UserMapper {
    void insertUser(UserVO userVO);
    UserVO selectUser(int usereq);
    List<UserVO> selectAllUser();
    void updateUser(UserVO userVO);
    void deleteUser(int userSeq);
    UserVO selectUserByEmail(String userEmail);
}
