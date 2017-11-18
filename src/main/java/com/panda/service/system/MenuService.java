package com.panda.service.system;

import com.panda.util.abs.AbstractService;
import com.panda.model.system.Menu;

import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:26
 */
public interface MenuService extends AbstractService<Menu>{

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
