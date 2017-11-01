package com.panda.mapper.system;

import com.panda.model.system.Menu;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface MenuMapper extends AbstractMapper<Menu> {

    /**
     * 获取当前管理员所拥有的菜单列表
     * @param map
     * @return
     */
    List<Menu> selectManagerRoleMenuList(Map<String,String> map);
}