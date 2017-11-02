package com.panda.service.impl.system;

import com.panda.config.DruidConfig;
import com.panda.model.system.Users;
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

    private static final Logger logger = LoggerFactory.getLogger(DruidConfig.class);

    @Resource
    private MenuMapper menuMapper;

    @Autowired
    private JedisPool jedisPool;

    @Value("${panda.cache.second}")
    private int second;

    @Override
    protected AbstractMapper<Menu> getAbstractMapper() {
        return menuMapper;
    }

    /**
     * 获取所有菜单
     * @return
     */
    @Override
    public List<Menu> selectAll(){
        logger.info("---------->----------->获取所有菜单 selectAll !");
        return menuMapper.selectAll();
    }

    /**
     * 获取当前角色授权菜单 存到 Redis 中
     * @param roleId
     * @return
     */
    @Override
    public List<Menu>selectManagerAuthMenu(String roleId){
        Jedis jedis = jedisPool.getResource();
        List<Menu> menuList = null;
        try {
            String cacheMenuList = "role_auth_menu_list:"+roleId;
            byte[] byteMenuList = jedis.get(cacheMenuList.getBytes());
            if(byteMenuList != null){
                //缓存有效
                logger.info("------->"+cacheMenuList+" 获取缓存中的 menuList !");
                menuList = (ArrayList) SerializeUtil.unserialize(byteMenuList);
            }else {
                menuList = menuMapper.selectManagerAuthMenu(roleId);
                logger.info("------->"+cacheMenuList+" 创建 menuList 缓存数据 !");
                jedis.setex(cacheMenuList.getBytes(), second ,SerializeUtil.serialize(menuList));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return menuList;
    }

    /**
     * 获取当前管理员所拥有的菜单列表
     * @param map
     * @return
     */
    @Override
    public List<Menu> selectManagerRoleMenuList(Map<String,String> map){
        Jedis jedis = jedisPool.getResource();
        List<Menu> menuList = null;
        try {
            String cacheMenuList = "manager_menu_list:"+map.get("userId");
            byte[] byteMenuList = jedis.get(cacheMenuList.getBytes());
            if(byteMenuList != null){
                //缓存有效
                logger.info("------->"+cacheMenuList+" 获取缓存中的 menuList !");
                menuList = (ArrayList) SerializeUtil.unserialize(byteMenuList);
            }else{
                //缓存无效
                menuList = menuMapper.selectManagerRoleMenuList(map);
                if(menuList != null && menuList.size() > 0){
                    for (Menu menu: menuList) {
                        map.remove("parentId");
                        map.put("parentId",menu.getId());
                        List<Menu> chilList = menuMapper.selectManagerRoleMenuList(map);
                        if(chilList != null && chilList.size() > 0){
                            menu.setUrl(null);
                            menu.setChildMenuList(chilList);
                        }
                    }
                    logger.info("------->"+cacheMenuList+" 创建 menuList 缓存数据 !");
                    jedis.setex(cacheMenuList.getBytes(), second ,SerializeUtil.serialize(menuList));
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.info("------->selectManagerRoleMenuList"+e.getMessage());
        }
        return menuList;
    }
}
