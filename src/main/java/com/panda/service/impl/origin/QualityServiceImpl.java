package com.panda.service.impl.origin;

import com.panda.mapper.origin.QualityMapper;
import com.panda.model.origin.Quality;
import com.panda.service.origin.QualityService;
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
public class QualityServiceImpl extends AbstractServiceImpl<Quality> implements QualityService {

    @Resource
    private QualityMapper qualityMapper;

    @Override
    protected AbstractMapper<Quality> getAbstractMapper() {
        return qualityMapper;
    }
}
