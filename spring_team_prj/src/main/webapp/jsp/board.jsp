<!--

=========================================================
* Spaces - Bootstrap Directory Listing Template
=========================================================

* Product Page: https://themes.getbootstrap.com/product/spaces/
* Copyright 2020 Themesberg EULA (https://themes.getbootstrap.com/licenses/)

* Coded by https://themesberg.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Board List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .mb-3 {
            margin-bottom: 1rem !important;
        }
        .card-body {
            padding: 1.5rem !important;
        }
        .shadow-soft {
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        }
        .avatar-lg {
            width: 50px;
            height: 50px;
        }
        .avatar-lg img {
            width: 100%;
            height: 100%;
        }
        .text-gray {
            color: #6c757d !important;
        }
        .search-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .search-input {
            width: 50%;
        }
        .table-header {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        /* 추가된 스타일 */
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            text-align: center;
            vertical-align: middle;
            border: none;
            padding: 10px;
        }
        td.updated-date {
            font-size: 14px;
        }
        
        .form-inline {
		    display: flex;
		    justify-content: center; /* 수평 가운데 정렬 */
		    width: 100%;
		}
    </style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spaces - Support</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,shrink-to-fit=no">
<meta name="title" content="Spaces - Support">
<meta name="author" content="Themesberg">
<meta name="description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta name="keywords"
	content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme">
<link rel="canonical"
	href="https://themesberg.com/product/bootstrap/spaces-bootstrap-directory-listing-template">
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-pro">
<meta property="og:title" content="Spaces - Support">
<meta property="og:description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta property="og:image"
	content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url"
	content="https://demo.themesberg.com/pixel-pro">
<meta property="twitter:title" content="Spaces - Support">
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
		
		
<!-- 상단 탭 구역 -->		
<!-- 	
		<section class="section-header bg-primary pb-9 pb-lg-10 text-white">
			<div class="container">
			</div>
		</section>
-->


