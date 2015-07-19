package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiGroup;

public interface WiGroupWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiGroup record);

    int insertSelective(WiGroup record);

    int updateByPrimaryKeySelective(WiGroup record);

    int updateByPrimaryKey(WiGroup record);
}