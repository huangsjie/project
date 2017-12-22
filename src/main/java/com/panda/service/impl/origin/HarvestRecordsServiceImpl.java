package com.panda.service.impl.origin;

import com.panda.mapper.origin.HarvestRecordsMapper;
import com.panda.model.origin.HarvestRecords;
import com.panda.service.origin.HarvestRecordsService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/21
 * Time: 17:48
 */
@Service
public class HarvestRecordsServiceImpl extends AbstractServiceImpl<HarvestRecords> implements HarvestRecordsService {

    @Resource
    private HarvestRecordsMapper harvestRecordsMapper;


    @Override
    protected AbstractMapper<HarvestRecords> getAbstractMapper() {
        return harvestRecordsMapper;
    }

    /**
     * 获取茶青采摘记录
     * @param map
     * @return
     */
    @Override
    public List<Map> selectHarvestRecordsList(Map map){
        return harvestRecordsMapper.selectHarvestRecordsList(map);
    }

    /**
     * 获取茶青采摘记录编号 和 Id
     * @param map
     * @return
     */
    @Override
    public List<Map> selectHarvestRecordsListPickNum(Map map){
        return harvestRecordsMapper.selectHarvestRecordsListPickNum(map);
    }

    /**
     * 获取当前编辑项详细信息
     * @param id
     * @return
     */
    @Override
    public Map selectHarvestRecordsItem(String id){
        return harvestRecordsMapper.selectHarvestRecordsItem(id);
    }
}
