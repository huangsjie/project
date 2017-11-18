package com.panda.mapper.system;

import com.panda.model.system.Menu;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface MenuMapper extends AbstractMapper<Menu> {

    /**
     * 获取所有菜单
     * @return
     */
    List<Menu>selectAll();

    /**
     * 获取当前角色授权菜单 一维数组-供下拉列表使用
     * @param map
     * @return
     */
    List<Menu>selectManagerAuthMenu(Map<String,String> map);

    /**
     * 获取当前管理员所拥有的菜单列表 三维数组 -- 供 left_aside 模板使用
     * @param map
     * @return
     */
    List<Menu> selectManagerRoleMenuList(Map<String,String> map);
}