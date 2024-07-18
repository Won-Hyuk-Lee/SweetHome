package com.sweetHome.svc;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ExternalDataServiceImpl implements ExternalDataService {

    // 카카오 API 키를 저장할 변수
    private String kakaoApiKey;
    
    // JSON 데이터를 파싱하기 위한 ObjectMapper 객체
    private final ObjectMapper objectMapper = new ObjectMapper();

    // 서비스 초기화 시 실행되는 메소드
    @PostConstruct
    public void init() {
        Properties prop = new Properties();
        String propFileName = "api/kakaoDeveloperJavaScriptAPI.properties";
        
        try {
            // 클래스 로더를 사용하여 프로퍼티 파일 로드
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
            if (inputStream != null) {
                prop.load(inputStream);
                // 프로퍼티 파일에서 API 키 읽기
                kakaoApiKey = prop.getProperty("kakao.map.api.key");
                inputStream.close();
                
                // API 키가 없거나 비어있으면 예외 발생
                if (kakaoApiKey == null || kakaoApiKey.isEmpty()) {
                    throw new IllegalStateException("API 키가 설정되지 않았습니다.");
                }
            } else {
                throw new IllegalStateException("설정 파일 '" + propFileName + "'을 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            throw new IllegalStateException("설정 파일을 로드하는 중 오류가 발생했습니다: " + e.getMessage(), e);
        }
    }

    // 모든 구의 데이터를 가져오는 메소드
    @Override
    public List<Map<String, Object>> getDistrictsData() {
        List<Map<String, Object>> districts = new ArrayList<Map<String, Object>>();
        
        // 서울시 구 데이터 추가 (예시)
        districts.add(createDistrict("강남구", 37.5172, 127.0473));
        districts.add(createDistrict("서초구", 37.4837, 127.0324));
        // 여기에 더 많은 구 데이터를 추가할 수 있습니다.

        return districts;
    }

    // 개별 구의 데이터를 생성하는 메소드
    private Map<String, Object> createDistrict(String name, double latitude, double longitude) {
        Map<String, Object> district = new HashMap<String, Object>();
        district.put("name", name);
        district.put("latitude", latitude);
        district.put("longitude", longitude);
        
        // 대중교통 정보 가져와서 추가
        Map<String, Object> transitInfo = getTransitInfo(latitude, longitude);
        district.putAll(transitInfo);

        return district;
    }

    // 카카오 API를 사용하여 대중교통 정보를 가져오는 메소드
    private Map<String, Object> getTransitInfo(double latitude, double longitude) {
        // 카카오 로컬 API URL 생성
        String url = String.format(
            "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=SW8&x=%f&y=%f&radius=20000",
            longitude, latitude
        );

        CloseableHttpClient client = null;
        try {
            // HTTP 클라이언트 생성
            client = HttpClients.createDefault();
            HttpGet request = new HttpGet(url);
            // 요청 헤더에 API 키 추가
            request.addHeader("Authorization", "KakaoAK " + kakaoApiKey);

            // API 요청 실행 및 응답 받기
            String jsonResponse = EntityUtils.toString(client.execute(request).getEntity());

            // JSON 응답 파싱
            @SuppressWarnings("unchecked")
            Map<String, Object> response = objectMapper.readValue(jsonResponse, Map.class);
            @SuppressWarnings("unchecked")
            List<Map<String, Object>> documents = (List<Map<String, Object>>) response.get("documents");

            // 대중교통 점수 계산
            int publicTransportScore = calculatePublicTransportScore(documents);

            // 결과 맵 생성 및 반환
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("publicTransport", publicTransportScore);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyMap();
        } finally {
            // HTTP 클라이언트 종료
            if (client != null) {
                try {
                    client.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // 대중교통 점수를 계산하는 메소드
    private int calculatePublicTransportScore(List<Map<String, Object>> stations) {
        // 간단한 점수 계산 로직 (예시)
        // 지하철역 수를 기준으로 1~5점 부여
        int score = Math.min(stations.size(), 5);  // 최대 5점
        return score;
    }
}