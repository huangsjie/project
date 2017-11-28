package com.panda.controller.system.origin;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.origin.TeaGardenLog;
import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.origin.TeaGardenLogService;
import com.panda.service.origin.TeaGardenService;
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
@RequestMapping("/system/teaLog")
public class TeaGardenLogController {
    private static final Logger logger = LoggerFactory.getLogger(TeaGardenLogController.class);

    @Resource
    private TeaGardenService teaGardenService;

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private TeaGardenLogService teaGardenLogService;

    private static boolean message = false;
    private static Object  data    = null;
    /**
     * 获取菜单 Tree 当前菜单为用户 信息一起存储到 Redis 内
     * @return
     */
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    @RequiresPermissions("origin:view")//权限管理;
    public String getTeaGardenLog(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        List<Map> gardenType = teaGardenService.selectTeaGardenNameAndId(new HashMap());
        List<Dictionary> farmType = dictionaryService.selectDictionaryValueList("92253cc8-2128-11e5-965c-000c29d7a3a0");//农事
        model.addAttribute("gardenType",gardenType);
        model.addAttribute("farmType",farmType);
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/origin/getTeaGardenLogList";
    }

    /**
     * Ajax 获取茶园信息列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getTeaGardenLogList",method = RequestMethod.POST)
    @ResponseBody
    public Object getTeaGardenLogList(HttpServletRequest request,String datatable){
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
                if (status.size() > 0 && status.get("createYear") != ""){
                    query.put("createYear",status.get("createYear"));
                }
                if (status.size() > 0 && status.get("farmType") != ""){
                    query.put("farmType",status.get("farmType"));
                }
                if (status.size() > 0 && status.get("gardenType") != ""){
                    query.put("gardenType",status.get("gardenType"));
                }
            }
            List<TeaGardenLog> TeaGardenLog = teaGardenLogService.selectTeaGardenLogList(query);
            if(TeaGardenLog.size() > 0){
                message = true;
                data = TeaGardenLog;
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
    @RequestMapping(value = "/getTeaGardenLogItem", method = RequestMethod.GET)
    @ResponseBody
    public Object getTeaGardenLogItem(HttpServletRequest request,String id){
        message = false;
        data    = null;
        if (!id.isEmpty()){
            try {
                TeaGardenLog TeaGardenLog = teaGardenLogService.selectByPrimaryKey(id);
                if(TeaGardenLog != null){
                    message = true;
                    data = TeaGardenLog;
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
     * @param TeaGardenLog
     * @param save
     * @return
     */
    @RequestMapping(value = "/saveTeaGardenLog",method = RequestMethod.POST)
    @ResponseBody
    public Object saveTeaGardenLog(HttpServletRequest request, TeaGardenLog TeaGardenLog ,String save){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try{
            if(!TeaGardenLog.getId().isEmpty() && save.equals("edit")){
                int i = teaGardenLogService.updateByPrimaryKeySelective(TeaGardenLog);
                if(i > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_UPDATE;
                }else{
                    data    = ResultStateUtil.FAIL_UPDATE;
                }
            }else if(save.equals("add")) {
                TeaGardenLog.setId(UUID.randomUUID().toString());
                TeaGardenLog.setCreateId(user.getId());
                TeaGardenLog.setCreateTime(new Date());
                TeaGardenLog.setModifyId(user.getId());
                TeaGardenLog.setModifyTime(new Date());
                TeaGardenLog.setCultivarId(UUID.randomUUID().toString());
                TeaGardenLog.setStatus(1);
                int insert = teaGardenLogService.insertSelective(TeaGardenLog);
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
    @RequestMapping(value="/delTeaGardenLogItem",method = RequestMethod.GET)
    @ResponseBody
    public Object delTeaGardenLogItem(HttpServletRequest request ,String id){
        message = false;
        data    = null;
        try{
            if (!id.isEmpty()){
                int i = teaGardenLogService.deleteByPrimaryKey(id);
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
