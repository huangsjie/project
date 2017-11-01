package com.panda.service.impl.system;

import com.panda.config.DruidConfig;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import com.panda.mapper.system.MenuMapper;
import com.panda.model.system.Menu;
import com.panda.service.system.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/10/21
 * Time: 18:27
 */
@Service
public class MenuServiceImpl extends AbstractServiceImpl<Menu> implements MenuService {

    private static final Logger logger = LoggerFactory.getLogger(DruidConfig.class);

    @Resource
    private MenuMapper menuMapper;

    @Override
    protected AbstractMapper<Menu> getAbstractMapper() {
        return menuMapper;
    }

    /**
     * 获取当前管理员所拥有的菜单列表
     * @param map
     * @return
     */
    @Override
    public List<Menu> selectManagerRoleMenuList(Map<String,String> map){
        List<Menu> menuList = null;
        try {
            menuList = menuMapper.selectManagerRoleMenuList(map);
            if(menuList != null && menuList.size() > 0){
                for (Menu menu: menuList) {
                    map.remove("parentId");
                    map.put("parentId",menu.getId());
                    menu.setChildMenuList(menuMapper.selectManagerRoleMenuList(map));
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.info("------->selectManagerRoleMenuList"+e.getMessage());
        }
        return menuList;
    }
}
