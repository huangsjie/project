package com.panda.mapper.origin;

import com.panda.model.origin.QualityControlList;

public interface QualityControlListMapper {
    int deleteByPrimaryKey(String id);

    int insert(QualityControlList record);

    int insertSelective(QualityControlList record);

    QualityControlList selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(QualityControlList record);

    int updateByPrimaryKey(QualityControlList record);
}