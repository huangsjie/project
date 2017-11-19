package com.panda.service.system;

import com.panda.model.system.Dictionary;
import com.panda.util.abs.AbstractService;
import com.panda.model.system.PageRole;

import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:28
 */
public interface PageRoleService extends AbstractService<PageRole> {

    /**
     * 获取角色对应的菜单 操作权限
     * @param map
     * @return
     */
    Map<String,Object> selectPageRoleListByDictionary(Map<String,Object> map);
}
