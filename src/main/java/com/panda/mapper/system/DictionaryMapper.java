package com.panda.mapper.system;

import com.panda.util.abs.AbstractMapper;
import com.panda.model.system.Dictionary;

import java.util.List;

public interface DictionaryMapper extends AbstractMapper<Dictionary>{

    /**
     * 获取当前字典的属性
     * @return
     */
    List<Dictionary> selectDictionaryValueList(String parentId);

}