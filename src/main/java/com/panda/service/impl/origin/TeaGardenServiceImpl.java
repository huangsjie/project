package com.panda.service.impl.origin;

import com.panda.mapper.origin.TeaGardenMapper;
import com.panda.model.origin.TeaGarden;
import com.panda.service.origin.TeaGardenService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class TeaGardenServiceImpl extends AbstractServiceImpl<TeaGarden> implements TeaGardenService {

    @Resource
    private TeaGardenMapper teaGardenMapper;

    @Override
    protected AbstractMapper<TeaGarden> getAbstractMapper() {
        return teaGardenMapper;
    }

    /**
     * 获取茶园信息列表
     * @param map
     * @return
     */
    @Override
    public List<Map> selectTeaGardenList(Map map){
        return teaGardenMapper.selectTeaGardenList(map);
    }
}
