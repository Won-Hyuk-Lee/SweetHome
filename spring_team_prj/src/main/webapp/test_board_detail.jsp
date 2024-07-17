<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
<c:set var="recommend" value="${KEY_BOARDVO.recommend}" />
boardSeq		: ${KEY_BOARDVO.boardSeq}<br>
boardTitle		: ${KEY_BOARDVO.boardTitle}<br>
boardContents	: ${KEY_BOARDVO.boardContents}<br>

<c:if test="${not empty KEY_BOARDVO.boardImages}">
    <c:forEach items="${KEY_BOARDVO.boardImages}" var="boardImage">
        <p>boardImageSeq: ${boardImage.boardImageSeq}</p><br>
        <p>boardSeq: ${boardImage.boardSeq}</p><br>
        <p>oname: ${boardImage.oname}</p><br>
        <p>sname: ${boardImage.sname}</p><br>
        <p>fsize: ${boardImage.fsize}</p><br>
        <p>fpath: ${boardImage.fpath}</p><br>
    </c:forEach>
</c:if>

communityName	: ${KEY_BOARDVO.community.communityName}<br>
<c:if test="${not empty KEY_BOARDVO.recommend}">
	recommend		: ${fn:length(recommend)}<br>
</c:if>
 --%>

<form id="testForm">
	<input type="text">
	<input id="submitbtn" type="button" value="submit">
</form>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>


$("#submitbtn").click(  function(){
	var formData = $("#submitbtn").serialize();
	console.log(formData);
	$.ajax({
		method      : "POST",
        url         : "${pageContext.request.contextPath}/board/board_detail",
        //data 		: "boardSeq="+${SessionScope.SESS_BOARDSEQ},
        data		: "boardSeq=1",
  		error 	    : function(myval){ console.log("에러:" + myval);   },
  		success     : function(myval){ 
  										console.log(myval);
  									 }
	});
});




</script>


</body>
</html>