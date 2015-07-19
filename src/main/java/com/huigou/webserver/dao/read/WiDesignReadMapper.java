package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiDesign;

public interface WiDesignReadMapper {
    WiDesign selectByPrimaryKey(Long id);
}