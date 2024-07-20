package com.sweetHome.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;
import java.util.List;

@Service
public class DataFetchServiceImpl implements DataFetchService {
    
    @Autowired
    private RecommendMapper recommendMapper;

    @Override
    public List<DistrictVO> getAllDistrictsFromDB() {
        // MyBatis mapper를 사용하여 DB에서 모든 자치구 데이터 가져오기
        return recommendMapper.getAllDistricts();
    }

    @Override
    public DistrictVO getDistrictFromDB(String districtCode) {
        // MyBatis mapper를 사용하여 DB에서 특정 자치구 데이터 가져오기
        return recommendMapper.getDistrictByCode(districtCode);
    }

    // API 호출 메서드는 주석 처리합니다. 필요할 때 구현할 수 있습니다.
    /*
    @Override
    public String getDataFromAPI(String apiUrl) {
        // RestTemplate 또는 다른 HTTP 클라이언트를 사용하여 API 호출
        // 결과 반환
        // 주의: 실제 구현 시 적절한 HTTP 클라이언트 라이브러리를 사용해야 합니다.
        return "API 호출 결과: " + apiUrl + "에서 가져온 데이터";
    }
    */
}