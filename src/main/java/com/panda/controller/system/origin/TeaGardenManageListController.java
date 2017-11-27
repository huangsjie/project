package com.panda.controller.system.origin;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.controller.system.index.IndexController;

import com.panda.model.origin.TeaGardenManageList;
import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.origin.TeaGardenManageListService;
import com.panda.service.system.DictionaryService;
import com.panda.util.ResultMsgUtil;
import com.panda.util.ResultStateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/system/origin")
public class TeaGardenManageListController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Resource
    private TeaGardenManageListService teaGardenManageListService;
    @Resource
    private DictionaryService dictionaryService;
    private static boolean message = false;
    private static Object  data    = null;
    /**
     * 获取菜单 Tree 当前菜单为用户 信息一起存储到 Redis 内
     * @return
     */
    @RequestMapping(value = "/manageList",method= RequestMethod.GET)
    @RequiresPermissions("origin:view")//权限管理;
    public String getTeaGardenManageList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        List<Dictionary> statusType = dictionaryService.selectDictionaryValueList("ba259a75-f5a7-4897-949f-1c90b7958b35");
        List<Dictionary> farmType = dictionaryService.selectDictionaryValueList("92253cc8-2128-11e5-965c-000c29d7a3a0");
        model.addAttribute("baseUrl",request.getRequestURI());
        model.addAttribute("statusType",statusType);
        model.addAttribute("farmType",farmType);
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/origin/getTeaGardenManageList";
    }

    /**
     * Ajax 获取茶园信息列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getTeaGardenManageDataList",method = RequestMethod.POST)
    @ResponseBody
    public Object getTeaGardenDataList(HttpServletRequest request,String datatable){
        message = false;
        data    = null;
        try {
            Map query = new HashMap();
            if (datatable != null && !datatable.isEmpty()){
                String jsonStr = StringEscapeUtil.unescapeHtml(datatable);
                Map params = JSON.parseObject(jsonStr,Map.class);
                Map status = JSON.parseObject(params.get("query").toString(),Map.class);
                if (status.size() > 0 && status.get("status") != ""){
                    query.put("status",status.get("status"));
                }
            }

            List<TeaGardenManageList> teaGardenManageList = teaGardenManageListService.selectTeaGardenManageList(query);
            if(teaGardenManageList.size() > 0){
                message = true;
                data = teaGardenManageList;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }


    /**
     * Ajax 获取当前编辑项的内容
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/getTeaGardenManageItem", method = RequestMethod.GET)
    @ResponseBody
    public Object getTeaGardenManageItem(HttpServletRequest request,String id){
        message = false;
        data    = null;
        if (!id.isEmpty()){
            try {
                TeaGardenManageList teaGardenManageList = teaGardenManageListService.selectByPrimaryKey(id);
                if(teaGardenManageList != null){
                    message = true;
                    data = teaGardenManageList;
                }else{
                    data = ResultStateUtil.ERROR_QUERY;
                }
            }catch (Exception e){
                e.printStackTrace();
                data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
            }
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }


    /**
     * 保存
     * @param request
     * @param teaGardenManageList
     * @param save
     * @return
     */
    @RequestMapping(value = "/saveTeaGardenManage",method = RequestMethod.POST)
    @ResponseBody
    public Object SaveTeaGardenManage(HttpServletRequest request, TeaGardenManageList teaGardenManageList ,String save){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try{
            if(!teaGardenManageList.getId().isEmpty() && save.equals("edit")){
                int i = teaGardenManageListService.updateByPrimaryKeySelective(teaGardenManageList);
                if(i > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_UPDATE;
                }else{
                    data    = ResultStateUtil.FAIL_UPDATE;
                }
            }else if(save.equals("add")) {
                teaGardenManageList.setId(UUID.randomUUID().toString());
                teaGardenManageList.setCreateId(user.getId());
                teaGardenManageList.setCreateTime(new Date());
                teaGardenManageList.setModifyId(user.getId());
                teaGardenManageList.setModifyTime(new Date());
                teaGardenManageList.setCultivarId(UUID.randomUUID().toString());
                teaGardenManageList.setStatus(1);
                int insert = teaGardenManageListService.insertSelective(teaGardenManageList);
                if(insert > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_ADD;
                }else{
                    data    = ResultStateUtil.FAIL_ADD;
                }
            }

        }catch (Exception e){
            e.printStackTrace();
            data  = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);

    }

    /**
     * 刪除
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value="/delTeaGardenManageItem",method = RequestMethod.GET)
    @ResponseBody
    public Object DelTeaGardenManageItem(HttpServletRequest request ,String id){
        message = false;
        data    = null;
        try{
            if (!id.isEmpty()){
                int i = teaGardenManageListService.deleteByPrimaryKey(id);
                if(i > 0){
                    message = true;
                    data = ResultStateUtil.SUCCESS_DELETE;
                }else{
                    data = ResultStateUtil.ERROR_QUERY;
                }

            }else{
                data = ResultStateUtil.ERROR_PARAMETER_IS_EMPTY;
            }
        }catch (Exception e){
            e.printStackTrace();
            data = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

}
