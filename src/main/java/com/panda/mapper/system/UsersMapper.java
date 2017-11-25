package com.panda.mapper.system;

import com.panda.model.system.Users;
import com.panda.util.abs.AbstractMapper;

import java.util.List;

public interface UsersMapper extends AbstractMapper<Users> {
    /**
     * 管理员登录
     * @param account
     * @return
     */
    Users selectManagerAccount(String account);
}