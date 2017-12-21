package com.panda.controller.system.origin;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.origin.MachinTea;
import com.panda.model.system.Dictionary;
import com.panda.model.system.Users;
import com.panda.service.origin.MachinTeaService;
import com.panda.service.origin.ProcessBatchService;
import com.panda.service.system.DictionaryService;
import com.panda.util.DateUtil;
import com.panda.util.ResultMsgUtil;
import com.panda.util.ResultStateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
    private ProcessBatchService processBatchService;

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
     * 鲜叶
     * @return
     */
    @RequestMapping(value = "/pick",method= RequestMethod.GET)
    @RequiresPermissions("machinTea:view")//权限管理;
    public String getMachinTeaListPick(HttpServletRequest request, Model model){
        machinTeaPageShow(request,model,"43512930-9822-48b4-b577-e900c4a12504");
        return "system/origin/getMachinTeaList";
    }
    /**
     * 萎凋
     * @return
     */
    @RequestMapping(value = "/wither",method= RequestMethod.GET)
    @RequiresPermissions("machinTea:view")//权限管理;
    public String getMachinTeaListWither(HttpServletRequest request, Model model){
        machinTeaPageShow(request,model,"43512930-9822-48b4-b577-e900c4a12504");
        return "system/origin/getMachinTeaList";
    }
    /**
     * 杀青
     * @return
     */
    @RequestMapping(value = "/killOut",method= RequestMethod.GET)
    @RequiresPermissions("machinTea:view")//权限管理;
    public String getMachinTeaListKillOut(HttpServletRequest request, Model model){
        machinTeaPageShow(request,model,"43512930-9822-48b4-b577-e900c4a12504");
        return "system/origin/getMachinTeaList";
    }
    /**
     * 揉捻
     * @return
     */
    @RequestMapping(value = "/rolling",method= RequestMethod.GET)
    @RequiresPermissions("machinTea:view")//权限管理;
    public String getMachinTeaListRolling(HttpServletRequest request, Model model){
        machinTeaPageShow(request,model,"43512930-9822-48b4-b577-e900c4a12504");
        return "system/origin/getMachinTeaList";
    }
    /**
     * 发酵
     * @return
     */
    @RequestMapping(value = "/fermentation",method= RequestMethod.GET)
    @RequiresPermissions("machinTea:view")//权限管理;
    public String getMachinTeaListFermentation(HttpServletRequest request, Model model){
        machinTeaPageShow(request,model,"43512930-9822-48b4-b577-e900c4a12504");
        return "system/origin/getMachinTeaList";
    }
    /**
     * 干燥
     * @return
     */
    @RequestMapping(value = "/dry",method= RequestMethod.GET)
    @RequiresPermissions("machinTea:view")//权限管理;
    public String getMachinTeaListDry(HttpServletRequest request, Model model){
        machinTeaPageShow(request,model,"43512930-9822-48b4-b577-e900c4a12504");
        return "system/origin/getMachinTeaList";
    }
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

    private void machinTeaPageShow(HttpServletRequest request, Model model,String type){
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
     * 获取加工批次绑定的产品和加工流程
     * @param dicMacPro
     * @param dicMacType
     * @param processBatchId
     * @return
     */
    @RequestMapping(value = "/getMachinSetData", method = RequestMethod.GET)
    @ResponseBody
    public Object getMachinSetData(String dicMacPro, String dicMacType, String processBatchId){
        message = false;
        data    = null;
        try {
            if (!dicMacPro.isEmpty() && !dicMacType.isEmpty() && !processBatchId.isEmpty()){
                Map query = new HashMap();
                query.put("dicMacPro",dicMacPro);
                query.put("dicMacType",dicMacType);
                query.put("processBatchId",processBatchId);
                Map machinSet = processBatchService.selectProcessBatchBundMachinSetData(query);
                if (machinSet != null && machinSet.size() > 0){
                    //1分，2时，3天
                    int durationType = machinSet.get("duration_type")==null ? 0 :(Integer) machinSet.get("duration_type");
                    int begin_time   = machinSet.get("begin_duration")==null ? 0 :(Integer) machinSet.get("begin_duration");
                    int end_time     = machinSet.get("end_duration")==null ? 0 :(Integer) machinSet.get("begin_duration");
                    if (end_time > begin_time){
                        machinSet.put("endTime",DateUtil.nowTimeAddMinuteOrHourOrDay(new Date(),durationType,end_time));
                        machinSet.put("beginTime",DateUtil.nowTimeAddMinuteOrHourOrDay(new Date(),durationType,begin_time));
                    }else if (begin_time == end_time){
                        machinSet.put("beginTime",DateUtil.nowTimeAddMinuteOrHourOrDay(new Date(),0,0));
                        machinSet.put("endTime",DateUtil.nowTimeAddMinuteOrHourOrDay(new Date(),durationType,end_time));
                    }else{
                        machinSet.put("endTime",DateUtil.nowTimeAddMinuteOrHourOrDay(new Date(),durationType,begin_time));
                        machinSet.put("beginTime",DateUtil.nowTimeAddMinuteOrHourOrDay(new Date(),durationType,end_time));
                    }
                    message = true;
                    data    = machinSet;
                }else{
                    data    = "加工批次 或 加工设置 未绑定对应的产品或未设置对应的工序.";
                }
            }else{
            data    = ResultStateUtil.ERROR_PARAMETER_IS_EMPTY;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_QUERY+", 未设置的组合";
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
     * 注意新增时 数据库使用了联合唯一索引,防止重复添加操作工序
     * alter ignore table e_machin_tea add unique index(process_batch_id, dic_mac_type, dic_mac_pro)
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
            data  = ResultStateUtil.ERROR_DATABASE_OPERATION+"或工序重复.";
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
