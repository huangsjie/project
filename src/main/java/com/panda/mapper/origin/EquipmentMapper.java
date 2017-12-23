package com.panda.mapper.origin;

import com.panda.model.origin.Equipment;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface EquipmentMapper extends AbstractMapper<Equipment>{

    /**
     * 获取设备信息
     * @param map
     * @return
     */
    List<Equipment> selectEquipmentDataList(Map map);
}