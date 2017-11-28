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

    /**
     * 查询茶园名称和ID 茶园日志使用
     * @param map
     * @return
     */
    List<Map> selectTeaGardenNameAndId(Map map);
}
