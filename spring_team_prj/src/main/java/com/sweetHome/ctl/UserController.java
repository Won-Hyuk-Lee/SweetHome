package com.sweetHome.ctl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sweetHome.svc.UserService;
import com.sweetHome.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService UserService;

	//json - json
	//dataType : json
	//	@RequestMapping(value = "/join", method = RequestMethod.POST)
	//    public UserVO ctlUserJoin(@RequestBody UserVO UserVO) {
	//    	//UserService.svcUserJoin(UserVO);
	//		System.out.println(UserVO.toString());
	//        return UserVO;
	//    }

	//json -- str
	//dataType : "텍스트...., data는 json인 경우
	//	@RequestMapping(value = "/join", method = RequestMethod.POST)
	//    public String ctlUserJoin(@RequestBody UserVO UserVO) {
	//    	//UserService.svcUserJoin(UserVO);
	//		System.out.println(UserVO.toString());
	//        return "텍스트 리턴";
	//    }

	//str --- str
	//dataType : "텍스트...., data는 쿼리스트링(?key=v&ke=vv)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String ctlUserJoin(@ModelAttribute UserVO userVO) {
		System.out.println(userVO.getAddress());
		System.out.println(userVO.getAddressDetail());
		System.out.println(userVO.getUserEmail());
		System.out.println(userVO.getUserPw());
		System.out.println(userVO.getUserNickname());
		System.out.println(userVO.getPhoneNumber());
		UserService.svcUserJoin(userVO);
		return "텍스트 리턴";
	}


	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String ctlUserDetail(@RequestParam("seq") int Usereq, Model model) {
		model.addAttribute("KEY_USERVO", UserService.svcUserDetail(Usereq));
		model.addAttribute("KEY_USEROAUTHVO", UserService.svcUserOauth(Usereq));
		return "jsp/mypage";
	}
	@RequestMapping(value = "/detail_update", method = RequestMethod.GET)
	public String ctlUserDetailUpdate(@RequestParam("seq") int Usereq, Model model) {
		model.addAttribute("KEY_USERVO", UserService.svcUserDetail(Usereq));
		model.addAttribute("KEY_USEROAUTHVO", UserService.svcUserOauth(Usereq));
		return "jsp/mypage_update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String ctlUserUpdate(@ModelAttribute UserVO userVO) {
		System.out.println(userVO.getAddress());
		System.out.println(userVO.getAddressDetail());
		System.out.println(userVO.getUserEmail());
		System.out.println(userVO.getUserPw());
		System.out.println(userVO.getUserNickname());
		System.out.println(userVO.getPhoneNumber());
		UserService.svcUserUpdate(userVO);
		return "성공";
	}

	@RequestMapping(value = "/board_list", method = RequestMethod.POST)
	public List<UserVO> ctlUserBoardList(@RequestParam int Usereq) {
		return UserService.svcUserBoardList(Usereq);
	}

	@RequestMapping(value = "/replies", method = RequestMethod.POST)
	public List<UserVO> ctlUserReplies(@RequestParam int Usereq) {
		return UserService.svcUserReplies(Usereq);
	}



	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String ctlUserLogin(@RequestBody UserVO UserVO) {
		boolean isAuthenticated = UserService.svcUserLogin(UserVO);
		return isAuthenticated ? "Login successful" : "Login failed";
	}

}
