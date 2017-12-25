package com.panda.service.origin;

import com.panda.model.origin.EquipmentMaintain;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/25
 * Time: 11:43
 */
public interface EquipmentMaintainService extends AbstractService<EquipmentMaintain> {

    /**
     * 获取设备维护保养记录
     * @param map
     * @return
     */
    List<Map> selectEquipmentMaintainDataList(Map map);

    /**
     * 获取设备维护，保养信息
     * @param id
     * @return
     */
    Map selectEquipmentMaintainDataItem(String id);
}
