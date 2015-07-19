package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiGroupAccess;

public interface WiGroupAccessWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiGroupAccess record);

    int insertSelective(WiGroupAccess record);

    int updateByPrimaryKeySelective(WiGroupAccess record);

    int updateByPrimaryKey(WiGroupAccess record);
}