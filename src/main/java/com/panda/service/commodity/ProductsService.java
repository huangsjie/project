package com.panda.service.commodity;

import com.panda.model.commodity.Products;
import com.panda.util.abs.AbstractService;

import java.util.List;
import java.util.Map;

public interface ProductsService extends AbstractService<Products>{

    /**
     * 查询商品信息
     * @param map
     * @return
     */
    List<Products> selectProductsList(Map map);
}