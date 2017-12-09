package com.panda.controller.home;

import com.panda.model.origin.MachinSet;
import com.panda.model.origin.OriginCode;
import com.panda.model.system.Menu;
import com.panda.service.origin.OriginCodeService;
import com.panda.service.system.MenuService;
import com.panda.util.ResultMsgUtil;
import com.panda.util.ResultStateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
    @Resource
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
        String  messave = request.getParameter("m");
        try {
            menuList = menuService.selectHomeMenuList("c716be42-78c2-4c80-8c88-25814b2e683b");
            model.addAttribute("menuList",menuList);
            model.addAttribute("messave",messave);
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
    public String proTrace(HttpServletRequest request, HttpServletResponse response, Model model, String originCode){
        List<Menu> menuList = null;
            try {
                menuList = menuService.selectHomeMenuList("c716be42-78c2-4c80-8c88-25814b2e683b");
                if (!originCode.isEmpty()){
                    List<Map> InfoList = originCodeService.selectOriginCodeByInfoList(originCode);
                    if(!InfoList.isEmpty() && InfoList.size()>0){
                        model.addAttribute("InfoList",InfoList);
                    }else{
                        response.sendRedirect("/index/traceQuery");
                    }
                }else{
                    response.sendRedirect("/index/traceQuery");
                }
                model.addAttribute("menuList",menuList);
            }catch (Exception e){
                e.printStackTrace();
                logger.error("------->selectManagerRoleMenuList"+e.getMessage());
            }

        return "home/index/proTrace";
    }

    /**
     * 溯源详情
     * @param request
     * @return
     */
    @RequestMapping(value = "/proTraceAjax",method = RequestMethod.POST)
    @ResponseBody
    public Object proTraceAjax(HttpServletRequest request,  String originCode){
        boolean message = false;
        Object data    = null;
        if (!originCode.isEmpty()){
            try {
                List<Map> InfoList = originCodeService.selectOriginCodeByInfoList(originCode);
                if( !InfoList.isEmpty() && InfoList.size() > 0 ){
                    message = true;
                    data = "";
                }else{
                    data = "无效的溯源档案编号";
                }
            }catch (Exception e){
                e.printStackTrace();
                data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
            }
        }
        return ResultMsgUtil.getResultMsg(message,data);

    }

}
