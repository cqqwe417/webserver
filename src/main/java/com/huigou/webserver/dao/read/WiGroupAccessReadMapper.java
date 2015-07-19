package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiGroupAccess;

public interface WiGroupAccessReadMapper {
    WiGroupAccess selectByPrimaryKey(Long id);
}