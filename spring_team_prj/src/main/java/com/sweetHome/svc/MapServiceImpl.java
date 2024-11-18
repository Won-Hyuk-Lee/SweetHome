package com.sweetHome.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweetHome.mapper.MapMapper;

/**
 * 지도 관련 서비스 구현 클래스
 * 
 * 이 클래스는 MapService 인터페이스를 구현하여 실제 지도 관련 비즈니스 로직을 제공합니다.
 */
@Service
public class MapServiceImpl implements MapService {

    /**
     * 지도 관련 데이터베이스 작업을 위한 매퍼
     */
    @Autowired
    private MapMapper mapMapper;

    /**
     * 특정 자치구의 정보를 조회합니다.
     * 
     * @param district 정보를 조회할 자치구 이름
     * @return 자치구 정보 (문자열 형태)
     */
    @Override
    public String getDistrictInfo(String district) {
        return mapMapper.selectDistrictInfo(district);
    }
}