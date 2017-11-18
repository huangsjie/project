package com.panda.shiro;

import com.panda.controller.system.index.LoginController;
import com.panda.model.system.Menu;
import com.panda.model.system.Users;
import com.panda.service.system.MenuService;
import com.panda.service.system.UsersService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yangqj on 2017/4/21.
 */
public class MyShiroRealm extends AuthorizingRealm {

    @Resource
    private UsersService usersService;

    @Resource
    private MenuService menuService;

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Users user= (Users)principalCollection.getPrimaryPrincipal();
        //Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("userid",user.getId());
        logger.info("---------->----------->URL授权------> doGetAuthorizationInfo !");
        List<Menu> menuList = user.getAuthMenuList();
//        if(menuList == null){
//            menuList = menuService.selectManagerAuthMenu(user.getRoleId());
//        }

        info.addRole(user.getRoleId());
        for(Menu menu: menuList){
            info.addStringPermission("index,add");
            //info.addObjectPermission();
        }
        return info;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //获取用户的输入的账号.
        String username = (String)token.getPrincipal();
        Users user = usersService.selectManagerAccount(username);
        if(user==null){
            throw new UnknownAccountException();
        }
        if (0==user.getStatus()) {
            throw new LockedAccountException();
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user,
                user.getPassword(),
                ByteSource.Util.bytes(user.getAccount()+user.getId()),
                getName()
        );
        // 当验证都通过后，把用户信息放在session里
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("userSession", user);
        session.setAttribute("userSessionId", user.getId());
        return authenticationInfo;
    }

    /**
     * 指定principalCollection 清除
     */
  /*  public void clearCachedAuthorizationInfo(PrincipalCollection principalCollection) {

        SimplePrincipalCollection principals = new SimplePrincipalCollection(
                principalCollection, getName());
        super.clearCachedAuthorizationInfo(principals);
    }
*/
}
