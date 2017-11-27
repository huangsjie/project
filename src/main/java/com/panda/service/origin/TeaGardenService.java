package com.panda.service.origin;

import com.panda.model.origin.TeaGarden;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface TeaGardenService extends AbstractService<TeaGarden> {
    /**
     * 获取茶园信息列表
     * @param map
     * @return
     */
    List<Map> selectTeaGardenList(Map map);
}
