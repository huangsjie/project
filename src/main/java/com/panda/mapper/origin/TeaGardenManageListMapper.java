package com.panda.mapper.origin;

import com.panda.model.origin.TeaGardenManageList;

public interface TeaGardenManageListMapper {
    int deleteByPrimaryKey(String id);

    int insert(TeaGardenManageList record);

    int insertSelective(TeaGardenManageList record);

    TeaGardenManageList selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TeaGardenManageList record);

    int updateByPrimaryKey(TeaGardenManageList record);
}