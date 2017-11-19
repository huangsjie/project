package com.panda.mapper.origin;

import com.panda.model.origin.SamplingList;

public interface SamplingListMapper {
    int deleteByPrimaryKey(String id);

    int insert(SamplingList record);

    int insertSelective(SamplingList record);

    SamplingList selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SamplingList record);

    int updateByPrimaryKey(SamplingList record);
}