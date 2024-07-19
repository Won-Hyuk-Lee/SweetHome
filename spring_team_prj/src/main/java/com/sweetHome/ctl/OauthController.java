package com.sweetHome.ctl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sweetHome.oauth.SocialType;
import com.sweetHome.svc.AuthService;
import com.sweetHome.svc.OauthServiceImpl;
import com.sweetHome.svc.UserService;
import com.sweetHome.vo.UserVO;
import com.sweetHome.vo.UsersOauthVO;

@Controller
public class OauthController {
	@Autowired
	private OauthServiceImpl oauthService;
	@Autowired
	private AuthService authService;
	@Autowired
	private UserService userService;
		 
//	//로그인 폼 : 일반 로그인
//	@RequestMapping(value="/form_login_process", method = RequestMethod.POST)
//	public String ctlFormLoginProcess(Model model, HttpServletRequest request,
//			@RequestParam("userEmail") String userEmail,
//			@RequestParam("userPW")   String userPw) {
//		
//		UserVO paramVO = new UserVO();
//		paramVO.setUserEmail(userEmail);
//		paramVO.setUserPw(userPw);
//		authService.svcLogin(userEmail, userPw);
//		
//		String viewPage = "lec14_auth/login_page";
//		//로그인성공
//		if(paramVO != null) {
//			request.getSession().setAttribute("SESS_EMAIL"		, paramVO.getUserEmail());
//			request.getSession().setAttribute("SESS_ROLE"		, paramVO.getUserRole());
//			request.getSession().setAttribute("SESS_USERNAME"	, paramVO.getUserName());
//			request.getSession().setAttribute("SESS_PROVIDER"	, "local");
//			request.getSession().setAttribute("SESS_PICTURE"	, "https://icons.veryicon.com/png/o/miscellaneous/youyinzhibo/guest.png");  //게스트기본이미지
//			//mypage.jsp로 이동
//			model.addAttribute("MY_USERSVO", paramVO);
//			viewPage = "redirect: /mypage";
//		//로그인 실패
//		} else {
//			viewPage = "redirect: /login_page";
//		}
//		
//		return viewPage;
//	}
	
//	//로그아웃
//	@RequestMapping(value="/form_logout_process", method = RequestMethod.POST)
//	public String ctlFormLoginProcess(Model model, HttpServletRequest request) {
//		request.getSession().invalidate();
//		request.getSession().setMaxInactiveInterval(0);
//		return "redirect: /login_page";
//	}
//	
	//http://localhost:8089/mypage/GOOGLE
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String ctlViewMypage(Model model, HttpServletRequest request) {
		//ACCESS TOKEN을 사용해 REST 서비스(유저정보) 받기
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("SESS_USERVO");
		SocialType socialType = (SocialType)session.getAttribute("SESS_SOCIALTYPE");
		String accessToken = userVO.getUsersOauthVO().getAccessToken();
		Map<String, String> userInfo = oauthService.svcRequestUserInfo(socialType, accessToken);
		model.addAttribute("MY_USERVO", userInfo);		
		System.out.println("마이페이지");
		return "lec14_auth/mypage";
	}
	
	
//	@RequestMapping(value="/login_page", method = RequestMethod.GET)
//	public String ctlViewLoginPage(Model model, HttpServletRequest request) {
//		return "lec14_auth/login_page";
//	}
//		
	/**
	 * 구글/네이버/카카오로 로그인 시 로그인창 이동 --> 회원 동의 후 /oauth2callback 자동 호출
	 * @param socialType (GOOGLE, NAVER, KAKAO)
	 */
	//http://localhost:8089/login/GOOGLE
	@RequestMapping(value = "/login/{socialType}", method = RequestMethod.GET)
	public String loginForm(Model model 
									, @PathVariable("socialType") SocialType socialType
									, HttpServletRequest request ) {
		String loginFormUrl = oauthService.svcLoginFormURL(socialType);
		System.out.println(loginFormUrl);
		request.getSession().setAttribute("SESS_SOCIALTYPE", socialType);
		return "redirect:" + loginFormUrl;
	}

