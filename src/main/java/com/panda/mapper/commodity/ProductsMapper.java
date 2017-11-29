package com.panda.mapper.commodity;

import com.panda.model.commodity.Products;
import com.panda.util.abs.AbstractMapper;

import java.util.List;
import java.util.Map;

public interface ProductsMapper extends AbstractMapper<Products>{

    /**
     * 查询商品信息
     * @param map
     * @return
     */
    List<Products> selectProductsList(Map map);
}