package com.panda.controller.home;

import com.panda.model.origin.OriginCode;
import com.panda.model.system.Menu;
import com.panda.service.origin.OriginCodeService;
import com.panda.service.system.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/31
 * Time: 15:25
 */
@Controller
@RequestMapping(value = "/index/traceQuery")
public class ProTraceController {

    @Resource
    private MenuService menuService;
    private OriginCodeService originCodeService;
    private Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * 溯源查询
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String proTrace(HttpServletRequest request, Model model){
        List<Menu> menuList = null;
        try {
            menuList = menuService.selectHomeMenuList("c716be42-78c2-4c80-8c88-25814b2e683b");
            model.addAttribute("menuList",menuList);
        }catch (Exception e){
            e.printStackTrace();
            logger.error("------->selectManagerRoleMenuList"+e.getMessage());
        }
        return "home/index/traceQuery";
    }

    /**
     * 溯源详情
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/proTrace",method = RequestMethod.POST)
    public String proTrace(HttpServletRequest request, Model model,String originCode){
        List<Menu> menuList = null;
        //String t_number = request.getParameter("trace_number");
        try {
            menuList = menuService.selectHomeMenuList("c716be42-78c2-4c80-8c88-25814b2e683b");
            List<Map> InfoList = originCodeService.selectOriginCodeByInfoList(originCode);
            model.addAttribute("InfoList",InfoList);
            model.addAttribute("menuList",menuList);
        }catch (Exception e){
            e.printStackTrace();
            logger.error("------->selectManagerRoleMenuList"+e.getMessage());
        }
        return "home/index/proTrace";
    }
}
