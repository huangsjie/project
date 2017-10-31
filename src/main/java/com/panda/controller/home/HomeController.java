package com.panda.controller.home;

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
    @RequestMapping({"/","/thy"})
    public String thymeleaf(){
        return "home/thymeleaf";
    }
}
