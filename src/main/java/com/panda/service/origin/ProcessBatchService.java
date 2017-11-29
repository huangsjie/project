package com.panda.service.origin;

import com.panda.model.origin.ProcessBatch;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface ProcessBatchService extends AbstractService<ProcessBatch> {

    /**
     * 获取加工批次列表
     * @param map
     * @return
     */
    List<Map> selectProcessBatchList(Map map);
}
