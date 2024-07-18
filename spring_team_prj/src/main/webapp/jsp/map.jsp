<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.InputStream"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>지도 서비스</title>
    
    <!-- 외부 CSS 파일 링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link type="text/css" href="../resources/spaces/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link type="text/css" href="../resources/spaces/vendor/leaflet/dist/leaflet.css" rel="stylesheet">
    <link rel="stylesheet" href="../resources/spaces/vendor/@fancyapps/fancybox/dist/jquery.fancybox.min.css">
    <link rel="stylesheet" href="../resources/spaces/vendor/jqvmap/dist/jqvmap.min.css">
    <link type="text/css" href="../resources/spaces/css/spaces.css" rel="stylesheet">

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
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
            border: 1px solid #ccc;
        }
        
        /* 지도 컨테이너 스타일 */
        #map {
            width: calc(100% - 300px);
            height: calc(100% - 80px);
            position: absolute;
            top: 80px;
            left: 300px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <!-- 구글 태그 매니저 (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-THQTXJ7"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>

    <!-- 네비게이션 바 스타일 -->
    <style>
        .bg-primary {
            background-color: yellowgreen !important;
        }

        .btn-primary {
            color: #fff;
            background-color: yellowgreen;
            border-color: black;
            box-shadow: 0 0 24px rgba(154, 205, 50, .04), 0 44px 74px rgba(154, 205, 50, .06);
        }
    </style>

    <!-- 헤더 및 네비게이션 바 -->
    <header class="header-global">
        <nav id="navbar-main" class="navbar navbar-main navbar-theme-primary navbar-expand-lg headroom py-lg-3 px-lg-6 navbar-dark navbar-transparent navbar-theme-primary">
            <!-- 네비게이션 바 내용 -->
        </nav>
    </header>
    <!-- 메인 콘텐츠 -->
    <main>
        <div id="leftTab">
            <h3>목적지 입력</h3>
            <input type="text" id="destinationInput" placeholder="목적지를 입력하세요">
            <button onclick="searchDestination()">검색</button>
            <div id="searchResults"></div>

            <h3>선호도 입력</h3>
            <div class="preference-item">
                <label for="distance">거리:</label>
                <select id="distance">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="preference-item">
                <label for="publicTransport">대중교통 편리도:</label>
                <select id="publicTransport">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="preference-item">
                <label for="population">인구:</label>
                <select id="population">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="preference-item">
                <label for="security">치안:</label>
                <select id="security">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>

            <button onclick="getRecommendations()">추천 서비스</button>
        </div>
        
        <div id="map"></div>
    </main>
    <!-- 스크립트 파일 로드 -->
    <script src="../resources/spaces/vendor/jquery/dist/jquery.min.js"></script>
    <!-- 기타 스크립트 파일들 ... -->

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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=apiKey%>&libraries=services,clusterer,drawing"></script>

    <script>
        var map;
        var marker;
        var infowindow;

        // 페이지 로드 시 지도 초기화
        window.onload = function() {
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),
                level: 3
            };
            map = new kakao.maps.Map(container, options);
        };

        // 목적지 검색 함수
        function searchDestination() {
            var destination = document.getElementById('destinationInput').value;
            var geocoder = new kakao.maps.services.Geocoder();
            
            geocoder.addressSearch(destination, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var searchResults = document.getElementById('searchResults');
                    searchResults.innerHTML = '';
                    
                    result.forEach(function(item, index) {
                        var div = document.createElement('div');
                        div.innerHTML = item.address_name;
                        div.style.cursor = 'pointer';
                        div.style.padding = '5px';
                        div.style.borderBottom = '1px solid #ccc';
                        div.onclick = function() {
                            selectDestination(item);
                        };
                        searchResults.appendChild(div);
                    });
                } else {
                    alert('검색 결과가 없습니다.');
                }
            });
        }

        // 목적지 선택 함수
        function selectDestination(item) {
            var coords = new kakao.maps.LatLng(item.y, item.x);
            map.setCenter(coords);
            
            if (marker) {
                marker.setMap(null);
            }
            if (infowindow) {
                infowindow.close();
            }
            
            marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            
            infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + item.address_name + '</div>'
            });
            infowindow.open(map, marker);

            document.getElementById('searchResults').innerHTML = '';
            document.getElementById('destinationInput').value = item.address_name;
        }

        // 추천 서비스 요청 함수
        function getRecommendations() {
            var destination = document.getElementById('destinationInput').value;
            if (!destination) {
                alert('목적지를 먼저 선택해주세요.');
                return;
            }

            var preferences = {
                distance: document.getElementById('distance').value,
                publicTransport: document.getElementById('publicTransport').value,
                population: document.getElementById('population').value,
                security: document.getElementById('security').value
            };

            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(destination, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var lat = result[0].y;
                    var lng = result[0].x;
                    sendToRecommendationService(lat, lng, preferences);
                } else {
                    alert('목적지의 좌표를 가져오는 데 실패했습니다.');
                }
            });
        }

        // 추천 서비스에 데이터 전송 함수
        function sendToRecommendationService(lat, lng, preferences) {
            var data = {
                latitude: lat,
                longitude: lng,
                preferences: preferences
            };

            fetch('/recommendations/get', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(data => {
                console.log('추천 결과:', data);
                displayRecommendations(data);
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('추천 서비스 요청 중 오류가 발생했습니다.');
            });
        }

        // 추천 결과 표시 함수
        function displayRecommendations(recommendations) {
            // 기존 마커 제거
            if (marker) {
                marker.setMap(null);
            }
            
            recommendations.forEach((rec, index) => {
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(rec.latitude, rec.longitude),
                    title: rec.name
                });

                var infowindow = new kakao.maps.InfoWindow({
                    content: `<div style="padding:5px;">${rec.name}<br>순위: ${index + 1}</div>`
                });

                kakao.maps.event.addListener(marker, 'click', function() {
                    infowindow.open(map, marker);
                });
            });

            // 지도 범위 재설정
            var bounds = new kakao.maps.LatLngBounds();
            recommendations.forEach(rec => {
                bounds.extend(new kakao.maps.LatLng(rec.latitude, rec.longitude));
            });
            map.setBounds(bounds);
        }
    </script>
</body>
</html>
