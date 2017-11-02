package com.panda.controller.system.index;

import com.panda.service.system.MenuService;
import com.panda.service.system.RoleMenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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
    @RequestMapping(value = "/list")
    public String getMenuList(){
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