<!-- board list 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		<section class="section section-md bg-white">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-10 mb-3">
						<h5><br><br>${KEY_BOARDLIST[0].community.communityName}</h5>
					</div>
			
			
					
 <div class="container mt-5">
        <!-- 리스트 상단의 열 제목 -->
        <table class="table table-bordered mb-2">
            <thead class="table-header">
                <tr>
                    <th scope="col" style="width: 10%;">게시글 번호</th>
                    <th scope="col" style="width: 40%;">글 제목</th>
                    <th scope="col" style="width: 20%;">작성자</th>
                    <th scope="col" style="width: 10%;">수정일</th>
                    <th scope="col" style="width: 10%;">추천</th>
                </tr>
            </thead>
            <tbody>
                <!-- forEach 구문을 통해 게시글 목록을 출력 -->
                <c:forEach var="board" items="${KEY_BOARDLIST}">
                    <tr>
                        <td>${board.boardSeq}</td>
                        <td>
                            <a href="/board/board_detail?boardSeq=${board.boardSeq}">
                                <h4>${board.boardTitle}</h4>
                            </a>
                            <p class="lead text-gray mb-4">${board.boardContents}</p>
                        </td>
                        <td>${board.user.userNickname}</td>
                        <!-- 수정일 셀 -->
                        <td class="updated-date">
			            	<fmt:formatDate value="${board.updatedDate}" pattern="MM-dd HH:MM"/>
						</td>
                        <td>${board.recommend}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        ${KEY_PAGEING_HTML}
        <div class="row mt-5">
            <div class="col-lg-6 text-left">
                <button class="btn btn-primary">전체 글</button>
                <button class="btn btn-secondary">인기 글</button>
            </div>
            <div class="col-lg-6 text-right">
                <button id="writeButton" class="btn btn-success" data-community-seq="${KEY_BOARDLIST[0].communitySeq}" data-community-name="${KEY_BOARDLIST[0].community.communityName}">글 쓰기</button>
            </div>
        </div>
		<div class="row mt-3 search-container justify-content-center">
		    <form id="searchForm" action="/board/board_searchByTitle" method="get" class="form-inline my-2 my-lg-0 w-100">
		        <div class="col-lg-6 pr-lg-2 order-lg-2">
		            <div class="input-group">
		                <input class="form-control" type="search" placeholder="검색어를 입력하세요" aria-label="검색어 입력" name="searchStr">
		                <input type="hidden" name="communitySeq" value="${KEY_BOARDLIST[0].communitySeq}">
		                <div class="input-group-append">
		                    <button id="search-button" class="btn btn-outline-success" type="submit">검색</button>
		                </div>
		            </div>
		        </div>
		        
		       <!--  
		        <div class="col-lg-3 pl-lg-2 order-lg-1">
		            <select class="form-control w-50" name="searchType">
		                <option value="all">제목 + 내용</option>
		                <option value="title">제목</option>
		                <option value="content">내용</option>
		            </select>
		        </div>
		         -->
		         
		    </form>
		</div>
    </div>
    
    					
				</div>
			</div>
		</section>
		<section class="section section-md bg-soft">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col">
						<div class="text-center">
							<h3 class="mb-4">Can't find what you are looking for? Let us
								know!</h3>
							<a class="text-secondary font-weight-normal h4"
								href="./contact.html">Drop us a line <span
								class="icon icon-sm icon-primary ml-1"><i
									class="fas fa-arrow-right"></i></span></a>
						</div>
					</div>
				</div>
			</div>
		</section>
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
	
	<!-- 
	<div class="row justify-content-center">
					<div class="col-12 col-md-10 text-center">
						<h1 class="mb-3">Advice and answers from our team</h1>
						<p class="lead px-lg-5 mb-5">Get account assistance, technical
							support, or help with any other issues.</p>
						<form action="#">
							<div
								class="form-group bg-white shadow-soft rounded-pill mb-4 px-3 py-2">
								<div class="row align-items-center">
									<div class="col">
										<div class="input-group input-group-merge shadow-none">
											<div class="input-group-prepend">
												<span class="input-group-text bg-transparent border-0"><i
													class="fas fa-search"></i></span>
											</div>
											<input type="text"
												class="form-control border-0 form-control-flush shadow-none pb-2"
												placeholder="Search for answers..." required>
										</div>
									</div>
									<div class="col-auto">
										<button type="submit"
											class="btn btn-block btn-primary rounded-pill">Search</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>	
	 -->
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var writeButton = document.getElementById('writeButton');
		    if (writeButton) {
		        writeButton.addEventListener('click', function() {
		            var communitySeq = this.getAttribute('data-community-seq');
		            var communityName = this.getAttribute('data-community-name');
		            goToBoardInsert(communitySeq, communityName);
		        });
		    }
		});
	
		function goToBoardInsert(communitySeq, communityName) {
		    window.location.href = '/jsp/board_insert.jsp?communitySeq=' + communitySeq + '&communityName=' + communityName;
		}
		
		
		document.getElementById('search-button').addEventListener('click', function(event) {
			console.log('버튼 클릭');
		    // 이벤트 리스너가 폼 제출을 방지하지 않는지 확인하세요
		    var form = document.getElementById('searchForm');
		    if (form.checkValidity()) {
		        form.submit();
		    } else {
		        event.preventDefault();
		        alert('모든 필드를 올바르게 입력해 주세요.');
		    }
		});
</script>
<!-- 	
	<script>
    $(document).ready(function() {
        $.ajax({
            method: "POST",
            url: "${pageContext.request.contextPath}/board/board_list",
            data: "communitySeq=",
            error: function(xhr, status, error) {
                console.log("에러:" + error);
            },
            success: function(myval) {
                console.log(myval)
            }
        });
    });
    </script>
     -->
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
	<script src="../resources/spaces/assets/js/spaces.js"></script>
<!-- <script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015"
		integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ=="
		data-cf-beacon='{"rayId":"89fe6da49a557c30","version":"2024.4.1","r":1,"token":"3a2c60bab7654724a0f7e5946db4ea5a","b":1}'
		crossorigin="anonymous"></script> -->
</body>
</html>