<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html lang="en">
<style>
.navbar-transparent {
    background-color: transparent; /* 배경색을 투명하게 설정 */
    border: 0;
    box-shadow: none;
}
</style>

<%@ include file = "/jsp/header.jsp"%>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spaces - Sign in</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,shrink-to-fit=no">
<meta name="title" content="Spaces - Sign in">
<meta name="author" content="Themesberg">
<meta name="description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta name="keywords"
	content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme">
<link rel="canonical"
	href="https://themesberg.com/product/bootstrap/spaces-bootstrap-directory-listing-template">
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-pro">
<meta property="og:title" content="Spaces - Sign in">
<meta property="og:description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta property="og:image"
	content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url"
	content="https://demo.themesberg.com/pixel-pro">
<meta property="twitter:title" content="Spaces - Sign in">
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
<link rel="manifest"
	href="../resources/spaces/assets/img/favicon/site.webmanifest">
<link rel="mask-icon"
	href="../resources/spaces/assets/img/favicon/safari-pinned-tab.svg"
	color="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">
<link type="text/css"
	href="../resources/spaces/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link type="text/css"
	href="../resources/spaces/vendor/leaflet/dist/leaflet.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="../resources/spaces/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="../resources/spaces/vendor/jqvmap/dist/jqvmap.min.css">
<link type="text/css" href="../resources/spaces/css/spaces.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    
 // 로그인 함수
    function login() {
        var userEmail = document.getElementById('email').value;
        var userPw = document.getElementById('password').value;

        $.ajax({
            method: "POST",
            url: "/auth/login", // 수정: ${pageContext.request.contextPath} 대신 실제 URL을 사용
            data: {
                userEmail: userEmail,
                userPw: userPw
            },
            dataType: "text", // 응답을 text로 받음
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("에러:", textStatus, errorThrown);
                alert('로그인 에러');
            },
            success: function(response) {
                if(response!="로그인 실패"){
                alert('로그인 성공');
                window.location.href = "${pageContext.request.contextPath}/common/index?seq="+response; 
                }
                else {

                alert('로그인 실패');
                }
                // 로그인 성공 후 추가적으로 할 작업을 여기에 작성
            }
        });
    }
</script>
</head>
<body>
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-THQTXJ7"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<main>
		<div
			class="preloader bg-dark flex-column justify-content-center align-items-center">
			<div class="position-relative">
				<img
					src="../resources/spaces/assets/img/brand/light-without-letter.svg"
					alt="Logo loader"> <img
					src="../resources/spaces/assets/img/brand/letter.svg"
					class="rotate-letter" alt="Letter loader">
			</div>
		</div>
		<br><br><br>
		<section
			class="min-vh-100 d-flex align-items-center section-image overlay-soft-dark py-5 py-lg-0"
			data-background="../resources/spaces/assets/img/form-image.jpg">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="text-center text-md-center mb-5 mt-md-0 text-white">
							<h1 class="mb-0 h3">로그인 정보</h1>
						</div>
					</div>
					<div
						class="col-12 d-flex align-items-center justify-content-center">
						<div
							class="signin-inner mt-3 mt-lg-0 bg-white shadow-soft border rounded border-light p-4 p-lg-5 w-100 fmxw-500">
							<form action="#">
								<div class="form-group">
									<label for="email">이메일 아이디</label>
									<div class="input-group mb-4">
										<div class="input-group-prepend">
											<span class="input-group-text"><span
												class="fas fa-envelope"></span></span>
										</div>
										<input class="form-control" id="email"
											placeholder="example@naver.com" type="text"
											aria-label="email address">
									</div>
								</div>
								<div class="form-group">
									<div class="form-group">
										<label for="password">비밀번호</label>
										<div class="input-group mb-4">
											<div class="input-group-prepend">
												<span class="input-group-text"><span
													class="fas fa-unlock-alt"></span></span>
											</div>
											<input class="form-control" id="password"
												placeholder="Password" type="password" aria-label="Password"
												required>
										</div>
									</div>
									<div
										class="d-flex justify-content-between align-items-center mb-4">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value
												id="remember"> <label class="form-check-label"
												for="remember">자동 로그인</label>
										</div>
										<div>
											<a href="./forgot-password-email.html"
												class="small text-right">비밀번호 찾기</a>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-block btn-primary" onclick="login()">로그인</button>
							</form>
							<div class="mt-3 mb-4 text-center">
								<span class="font-weight-normal">소셜 로그인</span>
							</div>
	<a href="/login/GOOGLE">
    <img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/logo/Google.png" 
         style="border: 1px solid #bbbbbb; border-radius: 15%; width: 36px; height: auto; margin-left: 125px;">
</a>
<a href="/login/KAKAO">
    <img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/icon_1/Kakao.png" 
         width="36" height="auto" style="margin-left: 10px;">
</a>
<a href="/login/NAVER">
    <img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/icon_1/Naver.png" 
         width="36" height="auto" style="margin-left: 10px;">
</a>
<br><p>
							<div
								class="d-block d-sm-flex justify-content-center align-items-center mt-4">
								<span class="font-weight-normal">회원정보가 없으신가요? <a
									href="/common/register" class="font-weight-bold">회원가입</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<script src="../resources/spaces/vendor/jquery/dist/jquery.min.js"></script>
	<script
		src="../resources/spaces/vendor/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="../resources/spaces/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="../resources/spaces/vendor/headroom.js/dist/headroom.min.js"></script>
	<script
		src="../resources/spaces/vendor/onscreen/dist/on-screen.umd.min.js"></script>
	<script
		src="../resources/spaces/vendor/nouislider/distribute/nouislider.min.js"></script>
	<script
		src="../resources/spaces/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script
		src="../resources/spaces/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script
		src="../resources/spaces/vendor/owl.carousel/dist/owl.carousel.min.js"></script>
	<script
		src="../resources/spaces/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	<script
		src="../resources/spaces/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.js"></script>
	<script
		src="../resources/spaces/vendor/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
	<script src="../resources/spaces/vendor/leaflet/dist/leaflet.js"></script>
	<script src="../resources/spaces/vendor/chartist/dist/chartist.min.js"></script>
	<script
		src="../resources/spaces/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="../resources/spaces/vendor/jqvmap/dist/jquery.vmap.min.js"></script>
	<script
		src="../resources/spaces/vendor/jqvmap/dist/maps/jquery.vmap.usa.js"></script>
	<script src="../resources/spaces/assets/js/jquery.slideform.js"></script>
	<script src="../resources/spaces/assets/js/spaces.js"></script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015"
		integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ=="
		data-cf-beacon='{"rayId":"89fe6daa4eca7c30","version":"2024.4.1","r":1,"token":"3a2c60bab7654724a0f7e5946db4ea5a","b":1}'
		crossorigin="anonymous"></script>
</body>
</html>