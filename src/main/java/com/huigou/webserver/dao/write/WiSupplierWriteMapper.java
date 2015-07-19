package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiSupplier;

public interface WiSupplierWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiSupplier record);

    int insertSelective(WiSupplier record);

    int updateByPrimaryKeySelective(WiSupplier record);

    int updateByPrimaryKey(WiSupplier record);
}