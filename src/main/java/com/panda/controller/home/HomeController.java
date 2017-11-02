package com.panda.controller.home;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.panda.model.system.Users;
import com.panda.service.system.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/31
 * Time: 15:25
 */
@Controller
public class HomeController {

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
    }
}
