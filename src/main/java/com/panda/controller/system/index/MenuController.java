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
        Map<String,String> map = new HashMap<String,String>(2);
        map.put("userId",user.getId());
        map.put("parentId","10000000-0000-0000-0000-000000000000");
        List<Menu> menuList = menuService.selectManagerRoleMenuList(map);
        model.addAttribute("menuList",menuList);
        model.addAttribute("user",user);
        return "system/index/getMenuList";
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
