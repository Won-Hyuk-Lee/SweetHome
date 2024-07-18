<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>My Page</h1>
<pre>${MY_USERSVO}</pre>
<hr>


<img src="${sessionScope.SESS_PICTURE}" width=100 height=100><br><br>
${sessionScope.SESS_GUBUN} ${sessionScope.SESS_USERNAME}님 환영합니다.
<br>
이메일 :  ${sessionScope.SESS_EMAIL}  <br>
가입경로 : ${sessionScope.SESS_PROVIDER}
<br><br>
<form method="post" action="/form_logout_process">
	<input type="submit" value="로그아웃">
</form>	
    
</body>
</html>