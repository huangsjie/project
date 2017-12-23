package com.panda.service.origin;

import com.panda.model.origin.Equipment;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface EquipmentService extends AbstractService<Equipment> {

    /**
     * 获取设备信息
     * @param map
     * @return
     */
    List<Equipment> selectEquipmentDataList(Map map);
}
