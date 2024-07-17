<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>서울시 자치구 선택</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h2>서울시 자치구를 선택하세요</h2>
    <form id="districtForm" action="${pageContext.request.contextPath}/map/view" method="GET">
        <select id="districtSelect" name="district">
            <option value="">선택하세요</option>
            <option value="강남구">강남구</option>
            <option value="강동구">강동구</option>
            <option value="강북구">강북구</option>
            <option value="강서구">강서구</option>
            <option value="관악구">관악구</option>
            <option value="광진구">광진구</option>
            <option value="구로구">구로구</option>
            <option value="금천구">금천구</option>
            <option value="노원구">노원구</option>
            <option value="도봉구">도봉구</option>
            <option value="동대문구">동대문구</option>
            <option value="동작구">동작구</option>
            <option value="마포구">마포구</option>
            <option value="서대문구">서대문구</option>
            <option value="서초구">서초구</option>
            <option value="성동구">성동구</option>
            <option value="성북구">성북구</option>
            <option value="송파구">송파구</option>
            <option value="양천구">양천구</option>
            <option value="영등포구">영등포구</option>
            <option value="용산구">용산구</option>
            <option value="은평구">은평구</option>
            <option value="종로구">종로구</option>
            <option value="중구">중구</option>
            <option value="중랑구">중랑구</option>
        </select>
        <button type="submit" id="searchButton">검색</button>
    </form>

    <h2>목적지를 입력하세요</h2>
    <form id="destinationForm" action="${pageContext.request.contextPath}/map/view" method="GET">
        <input type="text" id="destination" name="destination" placeholder="목적지 입력">
        <button type="submit">검색</button>
    </form>

    <script>
        $(document).ready(function() {
            $("#districtForm").on('submit', function(e) {
                e.preventDefault();
                var selectedDistrict = $("#districtSelect").val();
                if (selectedDistrict) {
                    this.submit();
                } else {
                    alert("자치구를 선택해주세요.");
                }
            });
        });
    </script>
</body>
</html>