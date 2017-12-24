package com.panda.mapper.origin;

import com.panda.model.origin.AssemblySet;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface AssemblySetMapper extends AbstractMapper<AssemblySet>{

    /**
     * 获取生产线信息
     * @param map
     * @return
     */
    List<Map> selectAssemblySetDataList(Map map);
}