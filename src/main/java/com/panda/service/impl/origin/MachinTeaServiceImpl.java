package com.panda.service.impl.origin;


import com.panda.mapper.origin.MachinTeaMapper;
import com.panda.model.origin.MachinTea;
import com.panda.service.origin.MachinTeaService;
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
public class MachinTeaServiceImpl extends AbstractServiceImpl<MachinTea> implements MachinTeaService {

    @Resource
    private MachinTeaMapper machinTeaMapper;

    @Override
    protected AbstractMapper<MachinTea> getAbstractMapper() {
        return machinTeaMapper;
    }
}
