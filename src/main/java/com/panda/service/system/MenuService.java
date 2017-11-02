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
     * 获取所有菜单
     * @return
     */
    List<Menu> selectAll();

    /**
     * 获取当前角色授权菜单
     * @param roleId
     * @return
     */
    List<Menu>selectManagerAuthMenu(String roleId);

    /**
     * 获取当前管理员所拥有的菜单列表
     * @param map
     * @return
     */
    List<Menu> selectManagerRoleMenuList(Map<String,String> map);
}
