package com.panda.service.impl.origin;

import com.panda.mapper.origin.OriginBatchMapper;
import com.panda.model.origin.OriginBatch;
import com.panda.service.origin.OriginBatchService;
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
public class OriginBatchServiceImpl extends AbstractServiceImpl<OriginBatch> implements OriginBatchService {

    @Resource
    private OriginBatchMapper originBatchMapper;

    @Override
    protected AbstractMapper<OriginBatch> getAbstractMapper() {
        return originBatchMapper;
    }
}
