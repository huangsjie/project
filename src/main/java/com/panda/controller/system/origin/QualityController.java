package com.panda.controller.system.origin;

import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.origin.QualityService;
import com.panda.service.system.DictionaryService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/4
 * Time: 15:24
 */
@Controller
@RequestMapping("/system/quality")
public class QualityController {

    private static final Logger logger = LoggerFactory.getLogger(QualityController.class);

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private QualityService qualityService;

    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取质检列表
     * @return
     */
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    @RequiresPermissions("quality:view")//权限管理;
    public String getQualityList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        List<Dictionary> statusType = dictionaryService.selectDictionaryValueList("ba259a75-f5a7-4897-949f-1c90b7958b35");
        List<Dictionary> teaGardenLevel = dictionaryService.selectDictionaryValueList("f63fe4f8-27ab-11e5-965c-000c29d7a3a0");
        List<Dictionary> gardenType = dictionaryService.selectDictionaryValueList("4031b009-b799-4bf0-add0-c7069900bed3");
        List<Dictionary> cultivarType = dictionaryService.selectDictionaryValueList("be0ba01c-23ad-11e5-965c-000c29d7a3a0");
        model.addAttribute("statusType",statusType);
        model.addAttribute("teaGardenLevel",teaGardenLevel);
        model.addAttribute("cultivarType",cultivarType);
        model.addAttribute("gardenType",gardenType);
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/origin/getQualityList";
    }
}
