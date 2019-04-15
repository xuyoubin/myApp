package com.utils.kafkaUtils;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.apache.log4j.Logger;

import java.util.Properties;

/**
 * @Date: 2019/3/27 17:38
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: 生产者
 **/
public class KafkaProduce {
    private static final Logger log = Logger.getLogger(KafkaProduce.class);
    private static  final boolean SEND_MESSAGE_FAIL_CODE = false;
    private static final String SEND_MESSAHE_FAIL_NOTE = "fail message:";

    /**
     * @Date 17:44 2019/3/27
     * @Remark  发送消息
     **/
    public static void sendMsg(String topic,String key,String value){
        //获取配置信息
        Properties properties = ReadKafkaPropertiesUtils.getProperties();
        //实例化producer
        KafkaProducer<String,String> producer = new KafkaProducer<String, String>(properties);
        //封装消息
        ProducerRecord<String,String> pr = new ProducerRecord<String, String>(topic,key,value);
        producer.send(pr, new Callback() {
            //回调函数
            @Override
            public void onCompletion(RecordMetadata recordMetadata, Exception e) {
                if(null != e){
                    log.error("kafka send message fail"+e);
                    log.error("kafka send message fail;metadata:"+ JSON.toJSONString(recordMetadata));
                    throw new MyKafkaException(SEND_MESSAGE_FAIL_CODE,"kafka send message fail:"+e.getMessage());
                }
                log.info("发送kafka消息成功");
            }
        });
        producer.close();
    }

//    public static void main(String[] args) {
//        String topic = ReadKafkaPropertiesUtils.getTopic();
//        String key = "userkey";
//        String value = ""
//        sendMsg()
//
//    }
}
