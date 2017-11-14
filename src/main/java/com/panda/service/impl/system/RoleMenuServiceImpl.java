package com.panda.service.impl.system;

import com.panda.config.DruidConfig;
import com.panda.model.system.Users;
import com.panda.util.ResultStateUtil;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.RoleMenuMapper;
import com.panda.model.system.RoleMenu;
import com.panda.service.system.RoleMenuService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:31
 */
@Service
public class RoleMenuServiceImpl extends AbstractServiceImpl<RoleMenu> implements RoleMenuService {

    private static final Logger logger = LoggerFactory.getLogger(DruidConfig.class);

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

    /**
     * 更新 和 保存角色菜单设置 使用 spring boot 事物
     * @param listMap
     * @return
     */
    @Override
    @Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
    public Integer saveOrUpdateRoleMenu(List<Map> listMap){
        Integer resultStatus = 0;
        try {
            if(listMap != null && listMap.size() > 0){
                Users user= (Users) SecurityUtils.getSubject().getPrincipal();
                RoleMenu roleMenu = new RoleMenu();
                for (Map item : listMap ){
                    String role_id = item.get("role_id").toString(),
                           parent_id = item.get("parent_id").toString(),
                           menu_id = item.get("menu_id").toString(),
                           role_menu_id = item.get("role_menu_id").toString();
                    Integer status = Integer.valueOf(item.get("status").toString());
                    if(status > 0 && !role_menu_id.isEmpty()){
                        //编辑
                        roleMenu.setId(role_menu_id);
                        roleMenu.setStatus(status);
                        roleMenuMapper.updateByPrimaryKey(roleMenu);
                    }else{
                        //添加
                        if(parent_id.equals("0")){
                            roleMenu.setId(UUID.randomUUID().toString());
                            roleMenu.setStatus(status+1);
                            roleMenu.setRoleId(role_id);
                            roleMenu.setMenuId(menu_id);
                            roleMenu.setCreateTime(new Date());
                            roleMenu.setCreateId(user.getId());
                            roleMenuMapper.insertSelective(roleMenu);
                        }else{
                            Map<String,Object> map = new HashMap<>(2);
                            map.put("roleId",role_id);
                            map.put("parentId",parent_id);
                            boolean flag = roleMenuMapper.checkRoleMenuParentMenu(map);
                            if (flag){
                                roleMenu.setId(UUID.randomUUID().toString());
                                roleMenu.setStatus(status+1);
                                roleMenu.setRoleId(role_id);
                                roleMenu.setMenuId(menu_id);
                                roleMenu.setCreateTime(new Date());
                                roleMenu.setCreateId(user.getId());
                                roleMenuMapper.insertSelective(roleMenu);
                            } else {
                                roleMenu.setId(UUID.randomUUID().toString());
                                roleMenu.setStatus(status+1);
                                roleMenu.setRoleId(role_id);
                                roleMenu.setMenuId(parent_id);
                                roleMenu.setCreateTime(new Date());
                                roleMenu.setCreateId(user.getId());
                                int in = roleMenuMapper.insertSelective(roleMenu);
                                if (in > 0){
                                    roleMenu.setId(UUID.randomUUID().toString());
                                    roleMenu.setStatus(status+1);
                                    roleMenu.setRoleId(role_id);
                                    roleMenu.setMenuId(menu_id);
                                    roleMenu.setCreateTime(new Date());
                                    roleMenu.setCreateId(user.getId());
                                    roleMenuMapper.insertSelective(roleMenu);
                                }
                            }
                        }
                    }
                    resultStatus = 200;
                }
            }
        }catch (Exception e){
            /**
             * spring 默认情况下aop只捕获 RuntimeException 的异常时才进行回滚，
             * try catch 时需要手动添加回滚
             */
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            logger.info("RoleMenuServiceImpl------>saveOrUpdateRoleMenu----->"+e.getMessage());
            resultStatus = 101;
        }
        return resultStatus;
    }

    /**
     * 验证角色菜单父级菜单是否有权限
     * @param map
     * @return
     */
    @Override
    public boolean checkRoleMenuParentMenu(Map<String,Object> map){
        return roleMenuMapper.checkRoleMenuParentMenu(map);
    }
}
