package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiModel;

public interface WiModelReadMapper {
    WiModel selectByPrimaryKey(Long id);
}