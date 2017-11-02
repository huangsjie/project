package com.panda.controller.system.index;

import com.panda.model.system.Menu;
import com.panda.model.system.Users;
import com.panda.service.system.MenuService;
import org.apache.shiro.SecurityUtils;
import org.springframework.ui.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
 * Date: 2017/10/31
 * Time: 15:25
 */
@Controller
@RequestMapping(value = "/system/index")
public class IndexController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Resource
    private MenuService menuService;

    /**
     * 初始化管理员菜单，存入 Redis
     * @param model
     * @return
     */
    @RequestMapping(value = "/main",method= RequestMethod.GET)
    public String main(Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        Map<String,String> map = new HashMap<String,String>(2);
        map.put("userId",user.getId());
        map.put("parentId","10000000-0000-0000-0000-000000000000");
        List<Menu> menuList = menuService.selectManagerRoleMenuList(map);
        model.addAttribute("menuList",menuList);
        model.addAttribute("user",user);
        return "system/index/main";
    }


    @RequestMapping(value = "/menu",method= RequestMethod.GET)
    @ResponseBody
    public List<Menu> getMenu(){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        Map<String,String> map = new HashMap<String,String>(2);
        map.put("userId",user.getId());
        map.put("parentId","10000000-0000-0000-0000-000000000000");
        List<Menu> menuList = menuService.selectManagerRoleMenuList(map);
        return menuList;
    }


}
