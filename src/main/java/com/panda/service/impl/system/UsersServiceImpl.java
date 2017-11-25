package com.panda.service.impl.system;

import com.panda.model.system.Menu;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * 获取当前登录用户可访问的URL 和 菜单 将数据存入 redis
     * @param account
     * @return
     */
    @Override
    public Users selectManagerAccount(String account) {
        Users user = usersMapper.selectManagerAccount(account);
        try {
            if(user != null && user.getRoleId() != null){
                Map<String,String> map = new HashMap<String,String>(3);
                map.put("roleId",user.getRoleId());
                map.put("status","1");
                //授权的URL
                //user.setAuthMenuList(menuService.selectManagerAuthMenu(map));
                //菜单List
                map.put("parentId","10000000-0000-0000-0000-100000000000");
                user.setMenuList(menuService.selectManagerRoleMenuList(map));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    /**
     * 查询用户信息和用户扩展信息
     * @param id
     * @return
     */
    @Override
    public Map selectUserAndUserInfo(String id){
        return usersMapper.selectUserAndUserInfo(id);
    }
}
