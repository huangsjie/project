package com.panda.mapper.origin;

import com.panda.model.origin.Quality;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface QualityMapper extends AbstractMapper<Quality> {

    /**
     * 获取质检列表
     * @param map
     * @return
     */
    List<Map> selectQualityDataList(Map map);

    /**
     * 获取单条质检记录
     * @param id
     * @return
     */
    Map selectQualityDataMap(String id);
}