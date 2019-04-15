package com.utils.ResultsetUtils.impl;

import com.utils.ResultsetUtils.ResultsetHandle;
import org.apache.poi.ss.formula.functions.T;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

/**
 * 将结果转化为bean的处理类
 */
public class BeanHandle implements ResultsetHandle {

    private Class<?> clazz;

    BeanHandle(Class<?> clazz){
        this.clazz = clazz;
    }

    /**
     *
     * @param rs
     * @return
     */
    @Override
    public Object handle(ResultSet rs) {
        try{
            if(!rs.next()){
                return null;
            }
            //获取结果集元素数据
            ResultSetMetaData metaData =  rs.getMetaData();
            Object bean = clazz.newInstance();
            int countNum = metaData.getColumnCount();//得到结果集有几列数据
            for(int i=0;i<countNum;i++){
                String name = metaData.getColumnName(i+1);//得到每列数据
                Object data = rs.getObject(i+1);
                Field field = clazz.getDeclaredField(name);
                field.setAccessible(true); //true为允许操作此元素
                field.set(bean,data);
            }
            return bean;
        }catch (Exception e){
            throw  new RuntimeException(e);
        }

    }
}
