package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiDesign;

public interface WiDesignWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiDesign record);

    int insertSelective(WiDesign record);

    int updateByPrimaryKeySelective(WiDesign record);

    int updateByPrimaryKey(WiDesign record);
}