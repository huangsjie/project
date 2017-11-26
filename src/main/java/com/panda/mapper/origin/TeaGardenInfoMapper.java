package com.panda.mapper.origin;

import com.panda.model.origin.TeaGardenInfo;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface TeaGardenInfoMapper extends AbstractMapper<TeaGardenInfo> {

    /**
     * 获取茶园信息列表
     * @param map
     * @return
     */
    List<TeaGardenInfo> selectTeaGardenList(Map map);

}