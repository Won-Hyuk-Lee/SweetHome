package com.sweetHome.svc;

import com.sweetHome.vo.DistrictVO;
import java.util.List;

public interface DataFetchService {
    List<DistrictVO> getAllDistrictsFromDB();
    DistrictVO getDistrictFromDB(String districtCode);
    // String getDataFromAPI(String apiUrl);  // 필요할 때 주석 해제하여 사용
}