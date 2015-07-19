package com.huigou.webserver.dao.read;

import com.huigou.webserver.entity.WiFeedback;

public interface WiFeedbackReadMapper {
    WiFeedback selectByPrimaryKey(Long id);
}