package com.panda.controller.system.origin;

import com.panda.controller.system.index.IndexController;

import com.panda.model.origin.TeaGardenInfo;
import com.panda.model.system.Users;
import com.panda.service.origin.TeaGardenInfoService;
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
import java.util.List;

@Controller
@RequestMapping("/system/origin")
public class TeaGardenController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private TeaGardenInfoService  teaGardenInfoService;
    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取菜单 Tree 当前菜单为用户 信息一起存储到 Redis 内
     * @return
     */
    @RequestMapping(value = "/teaGarden",method= RequestMethod.GET)
    public String getTeaGardenList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("authMenu",user.getAuthMenuList());
        model.addAttribute("user",user);
        return "system/origin/getTeaGardenList";
    }

    /**
     * Ajax 获取茶园信息列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getTeaGardenDataList",method = RequestMethod.GET)
    @ResponseBody
    public Object getTeaGardenDataList(HttpServletRequest request){
        try {
            List<TeaGardenInfo> teaGardenInfoList = teaGardenInfoService.selectAll();
            if(teaGardenInfoList.size() > 0){
                message = true;
                data = teaGardenInfoList;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

}
