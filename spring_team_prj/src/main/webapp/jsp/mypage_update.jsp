<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <style>
    .wrong_text{font-size:1rem;color:#f44e38;letter-spacing:-.2px;font-weight:300;margin:8px 0 2px;line-height:1em;display:none}
  </style>
  <head>
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <!-- jquery -->
    <script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
    <script src="/javascript/popup_2.js"></script>
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
									<a href="./account.html"
										class="d-flex list-group-item list-group-item-action">내 정보 수정
										<span class="icon icon-xs ml-auto"><span
											class="fas fa-chevron-right"></span></span>
									</a><a href="./settings.html"
										class="d-flex list-group-item list-group-item-action active">내가 쓴 게시글<span
										class="icon icon-xs ml-auto"><span
											class="fas fa-chevron-right"></span></span>
									</a><a href="./my-items.html"
										class="d-flex list-group-item list-group-item-action">내가 쓴 댓글<span class="icon icon-xs ml-auto"><span
											class="fas fa-chevron-right"></span></span>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-lg-8">
						<div class="row">
							<div class="col-lg-12">
								<div class="card card-body bg-white border-light mb-4">
     <h2 class="h5 mb-4" style="font-size: 2.5rem;">내 정보 수정</h2>
    <form id="userForm" action="/user/update" method="post">
        <input type="hidden" id="userSeq" name="userSeq" value="${sessionScope.userSeq}">
  <div class="row">
    <div class="col-md-6 mb-3">
        <div class="form-group">
		    <label for="first_name">이름</label>
		    <div class="input-group">
		        <!-- 아이콘을 입력 필드의 왼쪽에 배치 -->
		        <div class="input-group-prepend">
		            <span class="input-group-text">
		                <span class="fas fa-user"></span>
		            </span>
		        </div>
		        <!-- 입력 필드 -->
		        <input class="form-control" id="first_name" type="text"
		               value="${KEY_USERVO.userName}"
		               placeholder="${KEY_USERVO.userName}" readonly>
		    </div>
		</div>
    </div>
    <div class="col-md-6 mb-3">
        <div class="form-group">
		    <label for="nickname">닉네임</label>
		    <div class="input-group">
		        <!-- 아이콘을 입력 필드의 왼쪽에 배치 -->
		        <div class="input-group-prepend">
		            <span class="input-group-text">
		                <span class="fas fa-user"></span>
		            </span>
		        </div>
		        <!-- 입력 필드와 중복 확인 버튼을 포함 -->
		        <input class="form-control" id="nickname" name="nickname" type="text"
		               value="${KEY_USERVO.userNickname}"
		               placeholder="${KEY_USERVO.userNickname}" oninput="changeNickname()">
		        <div class="input-group-append">
		            <button type="button" class="btn btn-secondary btn-sm" onclick="checkNickname()">중복확인</button>
		        </div>
		    </div>
		</div>
    </div>
</div>
   

        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="form-group">
                    <label for="email">Email</label>
                    <div class="input-group mb-4">
						<div class="input-group-prepend">
							<span class="input-group-text"><span
								class="fas fa-envelope"></span></span>
						</div>
		                   <input class="form-control" id="email" type="email"
		                          value="${KEY_USERVO.userEmail}"
		                          placeholder="${KEY_USERVO.userEmail}" readonly>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
				<div class="form-group">
					<label for="phone">전화번호</label>
					<div class="input-group mb-4">
						<div class="input-group-prepend">
							<span class="input-group-text"><span
								class="fas fa-phone"></span></span>
						</div>
						<input class="form-control" id="phone" name="phone"
							value="${KEY_USERVO.phoneNumber}"
                           placeholder="${KEY_USERVO.phoneNumber}" type="tel"
							aria-label="Phone number"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
					</div>
				</div>
			</div>
        </div>

<h2 class="h5 my-4">주소</h2>
<div class="row">
    <div class="col-sm-9 mb-3">
        <div class="form-group">
            <div class="input-group">
                <!-- 아이콘을 입력 필드의 왼쪽에 배치 -->
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <span class="fas fa-map-marker-alt"></span> <!-- 주소에 적합한 아이콘 사용 -->
                    </span>
                </div>
                <input class="form-control" id="sample6_address" name="sample6_address" type="text"
                       value="${KEY_USERVO.address}"
                       placeholder="${KEY_USERVO.address}" readonly>
                <div class="input-group-append">
                    <button type="button" class="btn btn-primary" onclick="searchAddress()">주소검색</button>
                </div>
            </div>
        </div>
    </div>
</div>

<h2 class="h5 my-4">상세 주소</h2>
<div class="row">
    <div class="col-sm-9 mb-3">
        <div class="form-group">
            <div class="input-group">
                <!-- 아이콘을 입력 필드의 왼쪽에 배치 -->
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <span class="fas fa-home"></span> <!-- 상세 주소에 적합한 아이콘 사용 -->
                    </span>
                </div>
                <input class="form-control" id="sample6_detailAddress" name="sample6_detailAddress" type="text"
                       value="${KEY_USERVO.addressDetail}"
                       placeholder="${KEY_USERVO.addressDetail}">
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="sample6_extraAddress">
<input type="hidden" id="sample6_postcode">

								<div class="card card-body bg-white border-light">
									<h2 class="h5 mb-4">소셜 로그인 연동상태</h2>
									
<c:choose>
    <c:when test="${KEY_USERVO.provider eq 'KAKAO'}">
        <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex align-items-center pl-0 border-bottom">
                <div class="d-flex align-items-center">
                    <img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/icon_1/Kakao.png"
                        style="border: 1px solid #bbbbbb; border-radius: 15%; width: 50px;">
                    <div class="ml-2">
                        <h3 class="h6 mb-1"> Kakao</h3>
                        <span class="small">카카오 계정으로 ${KEY_USERVO.createdDate}날에 이 홈페이지에 회원가입 하였습니다.</span>
                    </div>
                </div>
            </li>
        </ul>
    </c:when>
    <c:when test="${KEY_USERVO.provider eq 'NAVER'}">
        <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex align-items-center pl-0 border-bottom">
                <div class="d-flex align-items-center">
                    <img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/icon_1/Naver.png"
                        style="border: 1px solid #bbbbbb; border-radius: 15%; width: 50px;">
                    <div class="ml-2">
                        <h3 class="h6 mb-1"> Naver</h3>
                        <span class="small">네이버 계정으로 ${KEY_USERVO.createdDate}날에 이 홈페이지에 회원가입 하였습니다.</span>
                    </div>
                </div>
            </li>
        </ul>
    </c:when>
    <c:when test="${KEY_USERVO.provider eq 'GOOGLE'}">
        <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex align-items-center pl-0 border-bottom">
                <div class="d-flex align-items-center">
                    <img src="https://test.codemshop.com/wp-content/plugins/mshop-mcommerce-premium-s2/lib/mshop-members-s2/assets/images/social/logo/Google.png"
                        style="border: 1px solid #bbbbbb; border-radius: 15%; width: 50px;">
                    <div class="ml-2">
                        <h3 class="h6 mb-1"> Google</h3>
                        <span class="small">구글 계정으로 ${KEY_USERVO.createdDate}날에 이 홈페이지에 회원가입 하였습니다.</span>
                    </div>
                </div>
            </li>
        </ul>
    </c:when>
    <c:otherwise>
        <p>연동중인 소셜 계정이 없는 기본 회원입니다.</p>
    </c:otherwise>
</c:choose>

								</div>
							</div>
						</div>
            <button type="button" class="btn btn-md btn-secondary animate-up-2 " onclick="validateForm()" style="margin-left: 1000px;">내 정보 수정</button>
					</div>
				</div>
			</div>
			
		</div>
		
		
	</main>
	<script>
	// 닉네임 중복 확인 상태
	function changeNickname() {
		 nicknameChecked = false;
	}
	var nicknameChecked = false;
	// 닉네임 중복 확인 함수
	function checkNickname() {
		 // 닉네임 중복 체크 여부 확인
		userNickname = document.getElementById('nickname').value;
	    if (!userNickname || userNickname.trim() === "" || userNickname === "닉네임") {
	        alert('닉네임을 적어주세요');
	        return false;
	    }
		alert(userNickname);
		$.ajax({
    method: "POST",
    url: "${pageContext.request.contextPath}/auth/nick_check",
    data: {
    	userNickname: userNickname,
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.log("에러:", textStatus, errorThrown);
		alert('닉네임 체크 에러');
    },
    success: function(response) {
        console.log("RestController Spring 응답:", response);
        if(response==0){
				alert('닉네임 중복 체크가 완료되었습니다.');
	            nicknameChecked = true;
        	}
        else{
    	    	alert('이미 존재하는 닉네임입니다.');
    	    	nicknameChecked = false;
        }
    }
});
	}
	// 폼 유효성 검사
	function validateForm() {
    // 닉네임 중복 체크 여부 확인
    var userNickname = document.getElementById('nickname').value;
    if (!userNickname || userNickname.trim() === "" || userNickname === "닉네임") {
        alert('닉네임을 적어주세요');
        return false;
    }
    if (!nicknameChecked) {
        alert('닉네임 중복체크를 진행해주세요');
        return false;
    }
    // 전화번호 유효성 검사
    var phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
    var phoneNumber = document.getElementById('phone').value;
    if (!phoneRegex.test(phoneNumber)) {
        alert(phoneNumber + '전화번호의 입력형식이 올바르지 않습니다');
        return false;
    }

    // 주소 유효성 검사
    var sample6_address = document.getElementById('sample6_address').value;
   if (sample6_address == "주소") {
        alert('주소를 입력해주세요.');
        return false;
    }
    // 상세주소 유효성 검사
    var sample6_detailAddress = document.getElementById('sample6_detailAddress').value;
    if (sample6_detailAddress == "상세주소"||!sample6_detailAddress || sample6_detailAddress.trim() === "" ) {
        alert('상세주소를 입력해주세요.'+sample6_detailAddress);
        return false;
    }

    // FormData 객체 생성
    var formData = new FormData();
    var userSeq = document.getElementById('userSeq').value;
    formData.append('userSeq', userSeq);
    formData.append('phoneNumber', phoneNumber);
    formData.append('address', sample6_address);
    formData.append('addressDetail', sample6_detailAddress);
    formData.append('userNickname', userNickname);

    // AJAX를 이용한 서버 전송
    $.ajax({
        method: "POST",
        url: "${pageContext.request.contextPath}/user/update",
        data: formData,
        contentType: false,  // 필수
        processData: false,  // 필수
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("에러:", textStatus, errorThrown);
            alert('회원 수정 실패');
        },
        success: function(response) {
            console.log("RestController Spring 응답:", response);
            alert('회원 수정 성공');
            window.location.href = '/user/detail?seq='+userSeq; // 또는 원하는 페이지 URL로 변경
           
        }
    });

    return false; // 폼 전송 방지
}

	// 주소 검색 함수 (카카오 API 등으로 실제 구현 필요)
		function searchAddress() {
			 new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var addr = ''; // 주소 변수
			            var extraAddr = ''; // 참고항목 변수

			            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                addr = data.roadAddress;
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                addr = data.jibunAddress;
			            }

			            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			            if(data.userSelectedType === 'R'){
			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraAddr += data.bname;
			                }
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraAddr !== ''){
			                    extraAddr = ' (' + extraAddr + ')';
			                }
			                // 조합된 참고항목을 해당 필드에 넣는다.
			                document.getElementById("sample6_extraAddress").value = extraAddr;
			            
			            } else {
			                document.getElementById("sample6_extraAddress").value = '';
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('sample6_postcode').value = data.zonecode;
			            document.getElementById("sample6_address").value = addr;
			            // 커서를 상세주소 필드로 이동한다.
			            document.getElementById("sample6_detailAddress").focus();
			        }
			    }).open();
		}
	</script>
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