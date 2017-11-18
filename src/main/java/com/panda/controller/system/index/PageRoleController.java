package com.panda.controller.system.index;


import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.system.Menu;
import com.panda.model.system.Roles;
import com.panda.model.system.Users;
import com.panda.service.system.MenuService;
import com.panda.service.system.RoleMenuService;
import com.panda.service.system.RolesService;
import com.panda.util.ResultMsgUtil;
import com.panda.util.ResultStateUtil;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/2
 * Time: 10:20
 */
@Controller
@RequestMapping("/system/pageRole")
public class PageRoleController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private MenuService menuService;

    @Resource
    private RoleMenuService roleMenuService;

    @Resource
    private RolesService rolesService;
    private static boolean message = false;
    private static Object  data    = null;


    /**
     * 角色权限设置列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        List<Roles> rolesList = rolesService.selectAll();
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("rolesList",rolesList);
        return "system/index/getPageRoleList";
    }

    /**
     * Ajax 获取当前选中角色 可用的 角色菜单
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/getRoleMenuDataList",method = RequestMethod.GET)
    @ResponseBody
    public Object getRoleMenuDataList(HttpServletRequest request, String id){
        message = false;
        data    = null;
        try {
            if(!id.isEmpty()){
                Map<String,Object> map = new HashMap<>();
                map.put("roleId",id);
                map.put("status","1");
                map.put("parentId","10000000-0000-0000-0000-000000000000");
                List<Map> menuList = roleMenuService.selectRoleMenuForListAjaxJsTree(map);
                if(menuList.size() > 0){
                    message = true;
                    data = menuList;
                }else{
                    data = ResultStateUtil.NO_MORE_DATA;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

}
