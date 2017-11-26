package com.panda.service.origin;

import com.panda.model.origin.TeaGardenManageList;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface TeaGardenManageListService extends AbstractService<TeaGardenManageList> {
    /**
     * 获取茶园管理信息
     * @param map
     * @return
     */
    List<TeaGardenManageList> selectTeaGardenManageList(Map map);
}
