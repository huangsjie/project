package com.panda.service.origin;

import com.panda.model.origin.TeaGardenInfo;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface TeaGardenInfoService extends AbstractService<TeaGardenInfo> {
    /**
     * 获取茶园信息列表
     * @param map
     * @return
     */
    List<TeaGardenInfo> selectTeaGardenList(Map map);
}
