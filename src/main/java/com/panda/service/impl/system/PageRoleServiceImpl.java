package com.panda.service.impl.system;

import com.panda.model.system.Dictionary;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.PageRoleMapper;
import com.panda.model.system.PageRole;
import com.panda.service.system.PageRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:29
 */
@Service
public class PageRoleServiceImpl extends AbstractServiceImpl<PageRole> implements PageRoleService {

    @Resource
    private PageRoleMapper pageRoleMapper;

    @Override
    protected AbstractMapper<PageRole> getAbstractMapper() {
        return pageRoleMapper;
    }

    /**
     * 获取角色对应的菜单 操作权限
     * @param map
     * @return
     */
    @Override
    public Map<String,Object> selectPageRoleListByDictionary(Map<String,Object> map){
        return pageRoleMapper.selectPageRoleListByDictionary(map);
    }
}
