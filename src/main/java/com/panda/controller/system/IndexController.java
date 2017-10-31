package com.panda.controller.system;

import com.panda.model.system.Users;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.panda.service.system.UsersService;

import javax.annotation.Resource;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/31
 * Time: 15:25
 */
@Controller
@RequestMapping(value = "/system")
public class IndexController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Resource
    private UsersService usersService;

    @RequestMapping(value = "/main")
    @RequiresPermissions("userInfo:add")//权限管理;
    public String main(){
        return "system/index/main";
    }


}