	/**
	 * callback 통해 access token 획득 후 신규회원(회원가입페이지)/기존회원(토큰저장 후 마이페이지) 이동 
	 * @param socialType (GOOGLE, NAVER, KAKAO)
	 */
	//http://localhost:8089/oauth2callback/GOOGLE
	@RequestMapping(value="/oauth2callback/{socialType}", method = RequestMethod.GET)
	public String ctlCallback(Model model, @PathVariable("socialType") SocialType socialType,
	@RequestParam("code") String code,
	@RequestParam(value="state", required = false) String state,
	HttpServletRequest request) {
		//??????
        socialType = (SocialType) request.getSession().getAttribute("SESS_SOCIALTYPE");
        System.out.println(socialType +"----" + code);
        
		//CODE를 사용해 ACCESS TOKEN 받기
		Map<String, String> responseMap = oauthService.svcRequestAccessToken(socialType, code,state);
		String accessToken  = (String) responseMap.get("access_token");
		String refreshToken = (String) responseMap.get("refresh_token");
		System.out.println("OauthController.ctlCallback() access_token:"+accessToken);
		System.out.println("OauthController.ctlCallback() refresh_token:"+refreshToken);

		//		//-------------------------------------------------------------------------
		//		// 토큰 유효성 검증
		//		// 엔드포인트 	: https://oauth2.googleapis.com/tokeninfo
		//		// 파라미터	: access_token/id_token
		//		//-------------------------------------------------------------------------
		//		//String jwtToken = googleResponseVO.getBody().getId_token();
		//		RestTemplate restTemplate = new RestTemplate();
		//		Map<String, String> map=new HashMap<>();
		//		map.put("id_token", accessToken);
		//		ResponseEntity<GoogleInfResponseVO> googleInfResponse = restTemplate.postForEntity("https://oauth2.googleapis.com/tokeninfo", map, GoogleInfResponseVO.class);
		//		System.out.println(googleInfResponse.toString());

		//ACCESS TOKEN을 사용해 REST 서비스(유저정보) 받기
		Map<String, String> userInfo = oauthService.svcRequestUserInfo(socialType, accessToken);
		System.out.println("OauthController.ctlCallback():" + userInfo.toString());
		//userinfo :: {id=111108297176061140644, email=opencv.korea@gmail.com, verified_email=true, name=OPENCV KOREA, given_name=OPENCV, family_name=KOREA, picture=https://lh3.googleusercontent.com/a/ACg8ocI1r5lwhcKMlKu4FmZQYTsh5Se3b56jPD0WFmn3XrvMWLJ2_pY=s96-c}
		
		String viewPage = "jsp/login";
		System.out.println(viewPage+" 어디고");
		if (userInfo != null) {
			//------------------------------------------------------------
			//userInfo.get("email")을 사용해 DB조회(기존회원 & 신규회원)
			//------------------------------------------------------------
			UserVO  existingUserVO = oauthService.svcCheckExistUser(userInfo.get("email"));
			if (existingUserVO == null) {
				//OAuth :: 신규 회원일 경우 -- accessToken : 세션에 담고 추가 회원가입페이지로 이동
				existingUserVO=new UserVO();
				existingUserVO.setProvider(socialType.toString());
				existingUserVO.setUserName(userInfo.get("name"));
				existingUserVO.setPhoneNumber(userInfo.get("phoneNumber"));
				existingUserVO.setUserEmail(userInfo.get("email"));
				UsersOauthVO usersOauthVO = new UsersOauthVO();
		        usersOauthVO.setImageUrl(viewPage);
		        usersOauthVO.setAccessToken(accessToken);
		        usersOauthVO.setRefreshToken(refreshToken);
		        usersOauthVO.setImageUrl(userInfo.get("picture"));
		        usersOauthVO.setUserSeq(existingUserVO.getUserSeq());
		        System.out.println(viewPage);
		        System.out.println(accessToken);
		        System.out.println(refreshToken);
		        System.out.println(existingUserVO.getUserSeq());
		        existingUserVO.setUsersOauthVO(usersOauthVO);
		        
				request.getSession().setAttribute("SESS_USERVO"			, existingUserVO);
				request.getSession().setAttribute("SESS_ACCESS_TOKEN"	, accessToken); 
				request.getSession().setAttribute("SESS_REFRESH_TOKEN"	, refreshToken); 
				viewPage = "redirect: /common/registerm";
			} else {
				//OAuth :: 기존 회원일 경우 -- 토큰만 다시 저장(변경이 있을 수 있으므로) : 세션에 담고 마이페이지로 이동
				//토큰정보	        
		        UsersOauthVO usersOauthVO = new UsersOauthVO();
		        usersOauthVO.setImageUrl(viewPage);
		        usersOauthVO.setAccessToken(accessToken);
		        usersOauthVO.setImageUrl(userInfo.get("picture"));
		        usersOauthVO.setRefreshToken(refreshToken);
		        usersOauthVO.setUserSeq(existingUserVO.getUserSeq());
		        
		        System.out.println(existingUserVO.getProvider());
		        System.out.println(accessToken);
		        System.out.println(refreshToken);
		        System.out.println(existingUserVO.getUserSeq());

		        if(existingUserVO.getProvider().equals("LOCAL"))
		        {
		        	existingUserVO.setUsersOauthVO(usersOauthVO);
		        	existingUserVO.setProvider(socialType.toString());
		        	userService.svcUserUpdate(existingUserVO);
		        	oauthService.svcInsertToken(usersOauthVO);
		        }
				request.getSession().setAttribute("SESS_ACCESS_TOKEN"	, accessToken); 
				request.getSession().setAttribute("SESS_REFRESH_TOKEN"	, refreshToken); 
				request.getSession().setAttribute("SESS_USERVO"			, existingUserVO);
				request.getSession().setAttribute("userSeq", existingUserVO.getUserSeq());
				viewPage = "redirect: /common/indexm";
			}
		} 
		return viewPage;
	}
	
