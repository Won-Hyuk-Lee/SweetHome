//package com.sweetHome.svc;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.sweetHome.oauth.Oauth;
//import com.sweetHome.oauth.SocialType;
//import com.sweetHome.vo.UserVO;
//
//@Component
//public class TokenInterceptor implements HandlerInterceptor {
//
//	@Autowired
//	private Oauth socialOauth;
//
//	@Autowired
//	private OauthServiceImpl oauthServiceImpl;
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		HttpSession session = request.getSession();
//		UserVO userVO = (UserVO) session.getAttribute("SESS_USERVO");
//
//		if (userVO != null && socialOauth.isTokenExpired(userVO.getAccessToken())) {
//
//			//컨트롤러 모든 요청에 @RequestParam("socialType") String socialType 추가 후 아래와 같이 사용
//			//------------------------------------------------------------------------------------------
//			String socialTypeParam = request.getParameter("socialType");
//			if (socialTypeParam == null) {
//				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "SocialType parameter is missing");
//				return false;
//			}
//
//			SocialType socialType = null;
//			try {
//				socialType = SocialType.valueOf(socialTypeParam.toUpperCase());
//			} catch (IllegalArgumentException e) {
//				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid SocialType parameter");
//				return false;
//			}
//			//------------------------------------------------------------------------------------------
//			
//			Oauth socialOauth = oauthServiceImpl.getSocialInstance(socialType); //******************* TODO
//			String newAccessToken = socialOauth.refreshAccessToken(userVO.getRefreshToken());
//			userVO.setAccessToken(newAccessToken);
//			oauthServiceImpl.updateUser(userVO);
//			session.setAttribute("SESS_USERVO", userVO);
//		}
//		return true;
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//}