package com.panda.mapper.origin;

import com.panda.model.origin.Warehouse;

public interface WarehouseMapper {
    int deleteByPrimaryKey(String id);

    int insert(Warehouse record);

    int insertSelective(Warehouse record);

    Warehouse selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Warehouse record);

    int updateByPrimaryKey(Warehouse record);
}