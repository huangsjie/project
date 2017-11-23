package com.panda.service.impl.system;

import com.panda.config.DruidConfig;
import com.panda.model.system.Users;
import com.panda.service.system.PageRoleService;
import com.panda.util.SerializeUtil;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.MenuMapper;
import com.panda.model.system.Menu;
import com.panda.service.system.MenuService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:27
 */
@Service
public class MenuServiceImpl extends AbstractServiceImpl<Menu> implements MenuService {

    private static final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);

    @Resource
    private MenuMapper menuMapper;

    @Autowired
    private JedisPool jedisPool;

    @Value("${panda.cache.second}")
    private int second;

    @Resource
    private PageRoleService pageRoleService;

    @Override
    protected AbstractMapper<Menu> getAbstractMapper() {
        return menuMapper;
    }

    /**
     * 获取当前角色授权菜单 一维数组-供下拉列表使用
     * @param map
     * @return
     */
    @Override
    public List<Menu>selectManagerAuthMenu(Map<String,String> map){
        return menuMapper.selectManagerAuthMenu(map);
    }

    /**
     * 获取当前管理员所拥有的菜单列表 嵌套数组 -- 供 left_aside 模板使用
     * @param map
     * @return
     */
    @Override
    public List<Menu> selectManagerRoleMenuList(Map<String,String> map){
       // Jedis jedis = jedisPool.getResource();
        List<Menu> menuList = null;
        try {
//            String cacheMenuList = "manager_menu_list:"+map.get("userId");
//            byte[] byteMenuList = jedis.get(cacheMenuList.getBytes());
//            if(byteMenuList != null){
                //缓存有效
//                logger.info("------->"+cacheMenuList+" 获取缓存中的 menuList !");
//                menuList = (ArrayList) SerializeUtil.unserialize(byteMenuList);
//            }else{
                //缓存无效
                menuList = menuMapper.selectManagerRoleMenuList(map);
                if(menuList != null && menuList.size() > 0){
                    for (Menu menu: menuList) {
                        map.put("parentId",menu.getId());
                        if (menu.getUrl() != null){
                            userMenuRolePermission(menu,map);
                        }
                        List<Menu> childList = menuMapper.selectManagerRoleMenuList(map);
                        if(childList != null && childList.size() > 0){
                            for(Menu child: childList){
                                map.put("parentId",child.getId());
                                if (menu.getUrl() != null){
                                    userMenuRolePermission(child,map);
                                }
                                List<Menu> lastChild = menuMapper.selectManagerRoleMenuList(map);
                                if(lastChild != null && lastChild.size() > 0){
                                    for (Menu item : lastChild){
                                        if (item.getUrl() != null){
                                            userMenuRolePermission(item,map);
                                        }
                                    }
                                    child.setChildMenuList(lastChild);
                                }
                            }
                            menu.setChildMenuList(childList);
                        }
                    }
                   // logger.info("------->"+cacheMenuList+" 创建 menuList 缓存数据 !");
                   // jedis.setex(cacheMenuList.getBytes(), second ,SerializeUtil.serialize(menuList));
                }
           // }
        }catch (Exception e){
            e.printStackTrace();
            logger.info("------->selectManagerRoleMenuList"+e.getMessage());
        }
        return menuList;
    }


    /**
     * 根据菜单 ID 获取 当前菜单和子菜单 shiro config init
     * @param menuId
     * @return
     */
    @Override
    public List<Menu> selectMenuAndChildMenu(String menuId){
        return menuMapper.selectMenuAndChildMenu(menuId);
    }

    /**
     * 追加 菜单权限
     * @param menu
     * @param map
     * @return
     */
    private Object userMenuRolePermission(Menu menu,Map map){
        map.put("menuId",menu.getId());
        String[] urlArr = menu.getUrl().split("/");
        List<Map> permList = pageRoleService.selectUserMenuRolePermission(map);
        if (permList != null && permList.size() > 0){
            ArrayList per = new ArrayList();
            for (Map item : permList){
                per.add(urlArr[2]+":"+item.get("value"));
            }
            menu.setPermissionList(per);
        }else{
            menu.setPermissionList(null);
        }
        return menu;
    }
}
