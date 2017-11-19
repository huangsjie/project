package com.panda.mapper.origin;

import com.panda.model.origin.StockList;

public interface StockListMapper {
    int deleteByPrimaryKey(String id);

    int insert(StockList record);

    int insertSelective(StockList record);

    StockList selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(StockList record);

    int updateByPrimaryKey(StockList record);
}