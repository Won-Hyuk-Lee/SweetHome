<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <title>${KEY_UPDATE_DATA.community.communityName} 게시판</title>
    <style>
        .container { width: 80%; margin: 0 auto; }
        .tabs { /* 탭 스타일 */ }
        .gallery-name { font-size: 24px; margin: 20px 0; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input[type="text"], .form-group textarea { width: 100%; padding: 8px; }
        .button-group { text-align: right; margin-top: 20px; }
        .button-group button { padding: 10px 20px; margin-left: 10px; }
        
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
        .update-button { background-color: #6A94D4; }
        .cancel-button { background-color: #4A90E2; }
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
<%@ include file = "/jsp/header.jsp"%>
	<main>
		<div
			class="preloader bg-dark flex-column justify-content-center align-items-center">
			<div class="position-relative">
				<img src="../resources/spaces/assets/img/brand/light-without-letter.svg"
					alt="Logo loader"> <img src="../resources/spaces/assets/img/brand/letter.svg"
					class="rotate-letter" alt="Letter loader">
			</div>
		</div>
		<!-- 상단 탭 위치하는 곳~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		<section class="section-header pb-0 bg-primary2 text-white">
		</section>
		
    <div class="container">
        
        <h1 class="gallery-name">${KEY_UPDATE_DATA.community.communityName} 게시판</h1>
        
        <form id="boardForm" action="${pageContext.request.contextPath}/board/board_update" method="post">
            <input type="hidden" name="boardSeq" value="${KEY_UPDATE_DATA.boardSeq}">
            <div class="form-group">
                <p>제목</p>
                <input type="text" name="boardTitle" value="${KEY_UPDATE_DATA.boardTitle}" required>
            </div>
            
            <div class="form-group">
                <p>본문 내용</p>
                <textarea name="boardContents" rows="10" required>${KEY_UPDATE_DATA.boardContents}</textarea>
            </div>
<!--             
            <div class="form-group">
                <p>첨부 파일</p>
                <input type="file" name="boardImages" multiple>
            </div>
-->
			<div class="button-group">
			    <button type="button" id="cancel-button" class="action-button cancel-button" onclick="history.back()">취소</button>
			    <button type="submit" id="update-button" class="action-button update-button">수정</button>
			</div>
        </form>
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

	<script src="../resources/spaces/vendor/jquery/dist/jquery.min.js"></script>
	<script src="../resources/spaces/vendor/popper.js/dist/umd/popper.min.js"></script>
	<script src="../resources/spaces/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../resources/spaces/vendor/headroom.js/dist/headroom.min.js"></script>
	<script src="../resources/spaces/vendor/onscreen/dist/on-screen.umd.min.js"></script>
	<script src="../resources/spaces/vendor/nouislider/distribute/nouislider.min.js"></script>
	<script
		src="../resources/spaces/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
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
	<script>
		// here you should load content from an Ajax request and when it
		// loads you can disable the button from loading
		$('#loadOnClick').click(function() {
			$button = $(this);
			$loadContent = $('#extraContent');
			$allLoaded = $('#allLoadedText');
			$button.addClass('btn-loading');
			$button.attr('disabled', true);

			setTimeout(function() {
				$loadContent.show();
				$button.hide();
				$allLoaded.show();
			}, 1500);
		});
		
		document.getElementById('update-button').addEventListener('click', function(event) {
			console.log('버튼 클릭');
		    // 이벤트 리스너가 폼 제출을 방지하지 않는지 확인하세요
		    var form = document.getElementById('boardForm');
		    if (form.checkValidity()) {
		        form.submit();
		    } else {
		        event.preventDefault();
		        alert('모든 필드를 올바르게 입력해 주세요.');
		    }
		});
	</script>
<!-- 	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015"
		integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ=="
		data-cf-beacon='{"rayId":"89fe6da8ddf07c30","version":"2024.4.1","r":1,"token":"3a2c60bab7654724a0f7e5946db4ea5a","b":1}'
		crossorigin="anonymous"></script> -->
</body>
</html>