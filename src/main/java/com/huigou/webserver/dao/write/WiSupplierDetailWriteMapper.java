package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiSupplierDetail;

public interface WiSupplierDetailWriteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WiSupplierDetail record);

    int insertSelective(WiSupplierDetail record);

    int updateByPrimaryKeySelective(WiSupplierDetail record);

    int updateByPrimaryKey(WiSupplierDetail record);
}