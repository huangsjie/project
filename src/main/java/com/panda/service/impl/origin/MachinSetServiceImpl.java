package com.panda.service.impl.origin;

import com.panda.mapper.origin.MachinSetMapper;
import com.panda.model.origin.MachinSet;
import com.panda.model.origin.MachinTea;
import com.panda.service.origin.MachinSetService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/11/28
 * Time: 22:21
 */
@Service
public class MachinSetServiceImpl extends AbstractServiceImpl<MachinSet> implements MachinSetService {

    @Resource
    private MachinSetMapper machinSetMapper;

    @Override
    protected AbstractMapper<MachinSet> getAbstractMapper() {
        return machinSetMapper;
    }
}
