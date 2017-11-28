package com.panda.mapper.origin;

import com.panda.model.origin.ProcessBatch;

public interface ProcessBatchMapper {
    int deleteByPrimaryKey(String id);

    int insert(ProcessBatch record);

    int insertSelective(ProcessBatch record);

    ProcessBatch selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ProcessBatch record);

    int updateByPrimaryKey(ProcessBatch record);
}