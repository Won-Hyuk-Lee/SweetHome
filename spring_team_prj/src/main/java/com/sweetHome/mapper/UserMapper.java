package com.sweetHome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sweetHome.vo.BoardVO;
import com.sweetHome.vo.ReplyVO;
import com.sweetHome.vo.UserVO;
import com.sweetHome.vo.UsersOauthVO;
@Repository
@Mapper
public interface UserMapper {
	
	List<BoardVO> boardList(BoardVO bvo);
	int boardRecommend(int boardSeq);
	List<ReplyVO> userReplies(@Param("userSeq") int userSeq);
	
    void insertUser(UserVO userVO);
    UserVO selectUser(int userSeq);
    UsersOauthVO selectUserOauth(int userSeq);
    List<UserVO> selectAllUser();
    int boardCount(int userSeq); //총게시물수
    void userUpdate(UserVO userVO);
    void deleteUser(int userSeq);
    UserVO selectUserByEmail(String userEmail);
    public void insertUsersOauthTbl(UsersOauthVO userVO);
    public void updateUserOauthTbl(UsersOauthVO userVO);
}
