package com.panda.service.impl.origin;

import com.panda.mapper.origin.ProcessBatchMapper;
import com.panda.model.origin.ProcessBatch;
import com.panda.service.origin.ProcessBatchService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

public class ProcessBatchServiceImpl extends AbstractServiceImpl<ProcessBatch> implements ProcessBatchService{

    @Resource
    private ProcessBatchMapper processBatchMapper;
    @Override
    protected AbstractMapper<ProcessBatch> getAbstractMapper() {
        return processBatchMapper;
    }

    /**
     * 获取加工批次列表
     * @param map
     * @return
     */
    @Override
    public List<Map> selectProcessBatchList(Map map){
        return processBatchMapper.selectProcessBatchList(map);
    }

}
