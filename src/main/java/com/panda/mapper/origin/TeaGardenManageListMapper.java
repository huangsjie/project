package com.panda.mapper.origin;

import com.panda.model.origin.TeaGardenManageList;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface TeaGardenManageListMapper extends AbstractMapper<TeaGardenManageList>{

    /**
     * 获取茶园管理信息
     * @param map
     * @return
     */
    List<TeaGardenManageList> selectTeaGardenManageList(Map map);

}