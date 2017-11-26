package com.panda.service.impl.origin;

import com.panda.mapper.origin.TeaGardenInfoMapper;
import com.panda.model.origin.TeaGardenInfo;
import com.panda.service.origin.TeaGardenInfoService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class TeaGardenInfoServiceImpl extends AbstractServiceImpl<TeaGardenInfo> implements TeaGardenInfoService {

    @Resource
    private TeaGardenInfoMapper teaGardenInfoMapper;

    @Override
    protected AbstractMapper<TeaGardenInfo> getAbstractMapper() {
        return teaGardenInfoMapper;
    }

    /**
     * 获取茶园信息列表
     * @param map
     * @return
     */
    @Override
    public List<TeaGardenInfo> selectTeaGardenList(Map map){
        return teaGardenInfoMapper.selectTeaGardenList(map);
    }
}
