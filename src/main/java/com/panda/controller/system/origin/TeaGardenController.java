package com.panda.controller.system.origin;

import com.panda.controller.system.index.IndexController;

import com.panda.model.system.Users;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/system/origin")
public class TeaGardenController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);



    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取菜单 Tree 当前菜单为用户 信息一起存储到 Redis 内
     * @return
     */
    @RequestMapping(value = "/teaGarden",method= RequestMethod.GET)
    public String getTeaGardenList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("authMenu",user.getAuthMenuList());
        model.addAttribute("user",user);
        return "system/origin/getTeaGardenList";
    }

}
