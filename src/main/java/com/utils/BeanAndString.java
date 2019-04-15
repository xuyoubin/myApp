package com.utils;

import com.alibaba.fastjson.JSON;
import org.apache.poi.ss.formula.functions.T;

/**
 * @Date: 2019/3/28 13:34
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: bean 和 string  互转
 **/
public class BeanAndString {

    /**
     * @Date 13:47 2019/3/28
     * @Remark bean 转为string
     **/
    public static <T> String beanToString(T value){
        Class<?> clazz = value.getClass();
        if(clazz == int.class || clazz == Integer.class){
            return value+"";
        }else if(clazz == String.class){
            return (String)value;
        }else if(clazz == long.class || clazz == Long.class){
            return value+"";
        }else{
            return JSON.toJSONString(value);
        }

    }

    /**
     * @Date 13:54 2019/3/28
     * @Remark String 转 bean
     **/
    public static <T> T StringToBean(String value,Class<T> clazz){
        if(value == null || value.length()<=0 || clazz == null){
            return null;
        }
        if(clazz == int.class || clazz == Integer.class){
            return (T)Integer.valueOf(value);
        }else if(clazz == String.class){
            return (T)value;
        }else if(clazz == long.class || clazz == Long.class){
            return (T)Long.valueOf(value);
        }else{
            return JSON.toJavaObject(JSON.parseObject(value),clazz);
        }
    }
}
