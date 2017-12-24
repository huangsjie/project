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
    List<Map> selectAssemblySetDataList(Map map);


    /**
     * 查询绑定的设备信息
     * @param id
     * @return
     */
    Map selectAssemblyData(String id);

    /**
     * 新增，和编辑生产线设备，
     * @param assemblySet
     * @return
     */
    Integer saveOrUpdateAssemblySet(AssemblySet assemblySet);
}
