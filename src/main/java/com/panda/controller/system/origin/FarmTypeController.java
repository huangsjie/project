package com.panda.controller.system.origin;


import com.panda.model.system.Roles;
import com.panda.model.system.Users;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller

@RequestMapping(value="/system/farmType")
public class FarmTypeController {

    @RequestMapping(value = "/list")
    public String list(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        //List<Roles> rolesList = rolesService.selectAll();
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("menuList",user.getMenuList());
        //model.addAttribute("rolesList",rolesList);
        return "system/origin/getFarmTypeList";
    }
}
