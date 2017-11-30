package com.panda.controller.system.origin;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.origin.MachinTea;
import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.commodity.ProductsService;
import com.panda.service.origin.MachinTeaService;
import com.panda.service.origin.ProcessBatchService;
import com.panda.service.system.DictionaryService;
import com.panda.util.ResultMsgUtil;
import com.panda.util.ResultStateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
 * @AUTH: Alan
 * Date: 2017/11/28
 * Time: 22:28
 */
@Controller
@RequestMapping("/system/machinTea")
public class MachinTeaController {

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private MachinTeaService machinTeaService;

    @Resource
    private ProductsService productsService;

    @Resource
    private ProcessBatchService processBatchService;

    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取加工设置数据
     * @return
     */
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    @RequiresPermissions("machinTea:view")//权限管理;
    public String getMachinTeaList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        Map map = new HashMap();
        map.put("status",1);
        List<Dictionary> machinType = dictionaryService.selectDictionaryValueList("0b9ed538-29d6-11e5-965c-000c29d7a3a0");//加工类型
        List<Dictionary> teaArrt = dictionaryService.selectDictionaryValueList("31783870-956f-469f-b43e-9fefd905afca");//茶系
        List<Dictionary> machinProcess = dictionaryService.selectDictionaryValueList("1e12732d-246e-11e5-965c-000c29d7a3a0");//工序
        List<Dictionary> teaGrade = dictionaryService.selectDictionaryValueList("f63fe4f8-27ab-11e5-965c-000c29d7a3a0");//等级
        List<Dictionary> teaType = dictionaryService.selectDictionaryValueList("be0ba01c-23ad-11e5-965c-000c29d7a3a0");//品种
        List<Map> processBatchList = processBatchService.selectProcessBatchList(map);
        model.addAttribute("machinType",machinType);
        model.addAttribute("processBatchList",processBatchList);
        model.addAttribute("teaArrt",teaArrt);
        model.addAttribute("machinProcess",machinProcess);
        model.addAttribute("teaGrade",teaGrade);
        model.addAttribute("teaType",teaType);
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/origin/getMachinTeaList";
    }

    /**
     * Ajax 获取信息列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getMachinTeaDataList",method = RequestMethod.POST)
    @ResponseBody
    public Object getMachinTeaDataList(HttpServletRequest request,String datatable){
        message = false;
        data    = null;
        try {
            Map query = new HashMap();
            if (datatable != null && !datatable.isEmpty()){
                String jsonStr = StringEscapeUtil.unescapeHtml(datatable);
                Map params = JSON.parseObject(jsonStr,Map.class);
                Map status = JSON.parseObject(params.get("query").toString(),Map.class);
                if (status.size() > 0 && status.get("dicMacType") != ""){
                    query.put("dicMacType",status.get("dicMacType"));
                }
                if (status.size() > 0 && status.get("dicTeaAttr") != ""){
                    query.put("dicTeaAttr",status.get("dicTeaAttr"));
                }
                if (status.size() > 0 && status.get("dicMacPro") != ""){
                    query.put("dicMacPro",status.get("dicMacPro"));
                }
                if (status.size() > 0 && status.get("processBatchId") != ""){
                    query.put("processBatchId",status.get("processBatchId"));
                }
            }
            List<Map> MachinTeaList = machinTeaService.selectMachinTeaDataList(query);
            if(MachinTeaList.size() > 0){
                message = true;
                data = MachinTeaList;
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
    @RequestMapping(value = "/editMachinTeaItem", method = RequestMethod.GET)
    @ResponseBody
    public Object editMachinTeaItem(HttpServletRequest request,String id){
        message = false;
        data    = null;
        if (!id.isEmpty()){
            try {
                MachinTea machinTea = machinTeaService.selectByPrimaryKey(id);
                if(machinTea != null){
                    message = true;
                    data = machinTea;
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
     * 保存和编辑加工设置数据
     * @param request
     * @param machinTea
     * @param save
     * @return
     */
    @RequestMapping(value = "/saveOrUpdateMachinTea",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdateMachinTea(HttpServletRequest request, MachinTea machinTea , String save){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try{
            if(!machinTea.getId().isEmpty() && save != null && save.equals("edit")){
                int i = machinTeaService.updateByPrimaryKeySelective(machinTea);
                if(i > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_UPDATE;
                }else{
                    data    = ResultStateUtil.FAIL_UPDATE;
                }
            }else if(save.equals("add")) {
                machinTea.setId(UUID.randomUUID().toString());
                machinTea.setCreateId(user.getId());
                machinTea.setCreateTime(new Date());
                machinTea.setModifyId(user.getId());
                machinTea.setModifyTime(new Date());
                machinTea.setStatus(1);
                int insert = machinTeaService.insertSelective(machinTea);
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
    @RequestMapping(value="/delMachinTeaItem",method = RequestMethod.GET)
    @ResponseBody
    public Object delMachinTeaItem(HttpServletRequest request ,String id){
        message = false;
        data    = null;
        try{
            if (!id.isEmpty()){
                int i = machinTeaService.deleteByPrimaryKey(id);
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
