package com.panda.controller.system.commodity;

import com.alibaba.citrus.util.StringEscapeUtil;
import com.alibaba.fastjson.JSON;
import com.panda.model.commodity.Products;
import com.panda.model.system.Users;
import com.panda.service.commodity.ProductsService;
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

@Controller
@RequestMapping("/system/products")
public class ProductsController {

    @Resource
    private ProductsService productsService;

    private static boolean message = false;
    private static Object  data    = null;


    /**
     * 获取产品
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    @RequiresPermissions("products:view")
    public String getProductsList(HttpServletRequest request, Model model){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("user",user);
        return "system/commodity/getProductsList";
    }

    /**
     * 获取产品数据
     * @param request
     * @return
     */
    @RequestMapping(value = "/getProductsDataList")
    @ResponseBody
    public Object getProductsDataList(HttpServletRequest request, String datatable){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try {
            Map map = new HashMap();
            if (datatable != null && !datatable.isEmpty()){
                String jsonStr = StringEscapeUtil.unescapeHtml(datatable);
                Map params = JSON.parseObject(jsonStr,Map.class);
                Map query = JSON.parseObject(params.get("query").toString(),Map.class);
                if (query.size() > 0 && query.get("status") != ""){
                    map.put("status",query.get("status"));
                }
            }
            List<Products> ProductsList = productsService.selectProductsList(map);
            if(ProductsList.size() > 0){
                message = true;
                data = ProductsList;
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
    @RequestMapping(value = "/editProductsItem", method = RequestMethod.GET)
    @ResponseBody
    public Object editProductsItem(HttpServletRequest request,String id){
        message = false;
        data    = null;
        if (!id.isEmpty()){
            try {
                Products products = productsService.selectByPrimaryKey(id);
                if(products != null){
                    message = true;
                    data = products;
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
     * @param products
     * @param save
     * @return
     */
    @RequestMapping(value = "/saveOrUpdateProducts",method = RequestMethod.POST)
    @ResponseBody
    public Object saveOrUpdateProducts(HttpServletRequest request, Products products , String save){
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        message = false;
        data    = null;
        try{
            if(!products.getId().isEmpty() && save != null && save.equals("edit")){
                int i = productsService.updateByPrimaryKeySelective(products);
                if(i > 0){
                    message = true;
                    data    = ResultStateUtil.SUCCESS_UPDATE;
                }else{
                    data    = ResultStateUtil.FAIL_UPDATE;
                }
            }else if(save.equals("add")) {
                products.setId(UUID.randomUUID().toString());
                products.setCreateId(user.getId());
                products.setCreateTime(new Date());
                products.setModifyId(user.getId());
                products.setModifyTime(new Date());
                products.setStatus(1);
                int insert = productsService.insertSelective(products);
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
    @RequestMapping(value="/delProductsItem",method = RequestMethod.GET)
    @ResponseBody
    public Object delProductsItem(HttpServletRequest request ,String id){
        message = false;
        data    = null;
        try{
            if (!id.isEmpty()){
                int i = productsService.deleteByPrimaryKey(id);
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