<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1><hr>
	<form method="post" action="/form_login_process">
	<table border="1" width="50%" cellpeding="0" cellspacing="0">
		<tr><td>이메일</td><td><input type="text"     name="userEmail" size=30  value="hong@example.com" placeholder="이메일을 입력하세요"></td></tr>
        <tr><td>비번</td><td> <input type="password" name="userPW"     size=30 placeholder="비밀번호를 입력하세요"></td></tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
	</form>
	
	<br><a href="/lec14_auth/join_page.jsp">회원가입</a>
	<p><p><p><br><br>
	<h1>구글로 로그인</h1><hr>
	<!-- 이미지 아이콘 출처 : https://test.codemshop.com/social-type/ -->
	
	<a href="/login/GOOGLE"><img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/logo/Google.png" style="border: 1px solid #bbbbbb;  border-radius:15%;"></a>
	<a href="/login/KAKAO"><img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/icon_1/Kakao.png" width=73></a>
	<a href="/login/NAVER"><img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/icon_1/Naver.png" width=73></a><br><p>
	
	<hr>
	
	<a href="/login/GOOGLE"><img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/icon_text_1/Google.png" width=225></a><p>
	<a href="/login/KAKAO"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2153AD3C58E7D7AB0E"></a><p>
	<a href="/login/NAVER"><img src="http://lab.anybuild.co.kr/API/naver/img/naver_g_c_login.PNG" width=223></a>
	
	<hr>
</body>
</html>