package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.UserMapper;
import com.sweetHome.vo.BoardVO;
import com.sweetHome.vo.ReplyVO;
import com.sweetHome.vo.UserVO;
import com.sweetHome.vo.UsersOauthVO;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper UserMapper;

    public int svcBoardCount(int userSeq) {
		return UserMapper.boardCount(userSeq);
	}
    @Override
    public UserVO svcUserDetail(int UserSeq) {
        return UserMapper.selectUser(UserSeq);
    }

    @Override
    public void svcUserUpdate(UserVO UserVO) {
        UserMapper.userUpdate(UserVO);
    }

    @Override
    public List<BoardVO> svcUserBoardList(BoardVO boardVO) {
    	List<BoardVO> blist = UserMapper.boardList(boardVO);
        for (BoardVO bvo : blist) {
            bvo.setRecommend(UserMapper.boardRecommend(bvo.getBoardSeq()));
        }
        return blist;
    }

    public List<ReplyVO> svcUserReplies(int boardSeq){
        return UserMapper.userReplies(boardSeq);
    }
    
    @Override
    public void svcUserJoin(UserVO UserVO) {
        UserMapper.insertUser(UserVO);
    }

    @Override
    public boolean svcUserLogin(UserVO UserVO) {

        return false;
    }

	@Override
	public UsersOauthVO svcUserOauth(int userSeq) {
		return 	UserMapper.selectUserOauth(userSeq);
	}
    
}
