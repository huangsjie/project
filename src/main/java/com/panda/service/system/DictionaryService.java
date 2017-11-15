package com.panda.service.system;

import com.panda.util.abs.AbstractService;
import com.panda.model.system.Dictionary;

import java.util.List;

/**
 * Created with IDEA.
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:23
 */
public interface DictionaryService extends AbstractService<Dictionary>{

    /**
     * 获取当前字典的属性
     * @return
     */
    List<Dictionary> selectDictionaryValueList(String parentId);
}
