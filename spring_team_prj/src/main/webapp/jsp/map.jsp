<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.InputStream" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 지도 API 테스트 - ${district}</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
        }
        #leftTab {
            width: 300px;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            box-sizing: border-box;
            overflow-y: auto;
            z-index: 2;
        }
        #crosshair, #info, #search-container, #result-list, .context-menu {
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
            top: 95%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 5px;
            z-index: 3;
            pointer-events: none; /* 마우스 이벤트가 지도에 전달되도록 함 */
        }
        #search-container {
            position: absolute;
            top: 10px;
            left: 320px;
            background-color: white;
            padding: 5px;
            border-radius: 5px;
        }
        #result-list {
            position: absolute;
            top: 50px;
            left: 320px;
            background-color: white;
            padding: 10px;
            border-radius: 5px;
            max-height: 200px;
            overflow-y: auto;
        }
        .context-menu {
            display: none;
            position: absolute;
            background-color: white;
            border: 1px solid #ccc;
            padding: 5px 0;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
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
    </style>
</head>
<body>
    <div id="leftTab">
        <h2>지역 검색</h2>
        <input type="text" id="districtSearch" placeholder="서울시 자치구 검색">
        <button id="districtSearchButton" onclick="searchDistrict()">검색</button>
        
        <!-- 다른 중요도 선택 옵션들 추가할 부분 -->
    </div>

    <div id="map">
        <div id="crosshair">+</div>
        <div id="info"></div>
        <div id="search-container">
            <input type="text" id="search-input" placeholder="장소 검색">
            <button onclick="searchPlaces()">검색</button>
        </div>
        <div id="result-list"></div>
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
    
    <%
        // API 키 로드
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
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%= apiKey %>&libraries=services,clusterer,drawing"></script>
    <script>
    
    
    //url 이동 함수들이 조금더 안전하게 전달 되도록 encodeURIComponent 사용
// 네이버 부동산 URL 함수
function openNaver(lat, lng) {
    var url = 'https://new.land.naver.com/rooms?ms=' + encodeURIComponent(lat) + ',' + encodeURIComponent(lng) + ',16&a=APT:OPST:ABYG:OBYG:GM:OR:VL:DDDGG:JWJT:SGJT:HOJT&e=RETAIL&aa=SMALLSPCRENT';
    window.open(url, '_blank');
}

//다음 부동산 URL 함수
function openDaum(lat, lng) {
    var url = 'https://realty.daum.net/home/oneroom/map?latitude=' + encodeURIComponent(lat) + '&longitude=' + encodeURIComponent(lng) + '&zoom=3';
    window.open(url, '_blank');
}

// 직방 URL 함수
function openZigbang(lat, lng) {
    var url = 'https://www.zigbang.com/home/oneroom/map?latitude=' + encodeURIComponent(lat) + '&longitude=' + encodeURIComponent(lng) + '&zoom=3';
    window.open(url, '_blank');
}




    // 지도 생성 부분입니다.
    window.onload = function() {
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 서울 시청 좌표
            level: 8
        };

        var map = new kakao.maps.Map(container, options);

        // 줌 컨트롤 추가
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        // 지도 타입 컨트롤 추가
        var mapTypeControl = new kakao.maps.MapTypeControl();
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 현재 중심 좌표 표시
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
        var ps = new kakao.maps.services.Places();

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우 생성
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

        // 키워드 검색 완료 시 호출되는 콜백 함수
        function placesSearchCB (data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                var bounds = new kakao.maps.LatLngBounds();

                for (var i = 0; i < data.length; i++) {
                    displayMarker(data[i]);    
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }       

                map.setBounds(bounds);
            } 
        }

        // 지도에 마커를 표시하는 함수
        function displayMarker(place) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x) 
            });

            // 마커 클릭 이벤트 리스너
            kakao.maps.event.addListener(marker, 'click', function() {
                infowindow.setContent(
                    '<div style="padding:5px;font-size:12px;">' + place.place_name + 
                    '<br><button onclick="openNaver(' + place.y + ', ' + place.x + ')">네이버 부동산</button>' +
                    '<br><button onclick="openDaum(' + place.y + ', ' + place.x + ')">다음 부동산</button>' +
                    '<br><button onclick="openZigbang(' + place.y + ', ' + place.x + ')">직방</button>' +
                    '</div>'
                );
                infowindow.open(map, marker);
            });
        }

        // 장소 검색 함수
        function searchPlaces() {
            var keyword = document.getElementById('search-input').value;

            if (!keyword.trim()) {
                alert('키워드를 입력해주세요!');
                return false;
            }

            ps.keywordSearch(keyword, placesSearchCB); 
        }

        // 좌표 클릭 시 이벤트 리스너
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

        // 클릭하면 컨텍스트 메뉴 닫기
        document.addEventListener('click', function(event) {
            var contextMenu = document.getElementById('context-menu');
            if (contextMenu.style.display === 'block') {
                contextMenu.style.display = 'none';
            }
        });

        // 구 검색 함수
        function searchDistrict() {
            var district = document.getElementById('districtSearch').value;

            if (!district.trim()) {
                alert('구 이름을 입력해주세요!');
                return false;
            }

            var geocoder = new kakao.maps.services.Geocoder();

            geocoder.addressSearch(district, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    map.setCenter(coords);
                } else {
                    alert('검색 결과가 없습니다.');
                }
            }); 
        }

        // 전역 함수 등록
        window.searchPlaces = searchPlaces;
        window.searchDistrict = searchDistrict;
        window.openNaver = openNaver;
        window.openDaum = openDaum;
        window.openZigbang = openZigbang;
    }
    </script>
</body>
</html>
