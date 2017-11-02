package com.panda.service.impl.system;

import com.panda.service.system.MenuService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.UsersMapper;
import com.panda.model.system.Users;
import com.panda.service.system.RoleMenuService;
import com.panda.service.system.RolesService;
import com.panda.service.system.UsersService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/18
 * Time: 17:53
 */
@Service
public class UsersServiceImpl extends AbstractServiceImpl<Users> implements UsersService{

    @Resource
    private UsersMapper usersMapper;

    @Resource
    private MenuService menuService;

    @Override
    protected AbstractMapper<Users> getAbstractMapper() {
        return usersMapper;
    }

    @Override
    public Users selectManagerAccount(String account) {
        Users user = usersMapper.selectManagerAccount(account);
        try {
            if(user != null && user.getRoleId() != null){
                user.setMenuList(menuService.selectManagerAuthMenu(user.getRoleId()));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
