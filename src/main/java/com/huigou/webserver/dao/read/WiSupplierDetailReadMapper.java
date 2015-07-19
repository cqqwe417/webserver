package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiSupplierDetail;

public interface WiSupplierDetailReadMapper {
    WiSupplierDetail selectByPrimaryKey(Integer id);
}