package com.huigou.webserver.dao.write;

import com.huigou.webserver.entity.WiFeedback;

public interface WiFeedbackWriteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WiFeedback record);

    int insertSelective(WiFeedback record);

    int updateByPrimaryKeySelective(WiFeedback record);

    int updateByPrimaryKeyWithBLOBs(WiFeedback record);

    int updateByPrimaryKey(WiFeedback record);
}