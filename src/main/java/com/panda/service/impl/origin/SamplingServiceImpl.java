package com.panda.service.impl.origin;

import com.panda.mapper.origin.SamplingMapper;
import com.panda.model.origin.Sampling;
import com.panda.service.origin.SamplingService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/4
 * Time: 15:16
 */
@Service
public class SamplingServiceImpl extends AbstractServiceImpl<Sampling> implements SamplingService {

    @Resource
    private SamplingMapper samplingMapper;

    @Override
    protected AbstractMapper<Sampling> getAbstractMapper() {
        return samplingMapper;
    }
}
