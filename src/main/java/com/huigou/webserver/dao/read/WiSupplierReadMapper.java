package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiSupplier;

public interface WiSupplierReadMapper {
    WiSupplier selectByPrimaryKey(Long id);
}