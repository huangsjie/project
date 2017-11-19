package com.panda.controller.system.index;

import com.panda.model.system.Dictionary;
import com.panda.model.system.Roles;
import com.panda.model.system.Users;
import com.panda.service.system.PageRoleService;
import com.panda.service.system.RoleMenuService;
import com.panda.service.system.RolesService;
import com.panda.service.system.DictionaryService;
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
    private RolesService rolesService;

    @Resource
    private RoleMenuService roleMenuService;

    @Resource
    private PageRoleService pageRoleService;

    @Resource
    private DictionaryService dictionaryService;

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
                List<Map> menuList = roleMenuService.selectRoleMenuListForAjaxJsTree(map);
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

    /**
     * Ajax 获取角色对应的菜单 操作权限
     * @param request
     * @param menuId
     * @param roleId
     * @param status
     * @return
     */
    @RequestMapping(value = "/getPageRoleDataList",method = RequestMethod.GET)
    @ResponseBody
    public Object getPageRoleDataList(HttpServletRequest request, String menuId, String roleId, Integer status){
        message = false;
        data    = null;
        try {
            if(!menuId.isEmpty() && !roleId.isEmpty() && status == 1){
                Map<String,Object> map = new HashMap<>();
                map.put("status",status);
                map.put("parentId","b6315b3a-1587-11e5-a9de-000c29d7a3a0");
                List<Map<String,Object>> dictionaryList = dictionaryService.selectDictionaryListMap(map);
                if(dictionaryList.size() > 0){
                    map.put("parentId",null);
                    map.put("menuId",menuId);
                    map.put("roleId",roleId);
                    for (Map<String,Object> item : dictionaryList){
                        map.put("dictId",item.get("id"));
                        Map<String,Object> pageRole = pageRoleService.selectPageRoleListByDictionary(map);
                        if(pageRole != null){
                            item.putAll(pageRole);
                        }else{
                            item.put("pageRoleStatus","3");
                        }
                    }
                    message = true;
                    data = dictionaryList;
                }else{
                    data = ResultStateUtil.NO_MORE_DATA;
                }
            }else{
                data    = ResultStateUtil.ERROR_PARAMETER_IS_EMPTY;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }
}
