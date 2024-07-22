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
        if(UserVO.getUsersOauthVO()!=null)
        {
        	//방금회원가입한 유저 이메일로 nextval 유저 seq찾아옴
        	UserVO uvo = UserMapper.selectUserByEmail(UserVO.getUserEmail());
        	//찾아온 seq로 OauthVO에 seq채워줌
        	UserVO.getUsersOauthVO().setUserSeq(uvo.getUserSeq());
        UserMapper.insertUsersOauthTbl(UserVO.getUsersOauthVO());
        }
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
