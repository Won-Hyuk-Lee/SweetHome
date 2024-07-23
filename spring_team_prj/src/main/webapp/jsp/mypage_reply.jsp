<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spaces - Settings</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,shrink-to-fit=no">
<meta name="title" content="Spaces - Settings">
<meta name="author" content="Themesberg">
<meta name="description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta name="keywords"
	content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme">
<link rel="canonical"
	href="https://themesberg.com/product/bootstrap/spaces-bootstrap-directory-listing-template">
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-pro">
<meta property="og:title" content="Spaces - Settings">
<meta property="og:description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta property="og:image"
	content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url"
	content="https://demo.themesberg.com/pixel-pro">
<meta property="twitter:title" content="Spaces - Settings">
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
<link rel="mask-icon"
	href="../resources/spaces/assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
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
<%@ include file = "/jsp/header.jsp"%>
<body>
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-THQTXJ7"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>

	<main>
		<div
			class="preloader bg-dark flex-column justify-content-center align-items-center">
			<div class="position-relative">
				<img src="../resources/spaces/assets/img/brand/light-without-letter.svg"
					alt="Logo loader"> <img
					src="../resources/spaces/assets/img/brand/letter.svg" class="rotate-letter"
					alt="Letter loader">
			</div>
		</div>
		<div class="section section-lg bg-soft">
			<div class="container">
				<div class="row pt-5 pt-md-0">
					<div class="col-12 col-md-4 d-none d-lg-block">
						<div class="card border-light p-2">
							<div class="card-body p-2">
								<div class="profile-thumbnail small-thumbnail mx-auto">
									<img src="${KEY_USEROAUTHVO.imageUrl}"
										class="card-img-top rounded-circle border-white"
										alt="Joseph Portrait">
								</div>
								<h2 class="h5 font-weight-normal text-center mt-3 mb-0">${KEY_USERVO.userNickname}</h2>
								<div class="list-group dashboard-menu list-group-sm mt-4">
									<a href="/user/detail_update"
										class="d-flex list-group-item list-group-item-action"style="font-size: 1.5rem;">내 정보 수정
										<span class="icon icon-xs ml-auto"><span
											class="fas fa-chevron-right"></span></span>
									</a><a href="/user/board_list"
										class="d-flex list-group-item list-group-item-action"style="font-size: 1.5rem;">내가 쓴 게시글<span
										class="icon icon-xs ml-auto"><span
											class="fas fa-chevron-right"></span></span>
									</a><a href="/user/detail_reply"
										class="d-flex list-group-item list-group-item-action active"style="font-size: 1.5rem;">내가 쓴 댓글<span class="icon icon-xs ml-auto"><span
											class="fas fa-chevron-right"></span></span>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-lg-8">
							
        <input type="hidden" id="userSeq" name="userSeq" value="${sessionScope.userSeq}">



        <!-- 리스트 상단의 열 제목 -->
        <div
			class="section section-md bg-white text-black pt-0 line-bottom-light">
			<div class="container2">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="card bg-soft border-light rounded p-4 mb-4">
						<form name="replyForm" id="replyForm" action="${pageContext.request.contextPath}/reply/reply_insert" method="post">
							 <h2 class="h5 mb-4" style="font-size: 2.5rem;">내가 쓴 댓글</h2>
							<div class="mt-5">
							
								<div id="replyListDiv"></div>
								
							</div>
							<div class="d-flex justify-content-between mt-3">
								<small class="font-weight-light text-dark"><span
									id="charactersRemaining"></span> characters remaining</small>
							</div>
						</form>
		
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
<!-- 댓글 조회 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
    // 문서가 준비된 후 실행되는 함수
    $(document).ready(function() {
        // 댓글 리스트 생성
        makeReplyList();
    });
    
    // 댓글 삭제 버튼
    // Delete Button Click Event
    $(document).on('click', '.reply-delete-button', function() {
        var replyCard = $(this).closest('.card');
        var replySeq = replyCard.data('reply-seq'); // 댓글 ID 추출

        $.ajax({
            method: "POST",
            url: "${pageContext.request.contextPath}/reply/reply_delete", // 서버의 댓글 삭제 URL
            data: {replySeq:replySeq},
            error: function(myval) {
                console.log("에러:" + myval);
            },
            success: function(myval) {
                makeReplyList(); // 댓글 리스트 갱신
            }
        });
    });
    // 댓글 리스트 생성 함수
    function makeReplyList() {
        var userSeq = '${sessionScope.userSeq}'; // JSP 표현식에서 변수 가져오기

        $.ajax({
            method: "POST",
            url: "${pageContext.request.contextPath}/user/reply_list",
            data: { userSeq: userSeq },
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
                    htmlStr += "<div><button class='reply-delete-button' aria-label='delete button'>[X]</button></div></div>";
                    htmlStr += "<p class='m-0'>" + MYval.reply + "</p></div>";
                });
                $("#replyListDiv").empty();
                $("#replyListDiv").html(htmlStr);
            }
        });
    }
</script>

	</main>
	<footer class="footer py-6 bg-primary text-white">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 mb-3 mb-xl-0">
					<img src="../resources/spaces/assets/img/brand/light.svg" height="30"
						class="mb-3" alt="Spaces logo">
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
	<script
		src="../resources/spaces/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js"></script>
	<script src="../resources/spaces/vendor/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
	<script src="../resources/spaces/vendor/leaflet/dist/leaflet.js"></script>
	<script src="../resources/spaces/vendor/chartist/dist/chartist.min.js"></script>
	<script
		src="../resources/spaces/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="../resources/spaces/vendor/jqvmap/dist/jquery.vmap.min.js"></script>
	<script src="../resources/spaces/vendor/jqvmap/dist/maps/jquery.vmap.usa.js"></script>
	<script src="../resources/spaces/assets/js/jquery.slideform.js"></script>
	<script src="../resources/spaces/assets/js/spaces.js"></script>

</body>
</html>