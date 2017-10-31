package com.panda.util.abs;

import com.panda.model.system.PageRole;

import java.util.List;
import java.util.Map;

/**
 * 抽象 mapper接口
 * Created with IDEA.
 * User: Alan
 * Date: 2017/10/18
 * Time: 17:13
 */

public interface AbstractMapper<T> {

    int deleteByPrimaryKey(String id);

    int insert(T record);

    int insertSelective(T entity);

    T selectByPrimaryKey(String id);

    List<T> selectAll();

    int updateByPrimaryKey(T entity);

    int updateByPrimaryKeySelective(T entity);

}
