<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<h2>회원가입</h2>
<form id="myForm" action="${pageContext.request.contextPath}/user/join" method="post">
    <label for="userEmail">이메일:</label>
    <input type="email" id="userEmail" name="userEmail" required><br>

    <label for="userPw">비밀번호:</label>
    <input type="password" id="userPw" name="userPw" required><br>

    <label for="userNickname">닉네임:</label>
    <input type="text" id="userNickname" name="userNickname" required><br>

    <label for="phoneNumber">전화번호:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" required><br>

    <label for="userName">이름:</label>
    <input type="text" id="userName" name="userName" required><br>

    <label for="address">주소:</label>
    <input type="text" id="address" name="address" required><br>

    <label for="addressDetail">상세주소:</label>
    <input type="text" id="addressDetail" name="addressDetail" required><br>

    <input type="button" id="submitBtn" value="가입하기">
</form>


	
	
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script> 
$(function() { 
	// str  - str
	$("#submitBtn").click(  function(){
		var formData = $("#myForm").serialize();
		console.log(formData);
		$.ajax({
			method      : "POST",
	        url         : "${pageContext.request.contextPath}/user/join",
	        data 		: formData,
	        //dataType	: "json",
	  		error 	    : function(myval){ console.log("에러:" + myval);   },
	  		success     : function(myval){
								console.log(myval);
						 }
		});
	}); 
	
	/*
	$("#submitBtn").click(  function(){
		alert("d")
		//var objData = {"userEmail":"dd@dd.com","userNickname":"hong"};
		var formData = $("#myForm").serializeArray();
	    var jsonData = {};
	    $.each(formData, function() {
	        jsonData[this.name] = this.value;
	    });
		  
	    alert(jsonData);
	    console.log(jsonData);
	    
		$.ajax({
			method      : "POST",
	        url         : "${pageContext.request.contextPath}/users/join",
	        data 		: JSON.stringify(jsonData),  
	        contentType : "application/json; charset=UTF-8",
	        //dataType	: "json",
	  		error 	    : function(myval){ console.log("에러:" + myval);   },
	  		success     : function(myval){ 
	  										console.log(myval);
	  									 }
		});
	}); 
	*/
	
}); 
</script>	

</body>
</html>