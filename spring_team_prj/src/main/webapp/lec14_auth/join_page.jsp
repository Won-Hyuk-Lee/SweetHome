<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
<title>회원가입</title>
</head>
<body onload="document.myForm.userEmail.focus();">
	<h1>회원가입</h1><hr>
	<form name="myForm" id="myForm" action="/form_join_process" method="post">
	<table border="1" width="50%" cellpeding="0" cellspacing="0">
		<tr>
			<td>이메일</td><td><input type="text" name="userEmail" id="userEmail" size=30  placeholder="이메일을 입력하세요">
			<input type="button" id="emailCheck" value="중복확인">
			</td>
		</tr>
        <tr>
        	<td>비번</td><td><input type="password" name="userPw" id="userPw" size=30 value="Qawsedrf123!" placeholder="비밀번호를 입력하세요">
        		(영문/숫자/특수문자 조합 8글자 이상 : Qawsedrf123!)
        	</td>
        </tr>
        <tr><td>이름</td><td><input type="text" name="userName" id="userName" placeholder="이름을 입력하세요"></td></tr>
		<tr><td>전화번호</td><td>등등</td></tr>
		<tr><td>주소</td><td>등등</td></tr>
		<tr>
			<td colspan=2 align="center">
				<input type="button" id="submitBtn" value="가입">
				<input type="button" value="취소" onClick="javascript:location.href='/lec14_auth/login_page_step1.jsp'">
			</td>
		</tr>
	</table>
	</form>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script> 
$(function() { 
	
	$("#submitBtn").click(  function(){
		var userEmail = $("#userEmail").val().trim();
		var userName  = $("#userName").val().trim();
		var userPw    = $("#userPw").val().trim();
        //var passwordPattern =  /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;  //숫자영문자특수문자조합8글자이상
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (userEmail == "") {
            alert("이메일을 입력하세요");
            $("#userEmail").focus();
        } else if (!passwordPattern.test(userPw)) {
            alert("비밀번호는 영문 대소문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
            $("#userPw").focus();
        } else if (userName == "") {
            alert("이름을 입력하세요");
            $("#userName").focus();
        } else {
            $("#myForm").submit(); 
        }
	});
	
	
}); 
</script>			
</body>
</html>