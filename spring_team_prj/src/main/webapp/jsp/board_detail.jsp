<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .container {
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
        .edit-button { background-color: #6A94D4; }
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
    </style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spaces - Blog post</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,shrink-to-fit=no">
<meta name="title" content="Spaces - Blog post">
<meta name="author" content="Themesberg">
<meta name="description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta name="keywords"
	content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme">
<link rel="canonical"
	href="https://themesberg.com/product/bootstrap/spaces-bootstrap-directory-listing-template">
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-pro">
<meta property="og:title" content="Spaces - Blog post">
<meta property="og:description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta property="og:image"
	content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url"
	content="https://demo.themesberg.com/pixel-pro">
<meta property="twitter:title" content="Spaces - Blog post">
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
	<header class="header-global">
		<nav id="navbar-main"
			class="navbar navbar-main navbar-theme-primary navbar-expand-lg headroom py-lg-3 px-lg-6 navbar-dark navbar-theme-primary">
			<div class="container">
				<a class="navbar-brand @@logo_classes" href="../resources/spaces/index.html"><img
					class="navbar-brand-dark common"
					src="../resources/spaces/assets/img/brand/light.svg" height="35" alt="Logo light">
					<img class="navbar-brand-light common"
					src="../resources/spaces/assets/img/brand/dark.svg" height="35" alt="Logo dark"></a>
				<div class="navbar-collapse collapse" id="navbar_global">
					<div class="navbar-collapse-header">
						<div class="row">
							<div class="col-6 collapse-brand">
								<a href="../resources/spaces/index.html"><img
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
								class="nav-link-inner-text mr-1">Front pages</span> <i
								class="fas fa-angle-down nav-link-arrow"></i></a>
						<div class="dropdown-menu dropdown-megamenu p-3 p-lg-4"
								aria-labelledby="mainPagesDropdown">
								<div class="row">
									<div class="col-6 col-lg-4">
										<h6 class="d-block mb-3 text-primary">Main pages</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/index.html">Landing</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/index-2.html">Landing 2</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/index-3.html">Landing 3</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/about.html">About</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/pricing.html">Pricing</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/team.html">Team</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/contact.html">Contact</a></li>
										</ul>
										<h6 class="d-block text-primary">Legal</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/legal.html">Legal center</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/terms.html">Terms & agreement</a></li>
										</ul>
									</div>
									<div class="col-6 col-lg-4">
										<h6 class="d-block mb-3 text-primary">Listing</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/all-spaces.html">All spaces</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/all-spaces-map.html">Map view</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/all-spaces-sidebar.html">All spaces
													sidebar</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/single-space.html">Space details</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/profile.html">Profile</a></li>
										</ul>
										<h6 class="d-block mb-3 text-primary">Support</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/support.html">Support center</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/support-topic.html">Support topic</a></li>
										</ul>
										<h6 class="d-block mb-3 text-primary">Blog</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/blog.html">Blog</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/blog-post.html">Blog post</a></li>
										</ul>
									</div>
									<div class="col-6 col-lg-4">
										<h6 class="d-block mb-3 text-primary">User</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/sign-in.html">Sign in</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/sign-up.html">Sign up</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/forgot-password.html">Forgot password</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/reset-password.html">Reset password</a></li>
										</ul>
										<h6 class="d-block mb-3 text-primary">Special</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/404.html">404 Not Found</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/500.html">500 Server Error</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/maintenance.html">Maintenance</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/coming-soon.html">Coming soon</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/blank.html">Blank page</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a href="#"
							id="dashboardPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"><span
								class="nav-link-inner-text mr-1">Dashboard</span> <i
								class="fas fa-angle-down nav-link-arrow"></i></a>
						<div class="dropdown-menu dropdown-megamenu-sm p-3 p-lg-4"
								aria-labelledby="dashboardPagesDropdown">
								<div class="row">
									<div class="col-6">
										<h6 class="d-block mb-3 text-primary">User dashboard</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/account.html">My account</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/settings.html">Settings</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/security.html">Security</a></li>
										</ul>
										<h6 class="d-block mb-3 text-primary">Items</h6>
										<ul class="list-style-none">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/my-items.html">My items</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/edit-item.html">Edit item</a></li>
										</ul>
									</div>
									<div class="col-6">
										<h6 class="d-block mb-3 text-primary">Messaging</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/messages.html">Messages</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/single-message.html">Chat</a></li>
										</ul>
										<h6 class="d-block mb-3 text-primary">Billing</h6>
										<ul class="list-style-none mb-4">
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/billing.html">Billing details</a></li>
											<li class="mb-2 megamenu-item"><a class="megamenu-link"
												href="../resources/spaces/html/dashboard/invoice.html">Invoice</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a href="#"
							id="supportDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"><span
								class="nav-link-inner-text mr-1">Support</span> <i
								class="fas fa-angle-down nav-link-arrow"></i></a>
						<div class="dropdown-menu dropdown-menu-lg"
								aria-labelledby="supportDropdown">
								<div class="col-auto px-0">
									<div class="list-group list-group-flush">
										<a
											href="https://themesberg.com/docs/spaces/getting-started/quick-start/"
											target="_blank"
											class="list-group-item list-group-item-action d-flex align-items-center p-0 py-3 px-lg-4"><span
											class="icon icon-md icon-secondary"><i
												class="fas fa-file-alt"></i></span>
										<div class="ml-4">
												<span class="text-dark d-block">Documentation<span
													class="badge badge-sm badge-secondary ml-2">v3.0</span></span> <span
													class="small">Examples and guides</span>
											</div></a><a href="https://themesberg.com/contact" target="_blank"
											class="list-group-item list-group-item-action d-flex align-items-center p-0 py-3 px-lg-4"><span
											class="icon icon-md icon-primary"><i
												class="fas fa-microphone-alt"></i></span>
										<div class="ml-4">
												<span class="text-dark d-block">Support</span> <span
													class="small">Looking for answers?</span>
											</div></a>
									</div>
								</div>
							</div></li>
					</ul>
				</div>
				<div class="d-none d-lg-block @@cta_button_classes">
					<a href="https://themesberg.com/docs/spaces/components/buttons/"
						target="_blank"
						class="btn btn-md btn-outline-white animate-up-2 mr-3"><i
						class="fas fa-book mr-1"></i> <span class="d-xl-none">Docs</span>
						<span class="d-none d-xl-inline">Components</span></a> <a
						href="https://themes.getbootstrap.com/product/spaces/"
						target="_blank" class="btn btn-md btn-secondary animate-up-2"><i
						class="fas fa-shopping-bag mr-2"></i> Buy now</a>
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
		<section class="section-header pb-7 bg-primary text-white">
		</section>
		
<!-- 내용 섹션~!~!~!~!~!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!@!!@!@!@~~~~~~~!!!!!!!!!!!!!!!!!!!~!~!~!~!~!~!~~!~!~!~!~!~!~ -->
		
    <div class="section section-sm bg-white pt-6">
        <div class="container">
            <div id="communityName">${KEY_BOARDVO.community.communityName}</div>
            <h1 id="boardTitle">${KEY_BOARDVO.boardTitle}</h1>
            <p id="userInfo">${KEY_BOARDVO.user.userNickname} | ${KEY_BOARDVO.updatedDate}</p>
            <div class="divider"></div>
            <div id="boardContents">${KEY_BOARDVO.boardContents}</div>
            <div class="recommend-container">
                <div class="recommend-box">
                    <span id="recommendCount">추천수: ${KEY_BOARDVO.recommend.size()}</span>
                    <div class="recommend-button">추천</div>
                </div>
            </div>
            <div class="action-container">
                <div class="action-button list-button">목록</div>
                <div class="action-button delete-button">삭제</div>
                <div class="action-button edit-button">수정</div>
            </div>
        </div>
	        
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-8">
						<div>
							<label class="h5 mb-4" for="exampleFormControlTextarea1"><span
								class="badge badge-md badge-primary text-uppercase mr-2">23</span>
								Comments</label>
							<textarea class="form-control border border-light-gray"
								id="exampleFormControlTextarea1" placeholder="Add your comment"
								rows="6" data-bind-characters-target="#charactersRemaining"
								maxlength="1000"></textarea>
							<div class="d-flex justify-content-between mt-3">
								<small class="font-weight-light text-dark"><span
									id="charactersRemaining"></span> characters remaining</small>
								<button class="btn btn-primary animate-up-2">Send</button>
							</div>
							<div class="mt-5">
								<div class="card bg-soft border-light rounded p-4 mb-4">
									<div class="d-flex justify-content-between mb-4">
										<span class="font-small"><a href="#"><img
												class="avatar-sm img-fluid rounded-circle mr-2"
												src="../resources/spaces/assets/img/team/profile-picture-1.jpg" alt="avatar">
												<span class="font-weight-bold">John Doe</span></a></span>
									</div>
									<p class="m-0">
										I really like that the Pixel uses a lot of Bootstrap 4's
										classes to position elements across the website. I also like
										the fact that we can get a version of the code without Sass if
										needed.<br>
										<br>When is the next product coming? :)
									</p>
								<div class="mt-5 text-center">
									<button id="loadOnClick"
										class="btn btn-primary btn-loading-overlay mr-2 mb-2">
										<span class="spinner"><span
											class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> </span><span class="ml-1 btn-inner-text">Load
											more comments</span>
									</button>
									<p id="allLoadedText" style="display: none;">더 이상 불러올 댓글이 없습니다!!</p>
								</div>
							</div>
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
        $(".recommend-button").click(function() {
            // 여기에 추천 기능을 구현할 수 있습니다.
            console.log("추천 버튼이 클릭되었습니다.");
        });

        $(".edit-button").click(function() {
            console.log("수정 버튼이 클릭되었습니다.");
            // 여기에 수정 기능 구현
        });

        $(".delete-button").click(function() {
            if(confirm("정말로 삭제하시겠습니까?")) {
                console.log("삭제 버튼이 클릭되었습니다.");
                // 여기에 삭제 기능 구현
            }
        });

        $(".list-button").click(function() {
        	 window.location.href = "${pageContext.request.contextPath}/board/board_list?communitySeq="+${KEY_BOARDVO.community.communitySeq};
            // 여기에 목록 페이지로 이동하는 기능 구현
        });
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
	<script src="../resources/spaces/assets/js/spaces.js"></script>
	<script>// here you should load content from an Ajax request and when it
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
	</script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015"
		integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ=="
		data-cf-beacon='{"rayId":"89fe6da8ddf07c30","version":"2024.4.1","r":1,"token":"3a2c60bab7654724a0f7e5946db4ea5a","b":1}'
		crossorigin="anonymous">
	</script>
</body>
</html>