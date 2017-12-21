package com.panda.mapper.origin;

import com.panda.model.origin.HarvestRecords;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface HarvestRecordsMapper extends AbstractMapper<HarvestRecords> {

    /**
     * 获取茶青采摘记录
     * @param map
     * @return
     */
    List<Map> selectHarvestRecordsList(Map map);

    /**
     * 获取茶青采摘记录编号 和 Id
     * @param map
     * @return
     */
    List<Map> selectHarvestRecordsListPickNum(Map map);

}