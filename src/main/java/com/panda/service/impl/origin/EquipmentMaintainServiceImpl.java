package com.panda.service.impl.origin;

import com.panda.mapper.origin.EquipmentMaintainMapper;
import com.panda.model.origin.EquipmentMaintain;
import com.panda.service.origin.EquipmentMaintainService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/25
 * Time: 11:44
 */
@Service
public class EquipmentMaintainServiceImpl extends AbstractServiceImpl<EquipmentMaintain> implements EquipmentMaintainService {

    @Resource
    private EquipmentMaintainMapper equipmentMaintainMapper;

    @Override
    protected AbstractMapper<EquipmentMaintain> getAbstractMapper() {
        return equipmentMaintainMapper;
    }

    /**
     * 获取设备维护保养记录
     * @param map
     * @return
     */
    @Override
    public List<Map> selectEquipmentMaintainDataList(Map map){
        return equipmentMaintainMapper.selectEquipmentMaintainDataList(map);
    }

    /**
     * 获取设备维护，保养信息
     * @param id
     * @return
     */
    @Override
    public Map selectEquipmentMaintainDataItem(String id){
        return equipmentMaintainMapper.selectEquipmentMaintainDataItem(id);
    }
}
