package com.panda.service.origin;

import com.panda.model.origin.Sampling;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/12/4
 * Time: 15:15
 */
public interface SamplingService extends AbstractService<Sampling> {

    /**
     * 获取取样记录
     * @param map
     * @return
     */
    List<Map> selectSamplingDataList(Map map);
}
