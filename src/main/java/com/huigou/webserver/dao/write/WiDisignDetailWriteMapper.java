package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiDisignDetail;

public interface WiDisignDetailWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiDisignDetail record);

    int insertSelective(WiDisignDetail record);

    int updateByPrimaryKeySelective(WiDisignDetail record);

    int updateByPrimaryKey(WiDisignDetail record);
}