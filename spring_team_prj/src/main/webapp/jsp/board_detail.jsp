<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .container2 {
        	width: 60%; /* 너비를 줄임 */
            margin: 0 auto; 
            background-color: white; /* 컨테이너 배경색 */
            padding: 20px; /* 내부 여백 */
            border-left: 1px solid #ccc;  	/* 왼쪽 세로선 추가 */
            border-right: 1px solid #ccc;	/* 오른쪽 세로선 추가 */
            border-top: 1px solid #ccc;		/* 위쪽 세로선 추가 */
            border-bottom: 1px solid #ccc;	/* 아래쪽 세로선 추가 */
            position: relative; 			/* 버튼 배치를 위해 추가 */
            padding-bottom: 60px; 			/* 버튼을 위한 공간 확보 */
            }
        /* 새로 추가된 버튼들을 감싸는 컨테이너 스타일 */
        .action-container {
            text-align: right;
            margin: 20px 0;
        }
        /* 버튼 공통 스타일 */
        .action-button {
            display: inline-block;
            padding: 5px 10px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .action-button:hover {
            background-color: #0056b3; /* 호버 시 색상 변경 */
        }
        /* 각 버튼별 고유 색상 */
        .update-button { background-color: #6A94D4; }
        .delete-button { background-color: #4A90E2; }
        .list-button { background-color: #7B9EBF; }
        .reply-input { width: 100%; margin-top: 20px; }
        .divider { border-top: 1px solid #ccc; margin: 10px 0; }
        .recommend-container {
            text-align: center;
            margin: 20px 0;
        }
        .recommend-box { 
            display: inline-block;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .recommend-button {
            display: inline-block;
            padding: 5px 10px;
            background-color: #4A90E2;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .recommend-button:hover {
            background-color: #0056b3;
        }
        .reply-input { width: 100%; margin-top: 20px; }
        .reply-delete-button {
	      background: none;
	      border: none;
	      color: #dc3545; /* Bootstrap danger color */
	      cursor: pointer;
	      font-size: 1em;
	    }
    </style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spaces - Directory Listing Landing page 2</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,shrink-to-fit=no">
<meta name="title" content="Spaces - Directory Listing Landing page 2">
<meta name="author" content="Themesberg">
<meta name="description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta name="keywords"
	content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme">
<link rel="canonical"
	href="https://themesberg.com/product/bootstrap/spaces-bootstrap-directory-listing-template">
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-pro">
<meta property="og:title"
	content="Spaces - Directory Listing Landing page 2">
<meta property="og:description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta property="og:image"
	content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url"
	content="https://demo.themesberg.com/pixel-pro">
<meta property="twitter:title"
	content="Spaces - Directory Listing Landing page 2">
<meta property="twitter:description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta property="twitter:image"
	content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
<link rel="apple-touch-icon" sizes="120x120"
	href="../resources/spaces/assets/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../resources/spaces/assets/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../resources/spaces/assets/img/favicon/favicon-16x16.png">
<link rel="manifest" href="../resources/spaces/assets/img/favicon/site.webmanifest">
<link rel="mask-icon" href="../resources/spaces/assets/img/favicon/safari-pinned-tab.svg"
	color="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">
<link type="text/css"
	href="../resources/spaces/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link type="text/css" href="../resources/spaces/vendor/leaflet/dist/leaflet.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="../resources/spaces/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">
<link rel="stylesheet" href="../resources/spaces/vendor/jqvmap/dist/jqvmap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link type="text/css" href="../resources/spaces/css/spaces.css" rel="stylesheet">
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-THQTXJ7');
</script>
</head>
<body>
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-THQTXJ7"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<style>
	.bg-primary {
    background-color: yellowgreen !important;
	}
 </style>
	<!-- 상단 탭 시작 -->
	<style>
        .btn-primary {
            color: #fff; /* 텍스트 색상: 흰색 */
            background-color: yellowgreen; /* 배경색: yellowgreen */
            border-color: black; /* 테두리 색상: yellowgreen */
            box-shadow: 0 0 24px rgba(154, 205, 50, .04), 0 44px 74px rgba(154, 205, 50, .06); /* 그림자 색상 변경 */
        }
    </style>
	<header class="header-global">
		<nav id="navbar-main"
			class="navbar navbar-main navbar-theme-primary navbar-expand-lg headroom py-lg-3 px-lg-6 navbar-dark navbar-transparent navbar-theme-primary">
			<div class="container">
				<a class="navbar-brand @@logo_classes" href="/jsp/index.jsp"><img
					class="navbar-brand-dark common"
					src="../resources/spaces/assets/img/brand/light.svg" height="35" alt="Logo light">
					<img class="navbar-brand-light common"
					src="../resources/spaces/assets/img/brand/dark.svg" height="35" alt="Logo dark"></a>
				<div class="navbar-collapse collapse" id="navbar_global">
					<div class="navbar-collapse-header">
						<div class="row">
							<div class="col-6 collapse-brand">
								<a href="/jsp/index.jsp"><img
									src="../resources/spaces/assets/img/brand/dark.svg" height="35"
									alt="Logo Impact"></a>
							</div>
							<div class="col-6 collapse-close">
								<a href="#navbar_global" role="button" class="fas fa-times"
									data-toggle="collapse" data-target="#navbar_global"
									aria-controls="navbar_global" aria-expanded="false"
									aria-label="Toggle navigation"></a>
							</div>
						</div>
					</div>
					<ul class="navbar-nav navbar-nav-hover justify-content-center">
						<li class="nav-item dropdown"><a href="#"
							id="mainPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"><span
								class="nav-link-inner-text mr-1">지도</span></a></li>
						<li class="nav-item">
							<a href="/community/list" class="nav-link">
						    	<span class="nav-link-inner-text mr-1">커뮤니티</span>
							</a>
						</li>
						<li class="nav-item dropdown"><a href="#"
							id="mainPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"><span
								class="nav-link-inner-text mr-1">내 정보</span></a></li>
					</ul>
				</div>
				<div class="d-none d-lg-block @@cta_button_classes">
				<c:choose>
            <c:when test="${not empty userSeq}">
                <!-- userSeq가 존재하는 경우 로그아웃 버튼 생성 -->
                <a href="/common/logout"
                   target="_blank" class="btn btn-md btn-secondary animate-up-2">
                    <i class="fas fa-shopping-bag mr-2"></i> 로그아웃
                </a>
            </c:when>
            <c:otherwise>
                <!-- userSeq가 존재하지 않는 경우 로그인 버튼 생성 -->
                <a href="/jsp/login.jsp"
                   target="_blank" class="btn btn-md btn-outline-white animate-up-2 mr-3">
                    <i class="fas fa-book mr-1"></i>
                    <span class="d-xl-none">Docs</span>
                    <span class="d-none d-xl-inline">로그인</span>
                </a>
            </c:otherwise>
        </c:choose>
				</div>
				<div class="d-flex d-lg-none align-items-center">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar_global" aria-controls="navbar_global"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
			</div>
		</nav>
	</header>
	
	<!-- 상단 탭 끝 -->
	<main>
		<div
			class="preloader bg-dark flex-column justify-content-center align-items-center">
			<div class="position-relative">
				<img src="../resources/spaces/assets/img/brand/light-without-letter.svg"
					alt="Logo loader"> <img src="../resources/spaces/assets/img/brand/letter.svg"
					class="rotate-letter" alt="Letter loader">
			</div>
		</div>
		
		
<!-- 제목 섹 셔어어어언!!!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!~!~!~!~!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!~!~!~ -->
		<section class="section-header pb-3 bg-primary text-white">
		</section>
		
<!-- 내용 섹션~!~!~!~!~!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!@!!@!@!@~~~~~~~!!!!!!!!!!!!!!!!!!!~!~!~!~!~!~!~~!~!~!~!~!~!~ -->
		
    <div class="section section-sm bg-white pt-6">
        <div class="container2">
            <div id="communityName">${KEY_BOARDVO.community.communityName}</div>
            <h1 id="boardTitle">${KEY_BOARDVO.boardTitle}</h1>
            <p id="userInfo">${KEY_BOARDVO.user.userNickname} | <fmt:formatDate value="${KEY_BOARDVO.updatedDate}" pattern="YYYY-MM-dd HH:MM"/></p>
            
            <div class="divider"></div>
            <div id="boardContents">${KEY_BOARDVO.boardContents}</div>
            <div class="recommend-container">
                <div class="recommend-box">
                	<div id="recommendCountDiv">
                   		<span id="recommendCount">추천수: ${KEY_BOARDVO.recommend}</span>
                    </div>
                    <div class="recommend-button">추천</div>
                    <input type="hidden" id="boardSeq" value="${KEY_BOARDVO.boardSeq}">
					<input type="hidden" id="userSeq" value="${sessionScope.userSeq}">
                </div>
            </div>
            <div class="action-container">
                <div class="action-button list-button">목록</div>
                <div class="action-button delete-button">삭제</div>
                <div class="action-button update-button">수정</div>
            </div>
        </div>
        <div
			class="section section-md bg-white text-black pt-0 line-bottom-light">
			<div class="container2">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-8">
						<div class="card bg-soft border-light rounded p-4 mb-4">
						<form name="replyForm" id="replyForm" action="${pageContext.request.contextPath}/reply/reply_insert" method="post">
							<label class="h5 mb-4" for="exampleFormControlTextarea1">댓글</label>
							<textarea class="form-control border border-light-gray"
								id="reply" name="reply" placeholder="댓글을 입력하세요."
								rows="6" data-bind-characters-target="#charactersRemaining"
								maxlength="1000"></textarea>
							<input type="hidden" name="boardSeq" value="${KEY_BOARDVO.boardSeq}">
							<input type="hidden" name="userSeq" value="${sessionScope.userSeq}">
							<div class="d-flex justify-content-between mt-3">
								<small class="font-weight-light text-dark"><span
									id="charactersRemaining"></span> characters remaining</small>
								<button type="button" id="reply-insert-button" class="btn btn-primary animate-up-2">Send</button>
							</div>
						</form>
							
							
							<div class="mt-5">
							
								<div id="replyListDiv"></div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer class="footer py-6 bg-primary text-white">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 mb-3 mb-xl-0">
					<img src="../resources/spaces/assets/img/brand/light.svg" height="30" class="mb-3"
						alt="Spaces logo">
					<p>Premium Bootstrap Directory Listing Template</p>
				</div>
				<div class="col-6 col-xl-2 mb-5 mb-xl-0">
					<span class="h5">Themesberg</span>
					<ul class="footer-links mt-2">
						<li><a target="_blank" href="https://themesberg.com/blog">Blog</a></li>
						<li><a target="_blank" href="https://themesberg.com/products">Products</a></li>
						<li><a target="_blank" href="https://themesberg.com/about">About
								Us</a></li>
						<li><a target="_blank" href="https://themesberg.com/contact">Contact
								Us</a></li>
					</ul>
				</div>
				<div class="col-6 col-xl-3 mb-5 mb-xl-0">
					<span class="h5">Other</span>
					<ul class="footer-links mt-2">
						<li><a
							href="https://themesberg.com/docs/spaces/getting-started/overview/">Documentation
								<span class="badge badge-sm badge-secondary ml-2">v3.0</span>
						</a></li>
						<li><a
							href="https://themesberg.com/docs/spaces/getting-started/changelog/">Changelog</a></li>
						<li><a target="_blank" href="https://themesberg.com/contact">Support</a></li>
						<li><a target="_blank"
							href="https://themesberg.com/licensing">License</a></li>
					</ul>
				</div>
				<div class="col-12 col-xl-4 mb-5 mb-xl-0">
					<span class="h5">Get the app</span>
					<p class="text-muted font-small mt-2">It's easy. Just select
						your device.</p>
					<a href="#" class="btn btn-sm btn-white mb-xl-0 mr-2"><span
						class="d-flex align-items-center"><span
							class="icon icon-brand mr-2"><span class="fab fa-apple"></span></span>
							<span class="d-inline-block text-left"><small
								class="font-weight-normal d-block">Available on</small> App
								Store </span></span></a><a href="#" class="btn btn-sm btn-white"><span
						class="icon icon-brand mr-2"><span
							class="fab fa-google-play"></span></span> <span
						class="d-inline-block text-left"><small
							class="font-weight-normal d-block">Available on</small> Google
							Play</span></a>
				</div>
			</div>
			<hr class="my-3 my-lg-5">
			<div class="row">
				<div class="col mb-md-0">
					<a href="https://themesberg.com" target="_blank"
						class="d-flex justify-content-center"><img
						src="../resources/spaces/assets/img/themesberg.svg" height="25" class="mb-3"
						alt="Themesberg Logo"></a>
					<div
						class="d-flex text-center justify-content-center align-items-center"
						role="contentinfo">
						<p class="font-weight-normal font-small mb-0">
							Copyright Â© Themesberg <span class="current-year">2020</span>.
							All rights reserved.
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
	
		// 추천 버튼
		        $(document).ready(function() {
			        $(".recommend-button").click(function() {
			            var boardSeq = $("#boardSeq").val();
			            var userSeq = $("#userSeq").val();
			            var recommendationData = {
			                    boardSeq: boardSeq,
			                    userSeq: userSeq
	                };
		        // AJAX를 이용한 서버 전송
		        $.ajax({
		            method: "POST",
		            url: "${pageContext.request.contextPath}/board/board_recommend_insert",
		            contentType: "application/json",
		            data: JSON.stringify(recommendationData),
		            success:function(response) {
		            	if(response == 'check'){
		            		alert('이미 추천 하셨습니다~!~!')
		            	} else {
		            		alert('추천 되었습니다~!~!');
		                    var recommendCount = parseInt(response); // response 값은 추천 수
		                    var htmlStr = "추천수: <span id='recommendCount'>"+response+"</span>";
		                    
		                    $("#recommendCountDiv").empty().append(htmlStr);
		            	}
		            },
		            error: function(jqXHR, textStatus, errorThrown) {
		                console.log("Error:", jqXHR.responseText);
		            }
		        });
        
        
	        });
        });
        
        
        // 수정 버튼
/*         
        $(document).ready(function() {
	        $(".update-button").click(function() {
	        	window.location.href = "${pageContext.request.contextPath}/board/board_update_move?boardSeq=" + ${KEY_BOARDVO.boardSeq};
	        });
        });
*/

		$(document).ready(function() {
		    <c:choose>
		        <c:when test="${sessionScope.userSeq == KEY_BOARDVO.userSeq}">
		            $(".update-button").click(function() {
		                window.location.href = "${pageContext.request.contextPath}/board/board_update_move?boardSeq=" + ${KEY_BOARDVO.boardSeq};
		            });
		        </c:when>
		        <c:otherwise>
		            $(".update-button").click(function() {
		                alert("자신의 게시물만 수정할 수 있습니다.");
		            });
		        </c:otherwise>
		    </c:choose>
		});
        

        // 삭제 버튼
		$(document).ready(function() {
		    <c:choose>
		        <c:when test="${sessionScope.userSeq == KEY_BOARDVO.userSeq}">
		            $(".delete-button").click(function() {
		            	 if(confirm("정말로 삭제하시겠습니까?")) {
		 	            	window.location.href = "${pageContext.request.contextPath}/board/board_delete?communitySeq=" + ${KEY_BOARDVO.community.communitySeq} + "&boardSeq=" + ${KEY_BOARDVO.boardSeq};
		 	            }
	            	 });
		        </c:when>
		        <c:otherwise>
		            $(".delete-button").click(function() {
		                alert("자신의 게시물만 삭제할 수 있습니다.");
		            });
		        </c:otherwise>
		    </c:choose>
		});
		
        // 목록 버튼
        $(document).ready(function() {
            $(".list-button").click(function() {
                window.location.href = "${pageContext.request.contextPath}/board/board_list?communitySeq=" + ${KEY_BOARDVO.community.communitySeq};
            });
        });
        
        
        // 댓글 관련
        $(document).ready(function() {
            // 댓글 리스트 생성
            makeReplyList();

            // 댓글 추가 버튼 클릭 이벤트
            $("#reply-insert-button").click(function(event) {
                event.preventDefault(); // 폼 제출 방지
                var form = $("#replyForm")[0]; // Get the form element
                if (form.checkValidity()) { // 폼 유효성 검사
                    var formData = $("#replyForm").serialize();
                    $.ajax({
                        method: "POST",
                        url: "${pageContext.request.contextPath}/reply/reply_insert",
                        data: formData,
                        error: function(myval) {
                            console.log("에러:" + myval);
                        },
                        success: function(myval) {
                        	if (myval=="success"){
	                            makeReplyList();
	                        	$("#reply").val(''); // 댓글 입력 창 비우기                        		
                        	} else {
                        		alert("댓글을 입력해 주세요!");
                        	}
                        }
                    });
                } else {
                    alert('모든 필드를 올바르게 입력해 주세요.');
                }
            });
            
            // 댓글 삭제 버튼
            $(document).ready(function() {
                // userSeq를 JSP에서 JavaScript 변수로 할당
                var currentUserSeq = ${sessionScope.userSeq};

                // 댓글 생성 및 삭제 버튼의 동작 정의
                $(document).on('click', '.reply-delete-button', function() {
                    var replyCard = $(this).closest('.card');
                    var replySeq = replyCard.data('reply-seq'); // 댓글 ID 추출
                    var userSeq = $(this).data('user-seq'); // 유저 ID 추출

                    // 현재 사용자와 댓글 작성자가 같은 경우에만 삭제
                    if (currentUserSeq == userSeq) {
                        $.ajax({
                            method: "POST",
                            url: "${pageContext.request.contextPath}/reply/reply_delete", // 서버의 댓글 삭제 URL
                            data: { replySeq: replySeq },
                            error: function(myval) {
                                console.log("에러:" + myval);
                            },
                            success: function(myval) {
                                makeReplyList(); // 댓글 리스트 갱신
                            }
                        });
                    } else {
                        alert("본인의 댓글만 지울 수 있습니다.");
                    }
                });
            });
            
        });

        // 댓글 리스트 생성 함수
        function makeReplyList() {
            $.ajax({
                method: "POST",
                url: "${pageContext.request.contextPath}/reply/reply_list",
                data: { boardSeq: '${KEY_BOARDVO.boardSeq}' },
                error: function(myval) {
                    console.log("에러:" + myval);
                },
                success: function(myval) {
                    let htmlStr = ""; // HTML 문자열 초기화
                    $.each(myval, function(MYidx, MYval) {
                        htmlStr += "<div class='card bg-soft border-light rounded p-4 mb-4' data-reply-seq='" + MYval.replySeq + "'>";
                        htmlStr += "<div class='d-flex justify-content-between mb-4'>";
                        htmlStr += "<span class='font-small'><span class='font-weight-bold'>" + MYval.user.userNickname + "</span>";
                        htmlStr += "<span class='ml-2'>" + MYval.createdDate + "</span></span>";
                        htmlStr += "<div><button class='reply-delete-button' aria-label='delete button' data-user-seq='" + MYval.userSeq + "'>[X]</button></div></div>";
                        htmlStr += "<p class='m-0'>" + MYval.reply + "</p></div>";
                    });
                    $("#replyListDiv").empty();
                    $("#replyListDiv").html(htmlStr);
                }
            });
        }

        

    </script>   
	<script src="../resources/spaces/vendor/jquery/dist/jquery.min.js"></script>
	<script src="../resources/spaces/vendor/popper.js/dist/umd/popper.min.js"></script>
	<script src="../resources/spaces/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../resources/spaces/vendor/headroom.js/dist/headroom.min.js"></script>
	<script src="../resources/spaces/vendor/onscreen/dist/on-screen.umd.min.js"></script>
	<script src="../resources/spaces/vendor/nouislider/distribute/nouislider.min.js"></script>
	<script
		src="../resources/spaces/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="../resources/spaces/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="../resources/spaces/vendor/owl.carousel/dist/owl.carousel.min.js"></script>
	<script
		src="../resources/spaces/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	<script src="../resources/spaces/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js"></script>
	<script src="../resources/spaces/vendor/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
	<script src="../resources/spaces/vendor/leaflet/dist/leaflet.js"></script>
	<script src="../resources/spaces/vendor/chartist/dist/chartist.min.js"></script>
	<script
		src="../resources/spaces/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="../resources/spaces/vendor/jqvmap/dist/jquery.vmap.min.js"></script>
	<script src="../resources/spaces/vendor/jqvmap/dist/maps/jquery.vmap.usa.js"></script>
	<script src="../resources/spaces/assets/js/jquery.slideform.js"></script>
	<script src="../resources/spaces/assets/js/spaces.js"></script>S
	<!-- <script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015"
		integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ=="
		data-cf-beacon='{"rayId":"89fe6da8ddf07c30","version":"2024.4.1","r":1,"token":"3a2c60bab7654724a0f7e5946db4ea5a","b":1}'
		crossorigin="anonymous">
	</script> -->
</body>
</html>