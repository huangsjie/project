package com.panda.controller.home;

import com.panda.config.DruidConfig;
import com.panda.model.system.Menu;
import com.panda.model.system.Users;
import com.panda.service.system.UsersService;
import com.panda.util.SerializeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/31
 * Time: 15:25
 */
@Controller
public class HomeController {

    private Logger logger = LoggerFactory.getLogger(DruidConfig.class);

    @Autowired
    private JedisPool jedisPool;

    @Resource
    private UsersService usersService;

    @RequestMapping({"/","/thy"})
    public String thymeleaf(){

        return "home/thymeleaf";
    }
    @RequestMapping(value = "/hello1")
    @ResponseBody
    public Users hello1(){
        Users user = usersService.selectByPrimaryKey("0f1443aa-eade-410d-b8bf-74ebfa914ca4");
        return user;
    }

    @RequestMapping(value = "getUser")
    @ResponseBody
    public Users getUser(){
        return usersService.selectByPrimaryKey("0f1443aa-eade-410d-b8bf-74ebfa914ca4");
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public int add(){
        Users user = new Users();
        user.setId(UUID.randomUUID().toString());
        user.setAccount("Alan");
        user.setChineseName("哗哗");
        user.setLastDate(new Date());
        user.setMobile("13713666160");
        user.setStatus(0);
        user.setModifyTime(new Date());
        user.setEmail("2755527207@qq.com");
        user.setLoginType(1);
        user.setUserType(2);
        return usersService.insert(user);

       // logger.info("jedisPool uuid : " + user.getId());
       // try (Jedis jedis = jedisPool.getResource()) {
            //jedis.set("f9222c95-cf5a-4036-8ad9-ecface0aaf83".getBytes(), SerializeUtil.serialize(user));
           // jedis.get("f9222c95-cf5a-4036-8ad9-ecface0aaf83");
            //byte[] reduser = jedis.get("f9222c95-cf5a-4036-8ad9-000000000000".getBytes());
           // return (ArrayList) SerializeUtil.unserialize(reduser);
       // }
    }
}
