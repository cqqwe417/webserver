package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiAccess;

public interface WiAccessReadMapper {
    WiAccess selectByPrimaryKey(Long id);
}