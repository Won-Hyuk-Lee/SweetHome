<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.InputStream"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>지도 서비스</title>

<!-- CSS 파일 링크 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
/* 전체 페이지 스타일 */
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

/* 지도 컨테이너 스타일 */
#map {
	width: calc(100% - 300px); /* recommend tab을 위해 너비 조정 */
	height: calc(100% - 80px);
	position: absolute;
	top: 80px;
	right: 0;
	z-index: 1;
}

/* 좌측 탭 스타일 */
#leftTab {
	width: 300px;
	height: calc(100% - 80px);
	position: absolute;
	top: 80px;
	left: 0;
	background: rgba(255, 255, 255, 1);
	padding: 20px;
	box-sizing: border-box;
	overflow-y: auto;
	z-index: 2;
	border-right: 1px solid #ccc;
}

/* 추천 탭 스타일 */
#recommendTab {
	width: 300px;
	height: calc(100% - 80px);
	position: absolute;
	top: 80px;
	left: 300px;
	background: rgba(255, 255, 255, 1);
	padding: 20px;
	box-sizing: border-box;
	overflow-y: auto;
	z-index: 2;
	border-right: 1px solid #ccc;
	display: none; /* 초기에는 숨김 */
}

/* 기타 UI 요소 스타일 */
#crosshair, #info, .context-menu {
	z-index: 3;
}

/* 드롭다운 스타일 */
.dropdown {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
}

#crosshair {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 20px;
	height: 20px;
	margin-left: -10px;
	margin-top: -10px;
	font-size: 20px;
	color: red;
}

#info {
	padding: 10px;
	background-color: rgba(255, 255, 255, 0.8);
	border: 1px solid #ccc;
	position: absolute;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	border-radius: 5px;
	z-index: 3;
	pointer-events: none;
}

#searchResults {
	margin-top: 20px;
}

#searchResults div {
	padding: 10px;
	border-bottom: 1px solid #eee;
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.place-info {
	flex-grow: 1;
}

.select-btn {
	padding: 5px 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 4px;
}

.select-btn:hover {
	background-color: #45a049;
}

#searchResults div:hover {
	background-color: #f0f0f0;
}

/* 추천서비스 버튼 스타일 */
#recommendButton {
	margin-top: 20px;
	padding: 10px;
	background-color: #008CBA;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	width: 100%;
}

#recommendButton:hover {
	background-color: #007B9A;
}

