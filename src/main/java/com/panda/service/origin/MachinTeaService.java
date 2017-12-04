package com.panda.service.origin;

import com.panda.model.origin.MachinTea;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/11/28
 * Time: 22:21
 */
public interface MachinTeaService extends AbstractService<MachinTea> {
    /**
     * 查询所有的设置记录返回 List列表 包含设置的字典数据 入参 Map
     * (dicMacType,dicTeaAttr,dicMacPro,dicTeaType,dicTeaGra,status)
     * @param map
     * @return
     */
    List<Map> selectMachinTeaDataList(Map map);

    /**
     * 查询一条记录 返回 Map 包含设置的字典数据
     * @param id
     * @return
     */
    Map selectMachinTeaDataByOne(String id);

    /**
     * 根据加工批次号 获取该批次所用时间和产品名称
     * @param processBatchId
     * @return
     */
    Map selectMachinTimeAndMachinProduct(String processBatchId);
}
