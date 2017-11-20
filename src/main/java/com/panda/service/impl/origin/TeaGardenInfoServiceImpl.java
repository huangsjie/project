package com.panda.service.impl.origin;

import com.panda.mapper.origin.TeaGardenInfoMapper;
import com.panda.model.origin.TeaGardenInfo;
import com.panda.service.origin.TeaGardenInfoService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TeaGardenInfoServiceImpl extends AbstractServiceImpl<TeaGardenInfo> implements TeaGardenInfoService {

    @Resource
    private TeaGardenInfoMapper teaGardenInfoMapper;

    @Override
    protected AbstractMapper<TeaGardenInfo> getAbstractMapper() {
        return teaGardenInfoMapper;
    }
}
