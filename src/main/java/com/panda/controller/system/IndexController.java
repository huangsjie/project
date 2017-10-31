package com.panda.controller.system;

import com.panda.model.system.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
@RestController
@RequestMapping(value = "/system")
public class IndexController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Resource
    private UsersService usersService;

    @RequestMapping(value = "/main")
    public Users main(){
        return usersService.selectManagerAccount("morgan");
    }
}
