package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiAccess;

public interface WiAccessWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiAccess record);

    int insertSelective(WiAccess record);

    int updateByPrimaryKeySelective(WiAccess record);

    int updateByPrimaryKey(WiAccess record);
}