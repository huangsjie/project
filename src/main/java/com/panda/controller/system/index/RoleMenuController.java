package com.panda.controller.system.index;

import com.panda.model.system.Roles;
import com.panda.model.system.Users;
import com.panda.service.system.RoleMenuService;
import com.panda.service.system.RolesService;
import com.panda.util.ResultMsgUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    @Resource
    private RolesService rolesService;
    private static boolean message = false;
    private static Object  data    = null;

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        List<Roles> rolesList = rolesService.selectAll();
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("rolesList",rolesList);
        return "system/index/getRoleMenuList";
    }

    /**
     * Ajax 获取角色列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getRolesDataList",method = RequestMethod.POST)
    @ResponseBody
    public Object getRolesDataList(HttpServletRequest request){
        try {
            List<Roles> rolesList = rolesService.selectAll();
            if(rolesList.size() > 0){
                message = true;
                data = rolesList;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }
}
