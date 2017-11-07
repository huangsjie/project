package com.panda.controller.system.index;

import com.panda.model.system.Roles;
import com.panda.model.system.Users;
import com.panda.service.system.RolesService;
import com.panda.util.ResultMsgUtil;
import org.springframework.ui.Model;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
 * Time: 10:19
 */
@Controller
@RequestMapping("/system/roles")
public class RolesController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private RolesService rolesService;

    /**
     * 权限管理
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String getRolesList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("menuList",user.getMenuList());
        return "system/index/getRolesList";
    }

    /**
     * Ajax 获取角色列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getRolesDataList",method = RequestMethod.POST)
    @ResponseBody
    public Object getRolesDataList(HttpServletRequest request){
        boolean message = false;
        Object  data    = null;
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
