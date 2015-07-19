package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiMaterials;

public interface WiMaterialsReadMapper {
    WiMaterials selectByPrimaryKey(Long id);
}