package com.panda.controller.system.index;

import com.panda.model.system.Dictionary;
import com.panda.model.system.Roles;
import com.panda.model.system.Users;
import com.panda.service.system.MenuService;
import com.panda.service.system.RoleMenuService;
import com.panda.service.system.DictionaryService;
import com.panda.service.system.RolesService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/14
 * Time: 17:28
 */
@Controller
@RequestMapping(value = "/system/dictionary")
public class DictionaryController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private MenuService menuService;

    @Resource
    private DictionaryService dictionaryService;

    @RequestMapping(value = "/list")
    public String list(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        List<Dictionary> dictionaryList = dictionaryService.selectAll();
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("dictionaryList",dictionaryList);
        return "system/index/getDictionaryList";
    }
}
