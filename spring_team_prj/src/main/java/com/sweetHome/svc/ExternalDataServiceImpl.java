package com.sweetHome.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class ExternalDataServiceImpl implements ExternalDataService {

    // 실제 구현에서는 DB 또는 외부 API를 사용해야 합니다.
    @Override
    public List<Map<String, Object>> getDistrictsData() {
        List<Map<String, Object>> districts = new ArrayList<>();
        
        // 예시 데이터
        Map<String, Object> district1 = new HashMap<>();
        district1.put("name", "강남구");
        district1.put("latitude", 37.5172);
        district1.put("longitude", 127.0473);
        district1.put("publicTransport", 5);
        district1.put("population", 3);
        district1.put("security", 4);
        districts.add(district1);

        // 다른 구들도 비슷하게 추가...

        return districts;
    }
}