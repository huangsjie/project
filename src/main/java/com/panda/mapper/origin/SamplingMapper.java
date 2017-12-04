package com.panda.mapper.origin;

import com.panda.model.origin.Sampling;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface SamplingMapper extends AbstractMapper<Sampling> {

    /**
     * 获取取样记录
     * @param map
     * @return
     */
    List<Map> selectSamplingDataList(Map map);

}