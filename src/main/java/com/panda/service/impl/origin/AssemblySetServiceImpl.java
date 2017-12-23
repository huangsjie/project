package com.panda.service.impl.origin;

import com.panda.mapper.origin.AssemblySetMapper;
import com.panda.model.origin.AssemblySet;
import com.panda.service.origin.AssemblySetService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class AssemblySetServiceImpl extends AbstractServiceImpl<AssemblySet> implements AssemblySetService {

    @Resource
    private AssemblySetMapper assemblySetMapper;

    @Override
    protected AbstractMapper<AssemblySet> getAbstractMapper() {
        return assemblySetMapper;
    }

    /**
     * 获取生产线信息
     * @param map
     * @return
     */
    @Override
    public List<AssemblySet> selectAssemblySetDataList(Map map){
        return assemblySetMapper.selectAssemblySetDataList(map);
    }
}
