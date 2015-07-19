package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiModelMaterials;

public interface WiModelMaterialsWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiModelMaterials record);

    int insertSelective(WiModelMaterials record);

    int updateByPrimaryKeySelective(WiModelMaterials record);

    int updateByPrimaryKey(WiModelMaterials record);
}