package com.panda.service.impl.origin;

import com.panda.mapper.origin.MachineInfoMapper;
import com.panda.model.origin.MachineInfo;
import com.panda.service.origin.MachineInfoService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;

import javax.annotation.Resource;

public class MachineInfoServiceImpl  extends AbstractServiceImpl<MachineInfo> implements MachineInfoService {

    @Resource
    private MachineInfoMapper machineInfoMapper;

    @Override
    protected AbstractMapper<MachineInfo> getAbstractMapper() {
        return machineInfoMapper;
    }
}
