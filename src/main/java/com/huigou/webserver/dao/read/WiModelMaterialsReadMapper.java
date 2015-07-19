package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiModelMaterials;

public interface WiModelMaterialsReadMapper {
    WiModelMaterials selectByPrimaryKey(Long id);
}