package com.panda.service.impl.system;

import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.MenuMapper;
import com.panda.model.system.Menu;
import com.panda.service.system.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:27
 */
@Service
public class MenuServiceImpl extends AbstractServiceImpl<Menu> implements MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    protected AbstractMapper<Menu> getAbstractMapper() {
        return menuMapper;
    }
}
