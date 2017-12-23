package com.panda.service.origin;

import com.panda.model.origin.AssemblySet;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface AssemblySetService extends AbstractService<AssemblySet>{

    /**
     * 获取生产线信息
     * @param map
     * @return
     */
    List<AssemblySet> selectAssemblySetDataList(Map map);
}
