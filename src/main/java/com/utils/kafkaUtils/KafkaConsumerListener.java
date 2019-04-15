package com.utils.kafkaUtils;

import org.apache.log4j.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @Date: 2019/3/28 14:59
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: 消费者监听类
 **/
public class KafkaConsumerListener implements ServletContextListener{
    private static final Logger log = Logger.getLogger(KafkaConsumerListener.class);
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.info("启动kafka监听器");
        Thread t = new Thread(new KafkaConsumerRunnable(sce));
        t.start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
