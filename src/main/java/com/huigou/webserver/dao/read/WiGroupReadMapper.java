package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiGroup;

public interface WiGroupReadMapper {
    WiGroup selectByPrimaryKey(Long id);
}