/* 컨텍스트 메뉴 스타일 */
.context-menu {
	display: none;
	position: absolute;
	background-color: white;
	border: 1px solid #ccc;
	padding: 5px 0;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

.context-menu ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.context-menu li {
	padding: 5px 20px;
	cursor: pointer;
}

.context-menu li:hover {
	background-color: #f0f0f0;
}

.bg-primary {
	background-color: yellowgreen !important;
}

.btn-primary {
	color: #fff;
	background-color: yellowgreen;
	border-color: black;
	box-shadow: 0 0 24px rgba(154, 205, 50, .04), 0 44px 74px
		rgba(154, 205, 50, .06);
}

.recommendation-factors {
	margin-top: 20px;
}

.factor {
	margin-bottom: 15px;
}

.navbar-main {
	height: 80px;
	z-index: 1000;
}
</style>
</head>
<body>
	<!-- 구글 태그 매니저 (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-THQTXJ7"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>

	<!-- 헤더 및 네비게이션 바 -->
	<header class="header-global">
		<nav id="navbar-main"
			class="navbar navbar-main navbar-theme-primary navbar-expand-lg headroom py-lg-3 px-lg-6 navbar-dark navbar-transparent navbar-theme-primary">
			<div class="container">
				<!-- 로고 -->
				<a class="navbar-brand" href="/jsp/index.jsp"> <img
					class="navbar-brand-dark common"
					src="../resources/spaces/assets/img/brand/light.svg" height="35"
					alt="Logo light"> <img class="navbar-brand-light common"
					src="../resources/spaces/assets/img/brand/dark.svg" height="35"
					alt="Logo dark">
				</a>

				<!-- 네비게이션 메뉴 -->
				<div class="navbar-collapse collapse" id="navbar_global">
					<div class="navbar-collapse-header">
						<div class="row">
							<div class="col-6 collapse-brand">
								<a href="/jsp/index.jsp"> <img
									src="../resources/spaces/assets/img/brand/dark.svg" height="35"
									alt="Logo Impact">
								</a>
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
						<!-- 지도 메뉴 -->
						<li class="nav-item dropdown"><a href="#"
							id="mainPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"> <span
								class="nav-link-inner-text mr-1">지도</span>
						</a></li>
						<!-- 커뮤니티 메뉴 -->
						<li class="nav-item dropdown"><a href="/community/list"
							id="dashboardPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"> <span
								class="nav-link-inner-text mr-1">커뮤니티</span> <i
								class="fas fa-angle-down nav-link-arrow"></i>
						</a>
							<div class="dropdown-menu dropdown-megamenu-sm p-3 p-lg-4"
								aria-labelledby="dashboardPagesDropdown">
								<!-- 드롭다운 메뉴 내용 -->
							</div></li>
						<!-- 내 정보 메뉴 -->
						<li class="nav-item dropdown"><a href="#"
							id="mainPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"> <span
								class="nav-link-inner-text mr-1">내 정보</span>
						</a></li>
					</ul>
				</div>

				<!-- 로그인/로그아웃 버튼 -->
				<div class="d-none d-lg-block">
					<c:choose>
						<c:when test="${not empty userSeq}">
							<a href="/common/logout"
								class="btn btn-md btn-secondary animate-up-2"> <i
								class="fas fa-sign-out-alt mr-2"></i> 로그아웃
							</a>
						</c:when>
						<c:otherwise>
							<a href="/jsp/login.jsp"
								class="btn btn-md btn-outline-white animate-up-2 mr-3"> <i
								class="fas fa-sign-in-alt mr-2"></i> <span
								class="d-none d-md-inline">로그인</span>
							</a>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 모바일 메뉴 토글 버튼 -->
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

	<!-- 메인 콘텐츠 -->
	<main>
		<!-- 좌측 탭 -->
		<div id="leftTab">
			<h2>목적지 검색</h2>
			<input type="text" id="destinationSearch" placeholder="목적지 입력">
			<button id="destinationSearchButton" onclick="searchDestination()">검색</button>
			<div id="searchResults"></div>
			<button id="recommendButton" onclick="useRecommendService()">추천서비스
				이용</button>
		</div>

		<!-- 추천 탭 -->
		<div id="recommendTab">
			<h2>추천 서비스</h2>
			<!-- 추천 서비스 내용은 여기에 추가 -->
		</div>

		<!-- 지도 컨테이너 -->
		<div id="map">
			<div id="crosshair">+</div>
			<div id="info"></div>
		</div>

		<!-- 컨텍스트 메뉴 (우클릭 시 표시) -->
		<div id="context-menu" class="context-menu">
			<ul>
				<li onclick="zoomIn()">확대</li>
				<li onclick="zoomOut()">축소</li>
				<li onclick="addMarker()">마커 추가</li>
				<li onclick="measure()">거리재기</li>
				<li onclick="roadview()">로드뷰</li>
				<li onclick="shareLocation()">현재 위치 공유</li>
			</ul>
		</div>
	</main>

	<!-- 스크립트 파일 로드 -->
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

	<%
	// 카카오 맵 API 키 로드
	String apiKey = null;
	Properties prop = new Properties();
	String propFileName = "api/kakaoDeveloperJavaScriptAPI.properties";

	try (InputStream inputStream = application.getResourceAsStream("/WEB-INF/classes/" + propFileName)) {
		if (inputStream != null) {
			prop.load(inputStream);
			apiKey = prop.getProperty("kakao.map.api.key");
		} else {
			throw new Exception("설정 파일 '" + propFileName + "'을 찾을 수 없습니다.");
		}
	} catch (Exception e) {
		out.println("ERROR: " + e.getMessage());
		return;
	}

	if (apiKey == null || apiKey.isEmpty()) {
		out.println("ERROR: API 키가 설정되지 않았습니다.");
		return;
	}
	%>

	<!-- 카카오 맵 API 스크립트 로드 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=apiKey%>&libraries=services,clusterer,drawing"></script>

	<script>
        // 전역 변수 선언
        var map;
        var ps;
        var infowindow;
        var selectedDestination = null;

        // 외부 부동산 사이트 열기 함수
        function openNaver(lat, lng) {
            var url = 'https://new.land.naver.com/rooms?ms=' + encodeURIComponent(lat) + ',' + encodeURIComponent(lng) + ',16&a=APT:OPST:ABYG:OBYG:GM:OR:VL:DDDGG:JWJT:SGJT:HOJT&e=RETAIL&aa=SMALLSPCRENT';
            window.open(url, '_blank');
        }

        function openDaum(lat, lng) {
            var url = 'https://realty.daum.net/home/oneroom/map?latitude=' + encodeURIComponent(lat) + '&longitude=' + encodeURIComponent(lng) + '&zoom=3';
            window.open(url, '_blank');
        }

        function openZigbang(lat, lng) {
            var url = 'https://www.zigbang.com/home/oneroom/map?latitude=' + encodeURIComponent(lat) + '&longitude=' + encodeURIComponent(lng) + '&zoom=3';
            window.open(url, '_blank');
        }

        // 페이지 로드 시 실행되는 함수
        window.onload = function() {
            // 지도 컨테이너 설정
            var container = document.getElementById('map');
            container.style.width = 'calc(100% - 300px)';
            container.style.height = 'calc(100vh - 80px)';
            
            // 지도 옵션 설정
            var options = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 서울 시청 좌표
                level: 8 // 초기 줌 레벨
            };

            // 지도 생성
            map = new kakao.maps.Map(container, options);

            // 줌 컨트롤 추가
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 지도 타입 컨트롤 추가
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 중심 좌표 변경 시 이벤트 처리
            var infoDiv = document.getElementById('info');
            kakao.maps.event.addListener(map, 'center_changed', function() {
                var center = map.getCenter();
                infoDiv.innerHTML = '중심 좌표: 위도 ' + center.getLat().toFixed(6) + ', 경도 ' + center.getLng().toFixed(6);
            });

            // 마커 클러스터러 생성
            var clusterer = new kakao.maps.MarkerClusterer({
                map: map,
                averageCenter: true,
                minLevel: 5
            });

            // 장소 검색 객체 생성
            ps = new kakao.maps.services.Places();

            // 인포윈도우 생성
            infowindow = new kakao.maps.InfoWindow({zIndex:1});

            // 우클릭 이벤트 처리
            kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
                var latlng = mouseEvent.latLng;
                var content = '<div class="context-menu">' +
                              '<ul>' +
                              '<li onclick="openNaver(' + latlng.getLat() + ', ' + latlng.getLng() + ')">네이버 부동산</li>' +
                              '<li onclick="openDaum(' + latlng.getLat() + ', ' + latlng.getLng() + ')">다음 부동산</li>' +
                              '<li onclick="openZigbang(' + latlng.getLat() + ', ' + latlng.getLng() + ')">직방</li>' +
                              '</ul>' +
                              '</div>';

                var contextMenu = document.getElementById('context-menu');
                contextMenu.innerHTML = content;
                contextMenu.style.display = 'block';
                contextMenu.style.left = mouseEvent.clientX + 'px';
                contextMenu.style.top = mouseEvent.clientY + 'px';
            });

            // 컨텍스트 메뉴 닫기
            document.addEventListener('click', function(event) {
                var contextMenu = document.getElementById('context-menu');
                if (contextMenu.style.display === 'block') {
                    contextMenu.style.display = 'none';
                }
            });
        }

        // 장소 검색 콜백 함수
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                var bounds = new kakao.maps.LatLngBounds();
                var searchResults = document.getElementById('searchResults');
                searchResults.innerHTML = '';
                
                for (var i = 0; i < Math.min(data.length, 5); i++) {
                    displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                    
                    var place = data[i];
                    var div = document.createElement('div');
                    
                    var address = place.address_name ? place.address_name : "주소 정보 없음";
                    var addressParts = address.split(' ');
                    var shortAddress = addressParts.slice(0, 3).join(' ');
                    
                    div.innerHTML = '<div class="place-info">' +
                                        '<strong>' + place.place_name + '</strong><br>' +
                                        '<small>(' + shortAddress + ')</small>' +
                                    '</div>' +
                                    '<button class="select-btn" onclick="selectLocation(' + place.y + ', ' + place.x + ', \'' + place.place_name + '\', \'' + shortAddress + '\')">선택</button>';
                    searchResults.appendChild(div);
                }

                map.setBounds(bounds);
            }
        }

        // 마커 표시 함수
        function displayMarker(place) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x) 
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                var address = place.address_name ? place.address_name : "주소 정보 없음";
                var addressParts = address.split(' ');
                var shortAddress = addressParts.slice(0, 3).join(' ');

                var content = '<div style="padding:5px;font-size:12px;">' + 
                              '<strong>' + place.place_name + '</strong><br>' +
                              '<small>' + shortAddress + '</small><br>' +
                              '<button onclick="openNaver(' + place.y + ', ' + place.x + ')">네이버 부동산</button> ' +
                              '<button onclick="openDaum(' + place.y + ', ' + place.x + ')">다음 부동산</button> ' +
                              '<button onclick="openZigbang(' + place.y + ', ' + place.x + ')">직방</button>' +
                              '</div>';
                infowindow.setContent(content);
                infowindow.open(map, marker);
            });
        }

        // 장소 검색 함수
        function searchDestination() {
            var keyword = document.getElementById('destinationSearch').value;
            if (!keyword.trim()) {
                alert('목적지를 입력해주세요!');
                return false;
            }
            ps.keywordSearch(keyword, placesSearchCB);
        }

     // 목적지 선택 함수
        function selectLocation(lat, lng, placeName, address) {
            var moveLatLng = new kakao.maps.LatLng(lat, lng);
            map.setCenter(moveLatLng);
            map.setLevel(3);
            selectedDestination = {
                lat: lat,
                lng: lng,
                name: placeName,
                address: address
            };
            alert(placeName + '을(를) 목적지로 선택했습니다.');
            
            // 서울 주소인 경우에만 추천 서비스 버튼 활성화
            var recommendButton = document.getElementById('recommendButton');
            if (address.startsWith('서울')) {
                recommendButton.disabled = false;
                recommendButton.style.opacity = 1;
            } else {
                recommendButton.disabled = true;
                recommendButton.style.opacity = 0.5;
            }
        }

     // 추천 서비스 이용 함수
        	function useRecommendService() {
    if (!selectedDestination) {
        alert('목적지를 먼저 선택해주세요.');
        return;
    }
    //서울시 한정
    if (!selectedDestination.address.startsWith('서울')) {
        alert('현재 서비스는 서울시에 한정하여 제공됩니다.');
        return;
    }
    
    // 추천 탭 표시
    var recommendTab = document.getElementById('recommendTab');
    recommendTab.style.display = 'block';
    // 지도 크기 조정
    document.getElementById('map').style.width = 'calc(100% - 600px)';

    // 추천 서비스 내용 업데이트
    recommendTab.innerHTML = `
    	<h2>추천 서비스</h2>
        <div class="recommendation-factors">
            <div class="factor">
                <p>이동거리</p>
                <select id="distanceImportance" class="dropdown">
                    <option value="1">서울전체</option>
                    <option value="2">대중교통 1시간 이내</option>
                    <option value="3">대중교통 30분 이내</option>
                    <option value="4">대중교통 10분 이내</option>
                    <option value="5">도보 10분 이내</option>
                </select>
            </div>
            <div class="factor">
                <p>치안수준</p>
                <select id="safetyImportance" class="dropdown">
                    <option value="1">상관없음</option>
                    <option value="2">약간 중요함</option>
                    <option value="3">보통</option>
                    <option value="4">중요함</option>
                    <option value="5">매우 중요함</option>
                </select>
            </div>
        </div>
        <button onclick="getRecommendations()">추천 받기</button>
        <div id="recommendations"></div>
    `;
}		
    
     // 추천 받기 함수
        function getRecommendations() {
    var distanceImportance = document.getElementById('distanceImportance').value;
    var safetyImportance = document.getElementById('safetyImportance').value;

    $.ajax({
        url: '/map/recommend',
        type: 'POST',
        dataType: 'json',
        data: {
            district: selectedDestination.address.split(' ')[1],
            latitude: selectedDestination.lat,
            longitude: selectedDestination.lng,
            distanceImportance: distanceImportance,
            safetyImportance: safetyImportance
        },
        success: function(response) {
            console.log('Success:', response);
            if (response && response.length > 0) {
                alert('추천 자치구: ' + response.join(', '));
                updateRecommendations(response);
            } else {
                alert('추천 결과가 없습니다.');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', xhr.responseText);
            alert('추천 서비스 오류: ' + xhr.responseText);
        }
    });
}

function updateRecommendations(recommendations) {
    var recommendationsDiv = document.getElementById('recommendations');
    recommendationsDiv.innerHTML = '<h3>추천 자치구</h3>';
    var ul = document.createElement('ul');
    recommendations.forEach(function(district) {
        var li = document.createElement('li');
        li.textContent = district;
        ul.appendChild(li);
    });
    recommendationsDiv.appendChild(ul);
}

        // 전역 함수로 등록
        window.searchDestination = searchDestination;
        window.selectLocation = selectLocation;
        window.useRecommendService = useRecommendService;
        window.openNaver = openNaver;
        window.openDaum = openDaum;
        window.openZigbang = openZigbang;
    </script>
</body>
</html>