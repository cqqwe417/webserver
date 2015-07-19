package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiUser;

public interface WiUserReadMapper {
    WiUser selectByPrimaryKey(Long id);
}