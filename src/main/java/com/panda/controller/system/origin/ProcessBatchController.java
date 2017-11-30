package com.panda.controller.system.origin;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.origin.ProcessBatch;
import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.origin.ProcessBatchService;
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
@RequestMapping("/system/processBatch")
public class ProcessBatchController {
    private static final Logger logger = LoggerFactory.getLogger(ProcessBatchController.class);

    @Resource
    private ProcessBatchService processBatchService;

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private TeaGardenService teaGardenService;

    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取菜单 Tree 当前菜单为用户 信息一起存储到 Redis 内
     * @return
     */
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    @RequiresPermissions("processBatch:view")//权限管理;
    public String getProcessBatchList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        List<Dictionary> statusType = dictionaryService.selectDictionaryValueList("ba259a75-f5a7-4897-949f-1c90b7958b35");
        Map query = new HashMap();
        query.put("status","1");
        List<Map> teaGardens = teaGardenService.selectTeaGardenList(query);
        model.addAttribute("statusType",statusType);
        model.addAttribute("teaGardens",teaGardens);
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/origin/getProcessBatchList";
    }

    /**
     * Ajax 获取茶园管理批次列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getProcessBatchDataList",method = RequestMethod.POST)
    @ResponseBody
    public Object getProcessBatchDataList(HttpServletRequest request,String datatable){
        message = false;
        data    = null;
        try {
            Map query = new HashMap();
            if (datatable != null && !datatable.isEmpty()){
                String jsonStr = StringEscapeUtil.unescapeHtml(datatable);
                Map params = JSON.parseObject(jsonStr,Map.class);
                Map status = JSON.parseObject(params.get("query").toString(),Map.class);
                if (status.size() > 0 && status.get("tea_garden_id") != ""){
                    query.put("tea_garden_id",status.get("tea_garden_id"));
                }

            }

            List<Map> processBatchList = processBatchService.selectProcessBatchList(query);
            if(processBatchList.size() > 0){
                message = true;
                data = processBatchList;
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
    @RequestMapping(value = "/getProcessBatchItem", method = RequestMethod.GET)
    @ResponseBody
    public Object getProcessBatchItem(HttpServletRequest request,String id){
        message = false;
        data    = null;
        if (!id.isEmpty()){
            try {
                ProcessBatch processBatch = processBatchService.selectByPrimaryKey(id);
                if(processBatch != null){
                    message = true;
                    data = processBatch;
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
     * @param processBatch
     * @param save
     * @return
     */
    @RequestMapping(value = "/saveProcessBatch",method = RequestMethod.POST)
    @ResponseBody
    public Object saveProcessBatch(HttpServletRequest request, ProcessBatch processBatch ,String save){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try{
            if(!processBatch.getId().isEmpty() && save.equals("edit")){
                int i = processBatchService.updateByPrimaryKeySelective(processBatch);
                if(i > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_UPDATE;
                }else{
                    data    = ResultStateUtil.FAIL_UPDATE;
                }
            }else if(save.equals("add")) {
                processBatch.setId(UUID.randomUUID().toString());
                processBatch.setCreateId(user.getId());
                processBatch.setCreateTime(new Date());
                processBatch.setModifyId(user.getId());
                processBatch.setModifyTime(new Date());
                processBatch.setStatus(1);

                int insert = processBatchService.insertSelective(processBatch);
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
    @RequestMapping(value="/delProcessBatchItem",method = RequestMethod.GET)
    @ResponseBody
    public Object DelProcessBatchItem(HttpServletRequest request ,String id){
        message = false;
        data    = null;
        try{
            if (!id.isEmpty()){
                int i = processBatchService.deleteByPrimaryKey(id);
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
