package com.panda.mapper.system;

import com.panda.model.system.Dictionary;
import com.panda.model.system.PageRole;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface PageRoleMapper extends AbstractMapper<PageRole> {

    /**
     * 获取角色对应的菜单 操作权限
     * @param map
     * @return
     */
    Map<String,Object> selectPageRoleListByDictionary(Map<String,Object> map);
}