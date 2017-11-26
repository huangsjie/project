package com.panda.service.impl.origin;

import com.panda.mapper.origin.TeaGardenManageListMapper;
import com.panda.model.origin.TeaGardenManageList;
import com.panda.service.origin.TeaGardenManageListService;
import com.panda.util.abs.AbstractMapper;
import com.panda.util.abs.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class TeaGardenManageListServiceImpl extends AbstractServiceImpl<TeaGardenManageList> implements TeaGardenManageListService{
    @Resource
    private TeaGardenManageListMapper  teaGardenManageListMapper;
    @Override
    protected AbstractMapper<TeaGardenManageList> getAbstractMapper(){
        return teaGardenManageListMapper;
    }

    /**
     * 获取茶园管理信息列表
     * @param map
     * @return
     */
    @Override
    public List<TeaGardenManageList> selectTeaGardenManageList(Map map){
        return teaGardenManageListMapper.selectTeaGardenManageList(map);
    }

}
