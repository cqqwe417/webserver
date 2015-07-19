package com.huigou.webserver.utils;

import java.io.IOException;
import java.util.Properties;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * 从数据库里读取配置 实现参考http://forum.springsource.org/showthread.php?t=57246
 */
public class MutilPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
    @Override
    protected Properties mergeProperties() throws IOException {
        Properties mergeProperties = super.mergeProperties();
        mergeProperties.put("test1", "小朋友！有没有桃？");
        mergeProperties.put("test2", "有!");
        return mergeProperties;
    }

}