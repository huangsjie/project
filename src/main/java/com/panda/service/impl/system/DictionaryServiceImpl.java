package com.panda.service.impl.system;

import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.DictionaryMapper;
import com.panda.model.system.Dictionary;
import com.panda.service.system.DictionaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:25
 */
@Service
public class DictionaryServiceImpl extends AbstractServiceImpl<Dictionary> implements DictionaryService{

    @Resource
    private DictionaryMapper dictionaryMapper;

    @Override
    protected AbstractMapper<Dictionary> getAbstractMapper() {
        return dictionaryMapper;
    }

}
