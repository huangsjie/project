package com.panda.service.impl.system;

import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.PageRoleMapper;
import com.panda.model.system.PageRole;
import com.panda.service.system.PageRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
}
