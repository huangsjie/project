package com.panda.service.system;

import com.panda.util.abs.AbstractService;
import com.panda.model.system.Users;

import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/18
 * Time: 17:53
 */
public interface UsersService extends AbstractService<Users>{

    /**
     * 管理员登录
     * @param account
     * @return
     */
    Users selectManagerAccount(String account);

    /**
     * 查询用户信息和用户扩展信息
     * @param id
     * @return
     */
    Map selectUserAndUserInfo(String id);
}
