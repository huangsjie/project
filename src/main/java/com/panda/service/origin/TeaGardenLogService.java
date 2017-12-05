package com.panda.service.origin;

import com.panda.model.origin.TeaGardenLog;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface TeaGardenLogService extends AbstractService<TeaGardenLog> {
    /**
     * 获取茶园管理信息
     * @param map
     * @return
     */
    List<TeaGardenLog> selectTeaGardenLogList(Map map);

   //
    Map  selectByPrimaryKey1(String id);
}
