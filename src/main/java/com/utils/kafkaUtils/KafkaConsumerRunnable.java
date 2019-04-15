package com.utils.kafkaUtils;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import com.utils.kafkaUtils.Impl.KafkaConsumerForUser;
import kafka.consumer.ConsumerConfig;
import kafka.consumer.ConsumerIterator;
import kafka.consumer.KafkaStream;
import kafka.message.MessageAndMetadata;
import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * @Date: 2019/3/28 14:01
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: 消费者线程类
 **/
public class KafkaConsumerRunnable implements Runnable {

    private static final Logger log = Logger.getLogger(KafkaConsumerRunnable.class);

//    @Resource
//    IKafkaDataConsumer kafkaDataConsumer;

    private final IKafkaDataConsumer kafkaDataConsumer;

    private final UserService userService;

    public KafkaConsumerRunnable(ServletContextEvent sce){

        WebApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
        userService = (UserService) context.getBean("userServiceImpl");




        kafkaDataConsumer = new KafkaConsumerForUser(userService);

    }

    @Override
    public void run() {
        //获取配置信息
        Properties properties = ReadKafkaPropertiesUtils.getProperties();
        //获取主题
        String topic = ReadKafkaPropertiesUtils.getTopic();
        ConsumerConfig config = new ConsumerConfig(properties);
        Map<String,Integer> topicMap = new HashMap<String,Integer>();
        topicMap.put(topic,Integer.valueOf(1));
        kafka.javaapi.consumer.ConsumerConnector connector = kafka.consumer.Consumer.createJavaConsumerConnector(config);
        Map<String,List<KafkaStream<byte[],byte[]>>> consumerMap = connector.createMessageStreams(topicMap);
        KafkaStream<byte[],byte[]> stream = consumerMap.get(topic).get(0);
        ConsumerIterator<byte[],byte[]> iterator = stream.iterator();
        while (iterator.hasNext()){
            MessageAndMetadata<byte[],byte[]> obj =  iterator.next();
            if( obj.key() != null && obj.message() !=null){
                String key = new String(obj.key());
                String value = new String(obj.message());
                log.info(" kafka get message , key : " + key + " ; value : " + value);
                kafkaDataConsumer.dealKafkaMessage(key,value);
            }
        }
    }
}
