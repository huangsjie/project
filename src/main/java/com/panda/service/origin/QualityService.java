package com.panda.service.origin;

import com.panda.model.origin.Quality;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/4
 * Time: 15:15
 */
public interface QualityService extends AbstractService<Quality> {

    /**
     * 获取质检列表
     * @param map
     * @return
     */
    List<Map> selectQualityDataList(Map map);

    /**
     * 获取单条质检记录
     * @param id
     * @return
     */
    Map selectQualityDataMap(String id);
}
