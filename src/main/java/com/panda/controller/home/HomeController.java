package com.panda.controller.home;

import com.panda.config.DruidConfig;
import com.panda.model.system.Users;
import com.panda.service.system.*;
import com.panda.util.ResultMsgUtil;
import com.panda.util.ResultStateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
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
public class HomeController {

    private Logger logger = LoggerFactory.getLogger(DruidConfig.class);
    // logger.info("jedisPool uuid : " + user.getId());
    // try (Jedis jedis = jedisPool.getResource()) {
    //jedis.set("f9222c95-cf5a-4036-8ad9-ecface0aaf83".getBytes(), SerializeUtil.serialize(user));
    // jedis.get("f9222c95-cf5a-4036-8ad9-ecface0aaf83");
    //byte[] reduser = jedis.get("f9222c95-cf5a-4036-8ad9-000000000000".getBytes());
    // return (ArrayList) SerializeUtil.unserialize(reduser);
    // }
    @Autowired
    private JedisPool jedisPool;

    @Resource
    private UsersService usersService;

    @Resource
    private RolesService rolesService;

    @Resource
    private RoleMenuService roleMenuService;

    @Resource
    private PageRoleService pageRoleService;

    @Resource
    private DictionaryService dictionaryService;

    private static boolean message = false;
    private static Object  data    = null;

    @RequestMapping({"/","/thy"})
    public String thymeleaf(){

        return "home/thymeleaf";
    }
    @RequestMapping(value = "/index")
    public String index(){
        //Users user = usersService.selectByPrimaryKey("0f1443aa-eade-410d-b8bf-74ebfa914ca4");
        return "home/index-select";
    }

    @RequestMapping(value = "getUser")
    @ResponseBody
    public Users getUser(){
        return usersService.selectByPrimaryKey("0f1443aa-eade-410d-b8bf-74ebfa914ca4");
    }

    @RequestMapping(value = "/jsTreeSelect",method = RequestMethod.GET)
    @ResponseBody
    public Object jsTreeSelect(){
        message = false;
        data    = null;
        Map<String,Object> map = new HashMap<>();
        map.put("roleId","f8692cd2-e801-11e4-8fee-40167e64eefd");
        map.put("status","1");
        map.put("parentId","10000000-0000-0000-0000-000000000000");
        data = roleMenuService.selectRoleMenuListForAjaxJsTree(map);
        return ResultMsgUtil.getResultMsg(message,data);
    }
}
