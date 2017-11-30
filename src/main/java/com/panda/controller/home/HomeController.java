package com.panda.controller.home;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/31
 * Time: 15:25
 */
@Controller
public class HomeController {

    private Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping({"/thymel"})
    public String thymeleaf(){

        return "home/thymeleaf";
    }
    @RequestMapping({"/","/index"})
    public String index(){

        return "home/index/index";
    }

}
