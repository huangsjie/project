package com.panda.service.impl.system;

import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.RoleMenuMapper;
import com.panda.model.system.RoleMenu;
import com.panda.service.system.RoleMenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:31
 */
@Service
public class RoleMenuServiceImpl extends AbstractServiceImpl<RoleMenu> implements RoleMenuService {

    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Override
    protected AbstractMapper<RoleMenu> getAbstractMapper() {
        return roleMenuMapper;
    }

    /**
     * 编辑 角色菜单 获取当前选中角色的 可用menu
     * @param roleId
     * @return
     */
    @Override
    public List<Map> selectRoleMenuList(String roleId) {
        return roleMenuMapper.selectRoleMenuList(roleId);
    }
}
