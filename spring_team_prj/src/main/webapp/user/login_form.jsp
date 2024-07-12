<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<h2>로그인</h2>
<form action="${pageContext.request.contextPath}/users/login" method="post">
    <label for="userEmail">이메일:</label>
    <input type="email" id="userEmail" name="userEmail" required><br>

    <label for="userPw">비밀번호:</label>
    <input type="password" id="userPw" name="userPw" required><br>

    <button type="submit">로그인</button>
</form>
</body>
</html>