package com.panda.controller.system.origin;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.commodity.Products;
import com.panda.model.origin.Quality;
import com.panda.model.origin.Sampling;
import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.commodity.ProductsService;
import com.panda.service.origin.ProcessBatchService;
import com.panda.service.origin.QualityService;
import com.panda.service.origin.SamplingService;
import com.panda.service.system.DictionaryService;
import com.panda.util.ResultMsgUtil;
import com.panda.util.ResultStateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

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
    private QualityService qualityService;

    @Resource
    private SamplingService samplingService;

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private ProcessBatchService processBatchService;

    @Resource
    private ProductsService productsService;

    private static boolean message = false;
    private static Object  data    = null;

    /**
     * bootstart  date 注解 格式化页面上传过来的 String 日期
     * @param request
     * @param binder
     * @throws
     */
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }

    /**
     * 获取质检列表
     * @return
     */
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    @RequiresPermissions("quality:view")//权限管理;
    public String getQualityList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        Map map = new HashMap();
        map.put("status",1);
        List<Dictionary> attestation = dictionaryService.selectDictionaryValueList("68d6888f-2b91-11e5-965c-000c29d7a3a0");//质检类型
        List<Dictionary> teaGrade = dictionaryService.selectDictionaryValueList("f63fe4f8-27ab-11e5-965c-000c29d7a3a0");//质检等级
        List<Map> processBatchList = processBatchService.selectProcessBatchList(map); //加工批次号
        List<Products> productsList = productsService.selectProductsList(map); //产品名称
        List<Sampling> samplingList = samplingService.selectAll();//取样单号
        model.addAttribute("teaGrade",teaGrade);
        model.addAttribute("attestation",attestation);
        model.addAttribute("productsList",productsList);
        model.addAttribute("samplingList",samplingList);
        model.addAttribute("processBatchList",processBatchList);
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/origin/getQualityList";
    }

    /**
     * Ajax 获取取样数据
     * @param request
     * @return
     */
    @RequestMapping(value = "/getQualityDataList",method = RequestMethod.POST)
    @ResponseBody
    public Object getQualityDataList(HttpServletRequest request,String datatable){
        message = false;
        data    = null;
        try {
            Map query = new HashMap();
            if (datatable != null && !datatable.isEmpty()){
                String jsonStr = StringEscapeUtil.unescapeHtml(datatable);
                Map params = JSON.parseObject(jsonStr,Map.class);
                Map status = JSON.parseObject(params.get("query").toString(),Map.class);
                if (status.size() > 0 && status.get("productId") != ""){
                    query.put("productId",status.get("productId"));
                }
                if (status.size() > 0 && status.get("processBatchId") != ""){
                    query.put("processBatchId",status.get("processBatchId"));
                }
                if (status.size() > 0 && status.get("samplingId") != ""){
                    query.put("samplingId",status.get("samplingId"));
                }
            }
            List<Map> qualityList = qualityService.selectQualityDataList(query);
            if(qualityList.size() > 0){
                message = true;
                data = qualityList;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

    /**
     * 新增质检记录 -- 获取选中的取样单号对应数据
     * @param request
     * @param samplingId
     * @return
     */
    @RequestMapping(value = "/getSamplingData")
    @ResponseBody
    public Object getSamplingData(HttpServletRequest request,String samplingId){
        message = false;
        data    = null;
        try {
            if (!samplingId.isEmpty()){
                Map sampling = samplingService.selectByPrimaryKeyAndProductName(samplingId);
                if (sampling != null){
                    message = true;
                    data    = sampling;
                }else{
                    data    = "未获取到取样记录.";
                }
            }else{
                data = ResultStateUtil.ERROR_PARAMETER_NO_TCOMPATIBLE;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_QUERY;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }



    /**
     * Ajax 获取当前编辑项的内容
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/getQualityItem", method = RequestMethod.GET)
    @ResponseBody
    public Object getQualityItem(HttpServletRequest request,String id){
        message = false;
        data    = null;
        if (!id.isEmpty()){
            try {
                Quality quality = qualityService.selectByPrimaryKey(id);
                if(quality != null){
                    message = true;
                    data = quality;
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
     * @param quality
     * @param save
     * @return
     */
    @RequestMapping(value = "/saveOrUpdateQuality",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdateQuality(HttpServletRequest request, Quality quality , String save){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try{
            if(!quality.getId().isEmpty() && save.equals("edit")){
                int i = qualityService.updateByPrimaryKeySelective(quality);
                if(i > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_UPDATE;
                }else{
                    data    = ResultStateUtil.FAIL_UPDATE;
                }
            }else if(save.equals("add")) {
                quality.setId(UUID.randomUUID().toString());
                quality.setCreateId(user.getId());
                quality.setCreateTime(new Date());
                quality.setModifyId(user.getId());
                quality.setModifyTime(new Date());
                int insert = qualityService.insertSelective(quality);
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
    @RequestMapping(value="/delQualityItem",method = RequestMethod.GET)
    @ResponseBody
    public Object delQualityItem(HttpServletRequest request ,String id){
        message = false;
        data    = null;
        try{
            if (!id.isEmpty()){
                int i = qualityService.deleteByPrimaryKey(id);
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
