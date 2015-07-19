package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiUserGroup;

public interface WiUserGroupReadMapper {
    WiUserGroup selectByPrimaryKey(Long id);
}