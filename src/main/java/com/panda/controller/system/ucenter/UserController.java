package com.panda.controller.system.ucenter;

import com.panda.model.system.Users;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/24
 * Time: 9:33
 */
@Controller
@RequestMapping("/system/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取用户列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getUserList",method = RequestMethod.GET)
    @RequiresPermissions("user:view")//权限管理;
    public String getUserList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/ucenter/getUserList";
    }
}
