<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spaces - Sign up</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,shrink-to-fit=no">
<meta name="title" content="Spaces - Sign up">
<meta name="author" content="Themesberg">
<meta name="description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta name="keywords"
	content="bootstrap, bootstrap 4 template, directory listing bootstrap, bootstrap 4 listing, bootstrap listing, bootstrap 4 directory listing template, vector map, leaflet js template, mapbox theme, mapbox template, dashboard, themesberg, user dashboard bootstrap, dashboard bootstrap, ui kit, bootstrap ui kit, premium bootstrap theme">
<link rel="canonical"
	href="https://themesberg.com/product/bootstrap/spaces-bootstrap-directory-listing-template">
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-pro">
<meta property="og:title" content="Spaces - Sign up">
<meta property="og:description"
	content="Premium Directory Listing Bootstrap 4 Template featuring 37 hand-crafted pages, a dashboard an Mapbox integration. Spaces also comes with a complete UI Kit featuring over 700 components by Themesberg.">
<meta property="og:image"
	content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/spaces/thumbnail.jpg">
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url"
	content="https://demo.themesberg.com/pixel-pro">
<meta property="twitter:title" content="Spaces - Sign up">
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
				<img
					src="../resources/spaces/assets/img/brand/light-without-letter.svg"
					alt="Logo loader"> <img
					src="../resources/spaces/assets/img/brand/letter.svg"
					class="rotate-letter" alt="Letter loader">
			</div>
		</div>
		<!-- 회원 가입 폼 시작 -->
		<section
			class="min-vh-100 d-flex align-items-center section-image overlay-soft-dark py-5 py-lg-0"
			>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="text-center text-md-center mb-5 mt-md-0 text-white">
							<h1 class="mb-0 h3">회원 가입</h1>
						</div>
					</div>
					<div
						class="col-12 d-flex align-items-center justify-content-center">
						<div
							class="signin-inner mt-3 mt-lg-0 bg-white shadow-soft border rounded border-light p-4 p-lg-5 w-100 fmxw-1000">
							<form id="signupForm"">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="email">이메일 아이디 설정</label>
											<div class="input-group mb-2">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-envelope"></span></span>
												</div>
												<!-- 이메일 입력 필드 -->
												<input class="form-control form-control-lg" id="email"
													name="email" placeholder="example@naver.com" type="email"
													aria-label="email address" maxlength="50" required>
												<div class="input-group-append">
													<button type="button" class="btn btn-secondary btn-sm"
														onclick="sendVerificationEmail()">인증</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row" id="verificationCodeRow" style="display: none;">
									<div class="col-md-6">
										<div class="form-group">
											<label for="verificationCode">인증번호</label>
											<div class="input-group mb-2">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-key"></span></span>
												</div>
												<input class="form-control" id="verificationCode"
													name="verificationCode" placeholder="인증번호 입력" type="text"
													maxlength="6" required>
												<div class="input-group-append">
													<button type="button" class="btn btn-secondary btn-sm"
														onclick="verifyCode()">확인</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="password">비밀번호 설정</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-unlock-alt"></span></span>
												</div>
												<input class="form-control" id="password" name="password"
													placeholder="Password" type="password"
													aria-label="Password" minlength="8" maxlength="16" required>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="password_confirm">비밀번호 확인</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-unlock-alt"></span></span>
												</div>
												<input class="form-control" id="password_confirm"
													name="password_confirm" placeholder="Confirm password"
													type="password" aria-label="Confirm Password" required>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="nickname">닉네임</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-user"></span></span>
												</div>
												<input class="form-control form-control-lg" id="nickname"
													name="nickname" placeholder="닉네임" type="text"
													aria-label="Nickname" maxlength="24" required>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>&nbsp;</label>
											<div class="input-group mb-4">
												<button type="button" class="btn btn-secondary btn-sm"
													onclick="checkNickname()">중복확인</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="name">이름</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-user"></span></span>
												</div>
												<input class="form-control" id="name" name="name"
													placeholder="이름" type="text" aria-label="Name"
													maxlength="10" required>
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
													placeholder="010-1234-5678" type="tel"
													aria-label="Phone number"
													pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
											</div>
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="address">주소</label>
											<div class="input-group mb-4">
												<div class="input-group-prepend">
													<span class="input-group-text"><span
														class="fas fa-map-marker-alt"></span></span>
												</div>
												<!-- 주소 입력 필드 -->
												<input class="form-control form-control-lg" id="sample6_address"
													name="sample6_address" placeholder="주소" type="text"
													aria-label="Address" maxlength="66" required readonly>

											</div>
												<input class="form-control form-control-lg" id="sample6_extraAddress"
													name="sample6_extraAddress" placeholder="" type="text"
													aria-label="Address" maxlength="66" required readonly>
													

							
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>&nbsp;</label>
											<div class="input-group mb-4">
												<button type="button" class="btn btn-secondary btn-sm"
													onclick="searchAddress()">주소검색</button>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="address_detail">상세주소</label>
									<div class="input-group mb-4">
										<div class="input-group-prepend">
											<span class="input-group-text"><span
												class="fas fa-home"></span></span>
										</div>
										<input class="form-control" id="sample6_detailAddress"
											name="sample6_detailAddress" placeholder="상세주소" type="text"
											aria-label="Detailed address" maxlength="50">
											<input type="hidden" id="sample6_postcode"">
									</div>
								</div>
								<button type="submit" class="btn btn-block btn-primary"
									onclick="validateForm()">회원가입</button>
							</form>
							<div class="mt-3 mb-4 text-center">
								<span class="font-weight-normal">or</span>
							</div>
							<div class="btn-wrapper my-4 text-center">
								<button
									class="btn btn-icon-only btn-pill btn-outline-light text-facebook mr-2"
									type="button" aria-label="facebook button"
									title="facebook button">
									<span aria-hidden="true" class="fab fa-facebook-f"></span>
								</button>
								<button
									class="btn btn-icon-only btn-pill btn-outline-light text-twitter mr-2"
									type="button" aria-label="twitter button"
									title="twitter button">
									<span aria-hidden="true" class="fab fa-twitter"></span>
								</button>
								<button
									class="btn btn-icon-only btn-pill btn-outline-light text-facebook"
									type="button" aria-label="github button" title="github button">
									<span aria-hidden="true" class="fab fa-github"></span>
								</button>
							</div>
							<div
								class="d-block d-sm-flex justify-content-center align-items-center mt-4">
								<span class="font-weight-normal">회원정보가 있으신가요? <a
									href="./sign-in.html" class="font-weight-bold">로그인 하기</a>
								</span>
							</div>
	</main>
	<script>
		// 폼 유효성 검사
	function validateForm() {
    var userEmail = document.getElementById('email').value;

    // 이메일 유효성 검사
    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(userEmail)) {
        alert('ID는 이메일형식으로 최대30자로 알파벳 대소문자와 숫자로 구성');
        return false;
    }

    if (!verificationCodeSent) {
        alert('먼저 이메일 인증을 진행해주세요.');
        return false;
    }

    // 비밀번호 유효성 검사
    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
    var userPw = document.getElementById('password').value;
    if (!passwordRegex.test(userPw)) {
        alert('비밀번호는 8자~16자이며 영어 대소문자, 특수문자, 숫자를 필수로 포함');
        return false;
    }

    // 비밀번호 일치 여부 확인
    var password_confirm = document.getElementById('password_confirm').value;
    if (userPw !== password_confirm) {
        alert('비밀번호가 일치하지 않습니다');
        return false;
    }

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
 // 이름 여부 확인
    var userName = document.getElementById('name').value;
    if (userName == "이름") {
        alert('이름을 적어주세요.');
        return false;
    }
    // 전화번호 유효성 검사
    var phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
    var phoneNumber = document.getElementById('phone').value;
    if (!phoneRegex.test(phoneNumber)) {
        alert('전화번호의 입력형식이 올바르지 않습니다');
        return false;
    }

    // 주소 유효성 검사
    var sample6_address = document.getElementById('address').value;
   if (address == "주소") {
        alert('주소를 입력해주세요.');
        return false;
    }
    // 상세주소 유효성 검사
    var sample6_detailAddress = document.getElementById('address_detail').value;
    if (sample6_detailAddress == "상세주소"||!sample6_detailAddress || sample6_detailAddress.trim() === "" ) {
        alert('상세주소를 입력해주세요.'+sample6_detailAddress);
        return false;
    }

    // FormData 객체 생성
    var formData = new FormData();
    sample6_address = "이딴게주소";
    formData.append('userEmail', userEmail);
    formData.append('userPw', userPw);
    formData.append('userName', userName);
    formData.append('phoneNumber', phoneNumber);
    formData.append('address', sample6_address);
    formData.append('addressDetail', sample6_detailAddress);
    formData.append('userNickname', userNickname);

    // AJAX를 이용한 서버 전송
    $.ajax({
        method: "POST",
        url: "${pageContext.request.contextPath}/user/insert",
        data: formData,
        contentType: false,  // 필수
        processData: false,  // 필수
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("에러:", textStatus, errorThrown);
            alert('회원 가입 실패');
        },
        success: function(response) {
            console.log("RestController Spring 응답:", response);
            alert('회원 가입 성공');
            // 추가적인 처리 로직을 여기에 추가할 수 있습니다.
        }
    });

    return false; // 폼 전송 방지
}

		// 닉네임 중복 확인 상태
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

		// 이메일 인증번호 전송 함수
		var num = 0;
	function sendVerificationEmail() {
    // 6자리 랜덤 숫자 생성
    num = Math.floor(100000 + Math.random() * 900000);
    console.log("Generated verification code: " + num);

    var userEmail = document.getElementById('email').value;
    // 이메일 형식 검증
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(userEmail)) {
        alert('올바른 이메일 형식이 아닙니다');
        return;
    }

    // 여기에 실제 이메일 전송 로직 추가
    // 예: AJAX 요청을 서버로 보내 이메일 전송
 /*   $.ajax({
        method: "POST",
        url: "${pageContext.request.contextPath}/auth/email_send",
        data: {
            email: email,
            num: num
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("에러:", textStatus, errorThrown);
        },
        success: function(response) {
            console.log("RestController Spring 응답:", response);
        }
    });*/
    alert('입력하신 이메일로 인증번호를 발송했습니다. 확인 후 인증을 완료해주세요.');
    document.getElementById('verificationCodeRow').style.display = 'block';
}


		// 인증번호 확인 함수
		function verifyCode() {
			var code = $('#verificationCode').val();
			if (code.toString() != num.toString()) {
				alert('인증번호가 일치하지 않습니다.'+code+"그리고 "+num);
				return;
			}

			// 여기에 실제 인증번호 확인 로직 추가
			// 예: AJAX 요청을 서버로 보내 인증번호 확인
			verificationCodeSent = true;
			alert('이메일 인증이 완료되었습니다.');
		}

		let verificationCodeSent = false;

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
	<style>
.form-control-lg {
	height: calc(1.5em + 1rem + 2px);
	padding: .5rem 1rem;
	font-size: 1.25rem;
	line-height: 1.5;
	border-radius: .3rem;
}
</style>
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
</body>
</html>