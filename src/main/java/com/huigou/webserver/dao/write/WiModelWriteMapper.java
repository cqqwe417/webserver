package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiModel;

public interface WiModelWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiModel record);

    int insertSelective(WiModel record);

    int updateByPrimaryKeySelective(WiModel record);

    int updateByPrimaryKey(WiModel record);
}