	//OAuth :: 신규회원: 회원정보저장 + 토큰저장
	@RequestMapping(value="/oauth_join_process", method = RequestMethod.POST)
	public String ctlOauthJoinProcess(Model model, HttpServletRequest request,
			@ModelAttribute UserVO usersTblVO) {
		
		//토큰정보	        
        UsersOauthVO usersOauthVO = new UsersOauthVO();
        usersOauthVO.setImageUrl((String)request.getSession().getAttribute("SESS_PICTURE"));
        usersOauthVO.setAccessToken((String)request.getSession().getAttribute("SESS_ACCESS_TOKEN"));
        usersOauthVO.setRefreshToken((String)request.getSession().getAttribute("SESS_REFRESH_TOKEN"));
        
		//회원정보
		usersTblVO.setUserEmail((String)request.getSession().getAttribute("SESS_EMAIL"));
		//usersTblVO.setUserPw(userPw);
		//usersTblVO.setUserName(userName);	        
		usersTblVO.setUserRole('u');
		usersTblVO.setProvider(request.getSession().getAttribute("SESS_PROVIDER").toString());
		usersTblVO.setUsersOauthVO(usersOauthVO);
		
        int insertUserSeq = oauthService.svcInsertUserToken(usersTblVO);
        
        String viewPage = "redirect: /login_page";
        if (insertUserSeq <0) {
        	//회원가입실패 : lec14_auth/login_page.jsp로 이동
        	request.getSession().invalidate();
        } else {
	        //회원가입성공 : mlec14_auth/ypage.jsp로 이동
        	request.getSession().setAttribute("SESS_GUBUN"		, 'u');
			request.getSession().setAttribute("SESS_USERNAME"	, usersTblVO.getUserName());
			viewPage = "redirect: /mypage";
        }
		return viewPage;
	}
	
	

}