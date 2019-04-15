package com.utils.kafkaUtils;

/**
 * @Date 10:33 2019/3/28
 * @Remark 消息处理类接口
 **/
public interface IKafkaDataConsumer {

    /**
     * @Date 10:35 2019/3/28
     * @Remark 消息处理方法
     **/
    public void dealKafkaMessage(String key, String value);

}
