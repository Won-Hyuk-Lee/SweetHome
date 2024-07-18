package com.sweetHome.mapper;

import org.apache.ibatis.annotations.Param;
import java.util.Map;

public interface ExternalDataMapper {
    void updateStoredData(@Param("district") String district, @Param("data") Map<String, Object> data);
    Map<String, Object> getStoredData(@Param("district") String district);
}