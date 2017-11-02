package com.panda.controller.system;

import com.panda.controller.system.index.IndexController;
import com.panda.model.system.Menu;
import com.panda.model.system.Users;
import com.panda.service.system.MenuService;
import com.panda.util.SerializeUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/2
 * Time: 16:58
 */
@Controller
public class RedisController {

//    @Autowired
//    private JedisPool jedisPool;
//
//    @Resource
//    private MenuService menuService;
//
//    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
//
//    @RequestMapping("/getCacheMenuList")
//    public List<Menu> getCacheMenuList(Users user){
//        Jedis jedis = jedisPool.getResource();
//        List<Menu> menuList = null;
//        String cacheMenuList = "manager_menu_list:"+user.getId().toString();
//        byte[] byteMenuList = jedis.get(cacheMenuList.getBytes());
//        if(byteMenuList != null){
//            //缓存有效
//            menuList = (ArrayList) SerializeUtil.unserialize(byteMenuList);
//        }else{
//            //缓存无效
//            Map<String,String> map = new HashMap<String,String>(2);
//            map.put("userId",user.getId());
//            map.put("parentId","10000000-0000-0000-0000-000000000000");
//            menuList = menuService.selectManagerRoleMenuList(map);
//            jedis.setex(cacheMenuList.getBytes(), 36000,SerializeUtil.serialize(menuList));
//        }
//        return menuList;
//    }
}
