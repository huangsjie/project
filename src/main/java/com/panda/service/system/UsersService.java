package com.panda.service.system;

import com.panda.util.abs.AbstractService;
import com.panda.model.system.Users;

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
}
