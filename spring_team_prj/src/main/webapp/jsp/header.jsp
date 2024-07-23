<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 상단 탭 시작 -->
	<script>
		function myPageMove(event) {
	    event.preventDefault(); // 링크의 기본 동작(페이지 이동) 방지

	    // sessionStorage에서 userSeq 값을 가져옴
	   var userSeq = '${userSeq}';
	    // userSeq 값이 존재하면 mypage로 이동
	    if (userSeq) {
	        window.location.href = '/user/detail'; // userSeq가 있을 때 이동할 페이지
	    } else {
	        window.location.href = '/jsp/login.jsp'; // userSeq가 없을 때 이동할 페이지
	    }
	}
	function communityMove(event) {
	    event.preventDefault(); // 링크의 기본 동작(페이지 이동) 방지

	    // sessionStorage에서 userSeq 값을 가져옴
	   var userSeq = '${userSeq}';
	    // userSeq 값이 존재하면 mypage로 이동
	    if (userSeq) {
	        window.location.href = '/community/list'; // userSeq가 있을 때 이동할 페이지
	    } else {
	        window.location.href = '/jsp/login.jsp'; // userSeq가 없을 때 이동할 페이지
	    }
	}

</script>
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
						<li class="nav-item"><a href="/jsp/map.jsp"
							id="mainPagesDropdown" class="nav-link"><span
								class="nav-link-inner-text mr-1">지도</span></a></li>
						<li class="nav-item">
							<a class="nav-link"
							onclick="communityMove(event)">
						    	<span class="nav-link-inner-text mr-1">커뮤니티</span>
							</a>
						</li>
<c:choose>
    <c:when test="${sessionScope.userRole eq 'A'}">
        				<li class="nav-item ">
						    <a id="mainPagesDropdown" class="nav-link"
						       href = "${pageContext.request.contextPath}/admin/all_board_list"	>
						        <span class="nav-link-inner-text mr-1">관리자 메뉴</span>
						    </a>
						</li>
    </c:when>
    <c:otherwise>
						<li class="nav-item ">
						    <a id="mainPagesDropdown" 
						       class="nav-link"
						       onclick="myPageMove(event)">
						        <span class="nav-link-inner-text mr-1">내 정보</span>
						    </a>
						</li>
	</c:otherwise>
    </c:choose>
						
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
</body>
</html>