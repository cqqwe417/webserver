package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiUser;

public interface WiUserWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiUser record);

    int insertSelective(WiUser record);

    int updateByPrimaryKeySelective(WiUser record);

    int updateByPrimaryKey(WiUser record);
}