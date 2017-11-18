package com.panda.service.impl.origin;

import com.panda.model.origin.ProcessingStepInfo;
import com.panda.service.origin.ProcessingStepInfoService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class ProcessingStepInfoServiceImpl extends AbstractServiceImpl<ProcessingStepInfo> implements ProcessingStepInfoService{

    @Override
    protected AbstractMapper<ProcessingStepInfo> getAbstractMapper() {
        return null;
    }
}
