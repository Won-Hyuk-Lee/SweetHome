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
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	width: calc(100% - 300px);
	height: calc(100% - 80px);
	position: absolute;
	top: 100px;
	right: 0;
	z-index: 1;
}

#leftTab {
	width: 300px;
	height: calc(100% - 80px);
	position: absolute;
	top: 80px;
	left: 0;
	background: rgba(255, 255, 255, 0.9);
	padding: 20px;
	box-sizing: border-box;
	overflow-y: auto;
	z-index: 2;
	border-right: 1px solid #ccc;
}

#crosshair, #info, .context-menu {
	z-index: 3;
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
</style>
</head>
<body>
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-THQTXJ7"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>

	<header class="header-global">
		<nav id="navbar-main"
			class="navbar navbar-main navbar-theme-primary navbar-expand-lg headroom py-lg-3 px-lg-6 navbar-dark navbar-transparent navbar-theme-primary">
			<div class="container">
				<a class="navbar-brand" href="/jsp/index.jsp"> <img
					class="navbar-brand-dark common"
					src="../resources/spaces/assets/img/brand/light.svg" height="35"
					alt="Logo light"> <img class="navbar-brand-light common"
					src="../resources/spaces/assets/img/brand/dark.svg" height="35"
					alt="Logo dark">
				</a>

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
						<li class="nav-item dropdown"><a href="#"
							id="mainPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"> <span
								class="nav-link-inner-text mr-1">지도</span>
						</a></li>
						<li class="nav-item dropdown"><a href="/community/list"
							id="dashboardPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"> <span
								class="nav-link-inner-text mr-1">커뮤니티</span> <i
								class="fas fa-angle-down nav-link-arrow"></i>
						</a>
							<div class="dropdown-menu dropdown-megamenu-sm p-3 p-lg-4"
								aria-labelledby="dashboardPagesDropdown"></div></li>
						<li class="nav-item dropdown"><a href="#"
							id="mainPagesDropdown" class="nav-link dropdown-toggle"
							aria-expanded="false" data-toggle="dropdown"> <span
								class="nav-link-inner-text mr-1">내 정보</span>
						</a></li>
					</ul>
				</div>

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
		<div id="leftTab">
			<h2>목적지 검색</h2>
			<input type="text" id="destinationSearch" placeholder="목적지 입력">
			<button id="destinationSearchButton" onclick="searchDestination()">검색</button>
			<div id="searchResults"></div>
		</div>

		<div id="map">
			<div id="crosshair">+</div>
			<div id="info"></div>
		</div>

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

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=apiKey%>&libraries=services,clusterer,drawing"></script>

	<script>
		function openNaver(lat, lng) {
			var url = 'https://new.land.naver.com/rooms?ms='
					+ encodeURIComponent(lat)
					+ ','
					+ encodeURIComponent(lng)
					+ ',16&a=APT:OPST:ABYG:OBYG:GM:OR:VL:DDDGG:JWJT:SGJT:HOJT&e=RETAIL&aa=SMALLSPCRENT';
			window.open(url, '_blank');
		}

		function openDaum(lat, lng) {
			var url = 'https://realty.daum.net/home/oneroom/map?latitude='
					+ encodeURIComponent(lat) + '&longitude='
					+ encodeURIComponent(lng) + '&zoom=3';
			window.open(url, '_blank');
		}

		function openZigbang(lat, lng) {
			var url = 'https://www.zigbang.com/home/oneroom/map?latitude='
					+ encodeURIComponent(lat) + '&longitude='
					+ encodeURIComponent(lng) + '&zoom=3';
			window.open(url, '_blank');
		}

		window.onload = function() {
			var container = document.getElementById('map');
			container.style.width = 'calc(100% - 300px)';
			container.style.height = 'calc(100vh - 80px)';

			var options = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567),
				level : 8
			};

			var map = new kakao.maps.Map(container, options);

			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			var infoDiv = document.getElementById('info');
			kakao.maps.event.addListener(map, 'center_changed', function() {
				var center = map.getCenter();
				infoDiv.innerHTML = '중심 좌표: 위도 ' + center.getLat().toFixed(6)
						+ ', 경도 ' + center.getLng().toFixed(6);
			});

			var clusterer = new kakao.maps.MarkerClusterer({
				map : map,
				averageCenter : true,
				minLevel : 5
			});

			var ps = new kakao.maps.services.Places();

			var infowindow = new kakao.maps.InfoWindow({
				zIndex : 1
			});

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
			                            '<button class="select-btn" onclick="selectLocation(' + place.y + ', ' + place.x + ')">선택</button>';
			            searchResults.appendChild(div);
			        }

			        map.setBounds(bounds);
			    }
			}


			function selectLocation(lat, lng) {
				var moveLatLng = new kakao.maps.LatLng(lat, lng);
				map.setCenter(moveLatLng);
				map.setLevel(3); // 확대 레벨 설정 (1~14, 숫자가 작을수록 더 확대됨)
			}

			function displayMarker(place) {
				var marker = new kakao.maps.Marker({
					map : map,
					position : new kakao.maps.LatLng(place.y, place.x)
				});

				kakao.maps.event.addListener(marker, 'click', function() {
					var address = place.address_name ? place.address_name
							: "주소 정보 없음";
					var addressParts = address.split(' ');
					var shortAddress = addressParts.slice(0, 3).join(' '); // 시/도, 구/군, 동까지만 표시

					var content = '<div style="padding:5px;font-size:12px;">'
							+ '<strong>' + place.place_name + '</strong><br>'
							+ '<small>' + shortAddress + '</small><br>'
							+ '<button onclick="openNaver(' + place.y + ', '
							+ place.x + ')">네이버 부동산</button> '
							+ '<button onclick="openDaum(' + place.y + ', '
							+ place.x + ')">다음 부동산</button> '
							+ '<button onclick="openZigbang(' + place.y + ', '
							+ place.x + ')">직방</button>' + '</div>';
					infowindow.setContent(content);
					infowindow.open(map, marker);
				});
			}

			function searchDestination() {
				var keyword = document.getElementById('destinationSearch').value;
				if (!keyword.trim()) {
					alert('목적지를 입력해주세요!');
					return false;
				}
				ps.keywordSearch(keyword, placesSearchCB);
			}

			kakao.maps.event.addListener(map, 'rightclick',
					function(mouseEvent) {
						var latlng = mouseEvent.latLng;
						var content = '<div class="context-menu">' + '<ul>'
								+ '<li onclick="openNaver(' + latlng.getLat()
								+ ', ' + latlng.getLng() + ')">네이버 부동산보기</li>'
								+ '<li onclick="openDaum(' + latlng.getLat()
								+ ', ' + latlng.getLng() + ')">다음 부동산보기</li>'
								+ '<li onclick="openZigbang(' + latlng.getLat()
								+ ', ' + latlng.getLng() + ')">직방보기</li>'
								+ '</ul>' + '</div>';

						var contextMenu = document
								.getElementById('context-menu');
						contextMenu.innerHTML = content;
						contextMenu.style.display = 'block';
						contextMenu.style.left = mouseEvent.clientX + 'px';
						contextMenu.style.top = mouseEvent.clientY + 'px';
					});

			document.addEventListener('click', function(event) {
				var contextMenu = document.getElementById('context-menu');
				if (contextMenu.style.display === 'block') {
					contextMenu.style.display = 'none';
				}
			});

			window.searchDestination = searchDestination;
			window.openNaver = openNaver;
			window.openDaum = openDaum;
			window.openZigbang = openZigbang;
			window.selectLocation = selectLocation;
		}
	</script>
</body>
</html>