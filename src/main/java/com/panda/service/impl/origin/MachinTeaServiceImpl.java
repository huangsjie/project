package com.panda.service.impl.origin;


import com.panda.mapper.origin.MachinTeaMapper;
import com.panda.model.origin.MachinTea;
import com.panda.service.origin.MachinTeaService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/11/28
 * Time: 22:21
 */
@Service
public class MachinTeaServiceImpl extends AbstractServiceImpl<MachinTea> implements MachinTeaService {

    @Resource
    private MachinTeaMapper machinTeaMapper;

    @Override
    protected AbstractMapper<MachinTea> getAbstractMapper() {
        return machinTeaMapper;
    }
    /**
     * 查询所有的设置记录返回 List列表 包含设置的字典数据 入参 Map
     * (dicMacType,dicTeaAttr,dicMacPro,dicTeaType,dicTeaGra,status)
     * @param map
     * @return
     */
    @Override
    public List<Map> selectMachinTeaDataList(Map map) {
        return machinTeaMapper.selectMachinTeaDataList(map);
    }
    /**
     * 查询一条记录 返回 Map 包含设置的字典数据
     * @param id
     * @return
     */
    @Override
    public Map selectMachinTeaDataByOne(String id) {
        return machinTeaMapper.selectMachinTeaDataByOne(id);
    }
}
