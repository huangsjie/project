package com.panda.service.impl.system;

import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.UserInfoMapper;
import com.panda.model.system.UserInfo;
import com.panda.service.system.UserInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:34
 */
@Service
public class UserInfoServiceImpl extends AbstractServiceImpl<UserInfo> implements UserInfoService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    protected AbstractMapper<UserInfo> getAbstractMapper() {
        return userInfoMapper;
    }
}
