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
import java.util.List;
import java.util.Map;

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
    private MenuService menuService;

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
     * Ajax 获取当前选中角色 可用的 角色菜单
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/getRoleMenuDataList",method = RequestMethod.GET)
    @ResponseBody
    public Object getRoleMenuDataList(HttpServletRequest request, String id){
        try {
            if(!id.isEmpty()){
                List<Map> menuList = roleMenuService.selectRoleMenuList(id);
                message = true;
                data = menuList;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

    /**
     * 保存角色菜单设置
     * @param request
     * @param param
     * @return
     */
    @RequestMapping(value = "/saveRoleMenu", method = RequestMethod.POST)
    @ResponseBody
    public Object saveRoleMenu(HttpServletRequest request, String param){
        try {
            if(param != null && !param.isEmpty() && param != "[]"){
                String jsonStr = StringEscapeUtil.unescapeHtml(param);
                List<Map> listMap = JSON.parseObject(jsonStr,List.class);
                Integer status = roleMenuService.saveOrUpdateRoleMenu(listMap);
                switch (status){
                    case 101:
                        message = false;
                        data    = ResultStateUtil.FAIL_ABNORMAL;
                        break;
                    default :
                        message = true;
                        data    = ResultStateUtil.SUCCESS_ABNORMAL;
                        break;
                }
            }else{
                message = false;
                data    = ResultStateUtil.ERROR_PARAMETER_IS_EMPTY;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }
}
