package com.panda.controller.system.index;

import com.panda.model.system.Menu;
import com.panda.model.system.Users;
import com.panda.service.system.MenuService;
import com.panda.util.SerializeUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.ui.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.panda.service.system.UsersService;
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
 * Date: 2017/10/31
 * Time: 15:25
 */
@Controller
@RequestMapping(value = "/system/index")
public class IndexController {

    @Autowired
    private JedisPool jedisPool;

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Resource
    private MenuService menuService;

    /**
     * 初始化管理员菜单，存入 Redis
     * @param model
     * @return
     */
    @RequestMapping(value = "/main",method= RequestMethod.GET)
    public String main(Model model){
        Jedis jedis = jedisPool.getResource();
        List<Menu> menuList = null;
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        String cacheMenuList = "manager_menu_list:"+user.getId().toString();
        byte[] byteMenuList = jedis.get(cacheMenuList.getBytes());
        if(byteMenuList != null){
            //缓存有效
            menuList = (ArrayList) SerializeUtil.unserialize(byteMenuList);
        }else{
            //缓存无效
            Map<String,String> map = new HashMap<String,String>(2);
            map.put("userId",user.getId());
            map.put("parentId","10000000-0000-0000-0000-000000000000");
            menuList = menuService.selectManagerRoleMenuList(map);
            jedis.setex(cacheMenuList.getBytes(), 36000,SerializeUtil.serialize(menuList));
        }
        model.addAttribute("menuList",menuList);
        model.addAttribute("user",user);
        return "system/index/main";
    }


    @RequestMapping(value = "/menu",method= RequestMethod.GET)
    @ResponseBody
    public List<Menu> getMenu(){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        Map<String,String> map = new HashMap<String,String>(2);
        map.put("userId",user.getId());
        map.put("parentId","10000000-0000-0000-0000-000000000000");
        List<Menu> menuList = menuService.selectManagerRoleMenuList(map);
        return menuList;
    }


}
