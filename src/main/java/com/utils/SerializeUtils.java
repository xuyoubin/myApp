package com.utils;

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;
import org.apache.log4j.Logger;
import sun.rmi.runtime.Log;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * @Date: 2019/3/21 21:56
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: 序列化工具
 **/
public class SerializeUtils {
    private static final Logger log = Logger.getLogger(SerializeUtils.class);

    /**
     * @Date 22:13 2019/3/21
     * @Remark 序列化
     **/
    public static byte[] serialize(Object o)throws Exception{
        if(o == null) {
            return null;
        }
        ByteArrayOutputStream byteout = null;
        ObjectOutputStream objout = null;
        try{
            byteout = new ByteArrayOutputStream();
            objout = new ObjectOutputStream(byteout);
            objout.writeObject(o);
            byte[] bytes = byteout.toByteArray();
            return bytes;
        }catch (Exception e){
            log.error(e);
            throw e;
        }

    }

    /**
     * @Date 22:18 2019/3/21
     * @Remark 反序列化
     **/
    public static Object unSerialize(byte[] bytes)throws Exception{
        if(bytes == null){
            return null;
        }
        ByteArrayInputStream bytein = null;
        ObjectInputStream objin = null;
        try{
            bytein = new ByteArrayInputStream(bytes);
            objin = new ObjectInputStream(bytein);
            Object object = objin.readObject();
            return object;
        }catch (Exception e){
            log.error(e);
            throw e;
        }

    }
}
