package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiRandomImage;

public interface WiRandomImageReadMapper {
    WiRandomImage selectByPrimaryKey(Long id);
}