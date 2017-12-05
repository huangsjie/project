package com.panda.service.impl.origin;


import com.panda.model.origin.TeaGardenLog;
import com.panda.mapper.origin.TeaGardenLogMapper;
import com.panda.service.origin.TeaGardenLogService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class TeaGardenLogServiceImpl extends AbstractServiceImpl<TeaGardenLog> implements TeaGardenLogService {
    @Resource
    private TeaGardenLogMapper teaGardenLogMapper;
    @Override
    protected AbstractMapper<TeaGardenLog> getAbstractMapper(){
        return teaGardenLogMapper;
    }

    /**
     * 获取茶园管理信息列表
     * @param map
     * @return
     */
    @Override
    public List<TeaGardenLog> selectTeaGardenLogList(Map map) {
        return teaGardenLogMapper.selectTeaGardenLogList(map);
    }


    @Override
    public Map selectByPrimaryKey1(String id){
        return teaGardenLogMapper.selectByPrimaryKey1(id);
    }

}
