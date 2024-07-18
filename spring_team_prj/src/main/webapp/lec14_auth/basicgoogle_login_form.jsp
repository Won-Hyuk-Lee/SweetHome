<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script>
 /*
	function handleCredentialResponse(response) {
        console.log("Encoded JWT ID token: " + response.credential);
        
     	// 서버로 ID 토큰을 전송
        $.ajax({
            url: '/api/authenticate',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ token: response.credential }),
            success: function(data) {
                if (data.success) {
                    // 인증 성공
                    console.log('User authenticated');
                    window.location.href = '/mypage'; // 인증 후 리디렉션
                } else {
                    // 인증 실패
                    console.log('Authentication failed');
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error:', textStatus, errorThrown);
            }
        });
     
    }

    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "132153140522-46cvv4nbdb8gi5soug53972g2vaa9hgn.apps.googleusercontent.com",
            callback: handleCredentialResponse
        });
        google.accounts.id.renderButton(
            document.getElementById('buttonDiv'), 
            { theme: 'filled_black', size: 'small', width: "200" }  // customization attributes
        );
        google.accounts.id.prompt(); // also display the One Tap dialog
    } 
*/    
</script>
</head>
<body>
<h1>SNS Login</h1><hr>
${MY_LOGIN_URL}<br>

<%-- <a id="custom-login-btn" href="javascript:void(0);" onclick="window.open('${MY_LOGIN_URL}','googleLogin','width=630,height=500,location=no,status=no,scrollbars=yes');">
	
</a>
 --%>
 <a href="${MY_LOGIN_URL}"><img src="https://velog.velcdn.com/images/pagkusd/post/4642149d-8241-4629-b5f5-e102dae1bf86/image.png" width=220></a>
 <br>
 

<div id="buttonDiv"></div>


</body>
</html>