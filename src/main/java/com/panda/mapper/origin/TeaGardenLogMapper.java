package com.panda.mapper.origin;

import com.panda.model.origin.TeaGardenLog;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface TeaGardenLogMapper extends AbstractMapper<TeaGardenLog> {
    /**
     * 获取茶园管理信息
     * @param map
     * @return
     */
    List<TeaGardenLog> selectTeaGardenLogList(Map map);
}