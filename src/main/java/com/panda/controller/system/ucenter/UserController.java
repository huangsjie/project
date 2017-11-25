package com.panda.controller.system.ucenter;

import com.panda.model.system.Dictionary;
import com.panda.model.system.UserInfo;
import com.panda.model.system.Users;
import com.panda.service.system.DictionaryService;
import com.panda.service.system.UsersService;
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
import java.util.List;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/24
 * Time: 9:33
 */
@Controller
@RequestMapping("/system/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private UsersService usersService;
    @Resource
    private DictionaryService dictionaryService;
    private static boolean message = false;
    private static Object  data    = null;

    /**
     * 获取用户列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/getUserList",method = RequestMethod.GET)
    @RequiresPermissions("user:view")//权限管理;
    public String getUserList(HttpServletRequest request, Model model){
        List<Dictionary> userType = dictionaryService.selectDictionaryValueList("155a1b9b-5fbb-11e7-8697-38d547b81379");
        List<Dictionary> statusType = dictionaryService.selectDictionaryValueList("ba259a75-f5a7-4897-949f-1c90b7958b35");
        Users user= (Users) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("menuList",user.getMenuList());
        model.addAttribute("userType",userType);
        model.addAttribute("statusType",statusType);
        model.addAttribute("user",user);
        return "system/ucenter/getUserList";
    }

    @RequestMapping(value = "/getUserDataList")
    @ResponseBody
    public Object getUserDataList(HttpServletRequest request){
        message = false;
        data    = null;
        try {
            List<Users> usersList = usersService.selectAll();
            if(usersList.size() > 0){
                message = true;
                data = usersList;
            }else{
                data = ResultStateUtil.NO_MORE_DATA;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

    /**
     * Ajax 获取单条用户信息和扩展信息
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/getUserItem",method = RequestMethod.GET)
    @ResponseBody
    public Object getUserItem(HttpServletRequest request, String id){
        message = false;
        data    = null;
        try {
            if (id != null && !id.isEmpty()){
                Users user = usersService.selectByPrimaryKey(id);
                if (user != null){
                    message = true;
                    data    = user;
                }
            }else{
                data = ResultStateUtil.ERROR_PARAMETER_IS_EMPTY;
            }
        }catch (Exception e){
            e.printStackTrace();
            data = ResultStateUtil.NO_MORE_DATA;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

    /**
     * Ajax 保存 和 更新用户信息 包含用户 扩展信息 使用存储过程处理
     * @param request
     * @param user
     * @param userInfo
     * @return
     */
    @RequestMapping(value = "/saveUserOrUpdate",method = RequestMethod.POST)
    @ResponseBody
    public Object saveUserOrUpdate(HttpServletRequest request, Users user, UserInfo userInfo){
        message = false;
        data    = null;
        try {
            if (user != null){
                //Users user = usersService.selectByPrimaryKey(id);
                if (user != null){
                    message = true;
                    data    = user;
                }
            }else{
                data = ResultStateUtil.ERROR_PARAMETER_IS_EMPTY;
            }
        }catch (Exception e){
            e.printStackTrace();
            data = ResultStateUtil.NO_MORE_DATA;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }

    /**
     * Ajax 删除全部用户信息-软删除
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/delUserItem",method = RequestMethod.GET)
    @ResponseBody
    public Object delUserItem(HttpServletRequest request, String id){
        message = false;
        data    = null;
        try {
            if (!id.isEmpty()){
                int i= usersService.deleteByPrimaryKey(id);
                if(i > 0){
                    message = true;
                    data = ResultStateUtil.SUCCESS_DELETE;
                }else{
                    data = ResultStateUtil.ERROR_PARAMETER_NO_TCOMPATIBLE;
                }
            }else{
                data = ResultStateUtil.ERROR_PARAMETER_IS_EMPTY;
            }
        }catch (Exception e){
            e.printStackTrace();
            data    = ResultStateUtil.ERROR_DATABASE_OPERATION;
        }
        return ResultMsgUtil.getResultMsg(message,data);
    }
}
