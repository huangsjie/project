package com.panda.controller.system.origin;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.commodity.Products;
import com.panda.model.origin.Sampling;
import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.commodity.ProductsService;
import com.panda.service.origin.ProcessBatchService;
import com.panda.service.origin.SamplingService;
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

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/4
 * Time: 15:24
 */
@Controller
@RequestMapping("/system/sampling")
public class SamplingController {

    private static final Logger logger = LoggerFactory.getLogger(SamplingController.class);

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private SamplingService samplingService;

    @Resource
    private ProductsService productsService;

    @Resource
    private ProcessBatchService processBatchService;

    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取 取样列表
     * @return
     */
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    @RequiresPermissions("sampling:view")//权限管理;
    public String getSamplingList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        Map map = new HashMap();
        map.put("status",1);
        List<Dictionary> grade = dictionaryService.selectDictionaryValueList("f63fe4f8-27ab-11e5-965c-000c29d7a3a0");//等级
        List<Map> processBatchList = processBatchService.selectProcessBatchList(map); //加工批次号
        List<Products> productsList = productsService.selectProductsList(map); //产品名称
        model.addAttribute("grade",grade);
        model.addAttribute("processBatchList",processBatchList);
        model.addAttribute("productsList",productsList);
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/origin/getSamplingList";
    }

    /**
     * Ajax 获取取样数据
     * @param request
     * @return
     */
    @RequestMapping(value = "/getSamplingDataList",method = RequestMethod.POST)
    @ResponseBody
    public Object getSamplingDataList(HttpServletRequest request,String datatable){
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
            List<Map> sampList = samplingService.selectSamplingDataList(query);
            if(sampList.size() > 0){
                message = true;
                data = sampList;
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
    @RequestMapping(value = "/getSamplingItem", method = RequestMethod.GET)
    @ResponseBody
    public Object getSamplingItem(HttpServletRequest request,String id){
        message = false;
        data    = null;
        if (!id.isEmpty()){
            try {
                Sampling sampling = samplingService.selectByPrimaryKey(id);
                if(sampling != null){
                    message = true;
                    data = sampling;
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
     * @param sampling
     * @param save
     * @return
     */
    @RequestMapping(value = "/saveOrUpdateSampling",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdateSampling(HttpServletRequest request, Sampling sampling ,String save){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try{
            if(!sampling.getId().isEmpty() && save.equals("edit")){
                int i = samplingService.updateByPrimaryKeySelective(sampling);
                if(i > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_UPDATE;
                }else{
                    data    = ResultStateUtil.FAIL_UPDATE;
                }
            }else if(save.equals("add")) {
                sampling.setId(UUID.randomUUID().toString());
                sampling.setCreateId(user.getId());
                sampling.setCreateTime(new Date());
                sampling.setModifyId(user.getId());
                sampling.setModifyTime(new Date());
                int insert = samplingService.insertSelective(sampling);
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
    @RequestMapping(value="/delSamplingItem",method = RequestMethod.GET)
    @ResponseBody
    public Object delSamplingItem(HttpServletRequest request ,String id){
        message = false;
        data    = null;
        try{
            if (!id.isEmpty()){
                int i = samplingService.deleteByPrimaryKey(id);
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
