<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
<title>회원가입_추가정보</title>
</head>
<body onload="document.loginForm.name.focus();">
	<h1>회원가입_추가정보</h1><hr>
	<form name="loginForm" id="loginForm" action="/oauth_join_process" method="post">
	<table border="1" width="50%" cellpeding="0" cellspacing="0">
		<tr><td>이메일</td><td><input type="text" name="userEmail" size=30 value="${sessionScope.SESS_EMAIL}" readonly></td></tr>
        <tr><td>이름</td><td><input type="text" name="userName" id="userName" placeholder="이름을 입력하세요"></td></tr>
		<tr><td>전화번호</td><td>등등</td></tr>
		<tr><td>주소</td><td>등등</td></tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="가입">
				<input type="button" value="취소" onClick="javascript:location.href='/lec14_auth/login_page_step1.jsp'">
			</td>
		</tr>
	</table>
	</form>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script> 
$(function() { 
	
	$("#submitBtn").click(  function(){
		var userName = $("#userName").val().trim();
		var userPw   = $("#userPw").val().trim();
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (userName === "") {
            alert("이름을 입력하세요");
            $("#userName").focus();
        } else if (!passwordPattern.test(userPw)) {
            alert("비밀번호는 영문 대소문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
            $("#userPw").focus();
        } else {
            $("#loginForm").submit(); 
        }
	});
	
	
}); 
</script>			
</body>
</html>