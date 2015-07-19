package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiMaterials;

public interface WiMaterialsWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiMaterials record);

    int insertSelective(WiMaterials record);

    int updateByPrimaryKeySelective(WiMaterials record);

    int updateByPrimaryKey(WiMaterials record);
}