<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
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

	function myPageMove(event) {
	    event.preventDefault(); // 링크의 기본 동작(페이지 이동) 방지

	    // sessionStorage에서 userSeq 값을 가져옴
	   var userSeq = '${userSeq}';
		console.log("seq="+userSeq);
	    // userSeq 값이 존재하면 mypage로 이동
	    if (userSeq) {
	        window.location.href = '/user/detail?seq='+userSeq; // userSeq가 있을 때 이동할 페이지
	    } else {
	        window.location.href = '/jsp/login.jsp'; // userSeq가 없을 때 이동할 페이지
	    }
	}

</script>
</head>
<body>
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-THQTXJ7"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<style>
	.bg-primary2 {
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
						<li class="nav-item dropdown">
						    <a id="mainPagesDropdown" 
						       class="nav-link dropdown-toggle"
						       aria-expanded="false" 
						       data-toggle="dropdown"
						       onclick="myPageMove(event)">
						        <span class="nav-link-inner-text mr-1">내 정보</span>
						    </a>
						</li>
					</ul>
				</div>
				<div class="d-none d-lg-block @@cta_button_classes">
				<c:choose>
            <c:when test="${not empty userSeq}">
                <!-- userSeq가 존재하는 경우 로그아웃 버튼 생성 -->
                <a href="/common/logout"
                    class="btn btn-md btn-secondary animate-up-2">
                    <i class="fas fa-shopping-bag mr-2"></i> 로그아웃
                </a>
            </c:when>
            <c:otherwise>
                <!-- userSeq가 존재하지 않는 경우 로그인 버튼 생성 -->
                <a href="/jsp/login.jsp"
                   class="btn btn-md btn-outline-white animate-up-2 mr-3">
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
		<section class="section section-header bg-soft pb-12">
			<div class="container">
				<div class="row justify-content-between align-items-center">
					<div class="col-12 col-md-5 order-lg-1">
						<h1 class="display-3 lh-100 font-weight-bold mb-0">어디 동네로 갈까요.</h1>
						<p class="lead my-4">
							<span class="font-weight-bold">12,000+</span> 서울에서 살고 싶은 동네를 검색 해보세요.<span class="font-weight-bold"></span>
							 
						</p>
						<form autocomplete="off" class="row" method="get"
							action="./all-spaces.html">
							<div class="col-12 mb-3 mb-lg-4">
								<div class="form-group form-group-lg mb-0">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><span
												class="fas fa-map-marker-alt"></span></span>
										</div>
										<input id="search-location" type="text"
											class="form-control autocomplete"
											placeholder="Search location" required>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-6 mb-3 mb-lg-4">
								<div class="input-group input-group-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"><span
											class="fas fa-sliders-h"></span></span>
									</div>
									<select class="custom-select" id="exampleFormControlSelect1"><option>Type</option>
										<option>On-Demand Meeting Spaces</option>
										<option>Office Space</option></select>
								</div>
							</div>
							<div class="col-12 col-lg-6">
								<div class="input-group input-group-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"><span
											class="far fa-user-circle"></span></span>
									</div>
									<select class="custom-select" id="exampleFormControlSelect3"><option>Team
											Size</option>
										<option>Any</option>
										<option>1-20</option>
										<option>21-50</option>
										<option>51-100</option></select>
								</div>
							</div>
							<div class="col-12 mt-4">
								<button class="btn btn-lg btn-primary btn-block animate-up-2"
									type="submit">Find a desk</button>
							</div>
						</form>
					</div>
					<div class="col-12 col-md-7 order-lg-2 d-none d-md-block">
						<img src="../resources/spaces/assets/img/illustrations/maintenance.svg" class="img-fluid"
							alt="Forest Illustration">
					</div>
				</div>
			</div>
		</section>
		
		<section class="section section-lg pt-0">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<h3 class="h4 mb-5">Top Coworking Cities</h3>
					</div>
				</div>
				<div class="row d-none d-lg-block">
					<div class="col-12">
						<div class="form-row">
							<div class="col-4">
								<a href="./all-spaces.html"
									class="card img-card fh-400 border-0 outer-bg"
									data-background-inner="../resources/spaces/assets/img/newyork.jpg"><div
										class="inner-bg overlay-dark"></div>
									<div class="card-img-overlay d-flex align-items-center">
										<div class="card-body text-white p-3">
											<h5 class="text-uppercase text-center">United States</h5>
										</div>
									</div></a>
							</div>
							<div class="col-3">
								<a href="./all-spaces.html"
									class="card img-card fh-220 border-0 outer-bg mb-2"
									data-background-inner="../resources/spaces/assets/img/paris.jpg"><div
										class="inner-bg overlay-dark"></div>
									<div class="card-img-overlay d-flex align-items-center">
										<div class="card-body text-white p-3">
											<h5 class="text-uppercase text-center">France</h5>
										</div>
									</div></a> <a href="./all-spaces.html"
									class="card img-card fh-170 border-0 outer-bg"
									data-background-inner="../resources/spaces/assets/img/paris.jpg"><div
										class="inner-bg overlay-dark"></div>
									<div class="card-img-overlay d-flex align-items-center">
										<div class="card-body text-white p-3">
											<h5 class="text-uppercase text-center">Italy</h5>
										</div>
									</div></a>
							</div>
							<div class="col-5">
								<div class="form-row mb-2">
									<div class="col-5">
										<a href="./all-spaces.html"
											class="card img-card fh-400 border-0 outer-bg"
											data-background-inner="../resources/spaces/assets/img/tokyo.jpg"><div
												class="inner-bg overlay-dark"></div>
											<div class="card-img-overlay d-flex align-items-center">
												<div class="card-body text-white p-3">
													<h5 class="font-weight-normal text-uppercase text-center">Japan</h5>
												</div>
											</div></a>
									</div>
									<div class="col-7">
										<a href="./all-spaces.html"
											class="card img-card fh-400 border-0 outer-bg"
											data-background-inner="../resources/spaces/assets/img/london.jpg"><div
												class="inner-bg overlay-dark"></div>
											<div class="card-img-overlay d-flex align-items-center">
												<div class="card-body text-white p-3">
													<h5 class="text-uppercase text-center">UK</h5>
												</div>
											</div></a>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="form-row">
									<div class="col">
										<a href="./all-spaces.html"
											class="card img-card fh-240 border-0 outer-bg"
											data-background-inner="../resources/spaces/assets/img/tokyo.jpg"><div
												class="inner-bg overlay-dark"></div>
											<div class="card-img-overlay d-flex align-items-center">
												<div class="card-body text-white p-3">
													<h5 class="font-weight-normal text-uppercase text-center">Japan</h5>
												</div>
											</div></a>
									</div>
									<div class="col">
										<a href="./all-spaces.html"
											class="card img-card fh-240 border-0 outer-bg"
											data-background-inner="../resources/spaces/assets/img/london.jpg"><div
												class="inner-bg overlay-dark"></div>
											<div class="card-img-overlay d-flex align-items-center">
												<div class="card-body text-white p-3">
													<h5 class="text-uppercase text-center">UK</h5>
												</div>
											</div></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row d-lg-none">
					<div class="col-12 col-sm-6 col-lg-3 mb-4 mb-lg-0">
						<a href="./all-spaces.html"
							class="card img-card fh-400 border-0 outer-bg"
							data-background-inner="../resources/spaces/assets/img/newyork.jpg"><div
								class="inner-bg overlay-dark"></div>
							<div class="card-img-overlay d-flex align-items-center">
								<div class="card-body text-white p-3">
									<h5 class="text-uppercase text-center">New York</h5>
								</div>
							</div></a>
					</div>
					<div class="col-12 col-sm-6 col-lg-3 mb-4 mb-lg-0">
						<a href="./all-spaces.html"
							class="card img-card fh-400 border-0 outer-bg"
							data-background-inner="../resources/spaces/assets/img/paris.jpg"><div
								class="inner-bg overlay-dark"></div>
							<div class="card-img-overlay d-flex align-items-center">
								<div class="card-body text-white p-3">
									<h5 class="text-uppercase text-center">Paris</h5>
								</div>
							</div></a>
					</div>
					<div class="col-12 col-sm-6 col-lg-3 mb-4 mb-lg-0">
						<a href="./all-spaces.html"
							class="card img-card fh-400 border-0 outer-bg"
							data-background-inner="../resources/spaces/assets/img/london.jpg"><div
								class="inner-bg overlay-dark"></div>
							<div class="card-img-overlay d-flex align-items-center">
								<div class="card-body text-white p-3">
									<h5 class="text-uppercase text-center">London</h5>
								</div>
							</div></a>
					</div>
					<div class="col-12 col-sm-6 col-lg-3 mb-4 mb-lg-0">
						<a href="./all-spaces.html"
							class="card img-card fh-400 border-0 outer-bg"
							data-background-inner="../resources/spaces/assets/img/tokyo.jpg"><div
								class="inner-bg overlay-dark"></div>
							<div class="card-img-overlay d-flex align-items-center">
								<div class="card-body text-white p-3">
									<h5 class="font-weight-normal text-uppercase text-center">Tokyo</h5>
								</div>
							</div></a>
					</div>
				</div>
		</section>
	</main>
	<div class="section py-0">
		<div class="container z-2">
			<div
				class="row position-relative justify-content-center align-items-cente">
				<div class="col-12">
					<div class="card border-light">
						<div class="card-body text-left px-5 py-4">
							<div class="row align-items-center">
								<div class="col-md-5">
									<p class="lead mb-4">
										<span class="font-weight-bold">5500</span> venues in <span
											class="font-weight-bold">400</span> cities across <span
											class="font-weight-bold">73</span> countries, and everyday
										counting.
									</p>
									<div class="row mb-4">
										<div class="col">
											<ul class="list-group mb-3">
												<li class="list-group-item text-gray p-0 mb-2"><a
													href="#"><span class="fas fa-map-marker-alt mr-2"></span>New
														York</a></li>
												<li class="list-group-item text-gray p-0 mb-2"><a
													href="#"><span class="fas fa-map-marker-alt mr-2"></span>Paris</a></li>
												<li class="list-group-item text-gray p-0 mb-2"><a
													href="#"><span class="fas fa-map-marker-alt mr-2"></span>Milano</a></li>
												<li class="list-group-item text-gray p-0"><a href="#"><span
														class="fas fa-map-marker-alt mr-2"></span>Rome</a></li>
											</ul>
										</div>
										<div class="col">
											<ul class="list-group mb-3">
												<li class="list-group-item text-gray p-0 mb-2"><a
													href="#"><span class="fas fa-map-marker-alt mr-2"></span>Madrid</a></li>
												<li class="list-group-item text-gray p-0 mb-2"><a
													href="#"><span class="fas fa-map-marker-alt mr-2"></span>Berlin</a></li>
												<li class="list-group-item text-gray p-0 mb-2"><a
													href="#"><span class="fas fa-map-marker-alt mr-2"></span>London</a></li>
												<li class="list-group-item p-0"><a
													href="../resources/spaces/html/all-spaces.html">All cities<span
														class="fas fa-arrow-right fa-xs ml-2"></span></a></li>
											</ul>
										</div>
									</div>
									<a href="../resources/spaces/html/submit-item.html"
										class="btn btn-secondary animate-up-2"><span
										class="fas fa-plus mr-2"></span>List a Space</a>
								</div>
								<div
									class="col-12 col-md-7 mt-5 mt-md-0 text-md-right d-none d-sm-block">
									<img src="../resources/spaces/assets/img/illustrations/world-map.svg" alt>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer pb-5 bg-primary text-white pt-9 mt-n9">
		<div class="container">
			<div class="row mt-6">
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
							href="https://themesberg.com/docs/spaces/getting-started/quickstart/">Documentation
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
					<button class="btn btn-sm btn-white mb-xl-0 mr-2 mr-lg-2">
						<span class="d-flex align-items-center"><span
							class="icon icon-brand mr-2"><span class="fab fa-apple"></span></span>
							<span class="d-inline-block text-left"><small
								class="font-weight-normal d-block">Available on</small> App
								Store</span></span>
					</button>
					<button class="btn btn-sm btn-white">
						<span class="icon icon-brand mr-2"><span
							class="fab fa-google-play"></span></span> <span
							class="d-inline-block text-left"><small
							class="font-weight-normal d-block">Available on</small> Google
							Play</span>
					</button>
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
</body>
</html>