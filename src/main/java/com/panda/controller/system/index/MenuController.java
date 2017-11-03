package com.panda.controller.system.index;

import com.panda.model.system.Menu;
import com.panda.model.system.Users;
import com.panda.service.system.MenuService;
import com.panda.service.system.RoleMenuService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/2
 * Time: 10:19
 */
@Controller
@RequestMapping(value = "/system/menu")
public class MenuController {

    @Resource
    private MenuService menuService;
    @Resource
    private RoleMenuService roleMenuService;

    /**
     * 获取菜单列表
     * @return
     */
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    public String getMenuList(Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/index/getMenuList";
    }

    /**
     * 获取菜单数据列表
     * @return
     */
    @RequestMapping(value = "/getMenuListData",method = RequestMethod.GET)
    @ResponseBody
    public Object getMenuListData(){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        return user.getMenuList();
    }

    /**
     * 编辑菜单
     * @return
     */
    @RequestMapping(value = "/edit")
    public String editMenu(){
        return "index/editMenu";
    }

    /**
     * 保存菜单
     */
    @RequestMapping(value = "/save")
    public void saveMenu(){

    }
}
