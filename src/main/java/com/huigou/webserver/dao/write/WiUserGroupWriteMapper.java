package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiUserGroup;

public interface WiUserGroupWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiUserGroup record);

    int insertSelective(WiUserGroup record);

    int updateByPrimaryKeySelective(WiUserGroup record);

    int updateByPrimaryKey(WiUserGroup record);
}