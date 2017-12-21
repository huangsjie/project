package com.panda.service.impl.origin;


import com.panda.mapper.origin.ProductionSetMapper;
import com.panda.model.origin.ProductionSet;
import com.panda.service.origin.ProductionSetService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;

import javax.annotation.Resource;

public class ProductionSetServiceImpl extends AbstractServiceImpl<ProductionSet> implements ProductionSetService {

    @Resource
    private ProductionSetMapper productionSetMapper;

    @Override
    protected AbstractMapper<ProductionSet> getAbstractMapper() {
        return productionSetMapper;
    }
}
