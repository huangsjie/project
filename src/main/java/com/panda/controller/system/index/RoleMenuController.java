package com.panda.controller.system.index;

import com.panda.service.system.RoleMenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/2
 * Time: 10:20
 */
@Controller
@RequestMapping("/system/roleMenu")
public class RoleMenuController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private RoleMenuService roleMenuService;
    private static boolean message = false;
    private static Object  data    = null;

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request){

        return "system/index/setMenu";
    }
}
