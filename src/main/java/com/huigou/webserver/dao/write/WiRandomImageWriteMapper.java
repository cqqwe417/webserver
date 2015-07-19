package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiRandomImage;

public interface WiRandomImageWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiRandomImage record);

    int insertSelective(WiRandomImage record);

    int updateByPrimaryKeySelective(WiRandomImage record);

    int updateByPrimaryKey(WiRandomImage record);
}