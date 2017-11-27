package com.panda.mapper.origin;

import com.panda.model.origin.TeaGarden;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface TeaGardenMapper extends AbstractMapper<TeaGarden> {
    /**
     * 获取茶园信息列表
     * @param map
     * @return
     */
    List<Map> selectTeaGardenList(Map map);

}