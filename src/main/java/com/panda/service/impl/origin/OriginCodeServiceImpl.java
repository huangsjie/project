package com.panda.service.impl.origin;

import com.panda.mapper.origin.OriginCodeMapper;
import com.panda.model.origin.OriginBatch;
import com.panda.model.origin.OriginCode;
import com.panda.service.origin.OriginBatchService;
import com.panda.service.origin.OriginCodeService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/12/7
 * Time: 10:54
 */
@Service
public class OriginCodeServiceImpl extends AbstractServiceImpl<OriginCode> implements OriginCodeService {

    @Resource
    private OriginCodeMapper originCodeMapper;

    @Override
    protected AbstractMapper<OriginCode> getAbstractMapper() {
        return originCodeMapper;
    }
}
