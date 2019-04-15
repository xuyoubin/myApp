package com.utils.kafkaUtils;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @Date: 2019/3/27 17:02
 * @Author: ybxu
 * @Version: 1.0
 * @Remark:  kafka读取配置文件
 **/
public class ReadKafkaPropertiesUtils {
    private static  final Logger log = Logger.getLogger(ReadKafkaPropertiesUtils.class);
    /**
     * @Date 17:03 2019/3/27
     * @Remark 属性
     **/
    private static Properties properties;
    /**
     * @Date 17:18 2019/3/27
     * @Remark 私有构造函数
     **/
    private ReadKafkaPropertiesUtils(){}

    /**
     * @Date 17:24 2019/3/27
     * @Remark 读取配置信息
     **/
    static {
        log.info("read kafka properties begin");
        try {
            InputStream in = ReadKafkaPropertiesUtils.class.getClassLoader().getResourceAsStream("kafka.properties");
            properties = new Properties();
            properties.load(in);
            log.info("read kafka properties end");
        } catch (IOException e) {
            e.printStackTrace();
            log.error("read kafka properties fail");
        }
    }

    /**
     * @Date 17:25 2019/3/27
     * @Remark  返回配置信息
     **/
    public static Properties getProperties(){
        return properties;
    }
    public static String getTopic(){
        return properties.getProperty("kafka.consumer.topic");
    }


}
