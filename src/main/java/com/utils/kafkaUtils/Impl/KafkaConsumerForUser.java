package com.utils.kafkaUtils.Impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;
import com.utils.BeanAndString;
import com.utils.kafkaUtils.IKafkaDataConsumer;
import org.apache.log4j.Logger;

import javax.annotation.Resource;

/**
 * @Date: 2019/3/28 10:36
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: 消息处理实现类
 **/
public class KafkaConsumerForUser implements IKafkaDataConsumer{

    private static final Logger log = Logger.getLogger(KafkaConsumerForUser.class);

    private static final String user_key = "userkey";
    /**
     * @Date 10:45 2019/3/28
     * @Remark  userdao
     **/
//    @Resource
//    UserDao userDao;
    private final UserService userService;

    public KafkaConsumerForUser(UserService userService){
        this.userService = userService;
    }
    /**
     * @Date 10:43 2019/3/28
     * @Remark  操作用户表
     **/
    @Override
    public void dealKafkaMessage(String key, String value) {
        log.info(" kafka message , key : " + key + " ; value : " + value);
        if(user_key.equals(key)){
            User user = BeanAndString.StringToBean(value,User.class);
            log.info("用户值："+JSON.toJSONString(user));
            userService.add(user);
        }
    }
}
