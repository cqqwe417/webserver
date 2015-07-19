package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiSupplierPrice;

public interface WiSupplierPriceWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiSupplierPrice record);

    int insertSelective(WiSupplierPrice record);

    int updateByPrimaryKeySelective(WiSupplierPrice record);

    int updateByPrimaryKey(WiSupplierPrice record);
}