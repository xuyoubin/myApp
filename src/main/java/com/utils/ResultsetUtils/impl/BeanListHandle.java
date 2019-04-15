package com.utils.ResultsetUtils.impl;

import com.utils.ResultsetUtils.ResultsetHandle;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

/**
 * 将结果接转化为listBean 类型
 */
public class BeanListHandle implements ResultsetHandle {
    private Class<?> clazz;

    public BeanListHandle(Class<?> clazz){
        this.clazz = clazz;
    }

    /**
     * 将结果集转化为listBean类型
     * @param rs
     * @return
     */
    @Override
    public Object handle(ResultSet rs) {
        try{
            List<Object> list  = new ArrayList<Object>();
            while (rs.next()){
                ResultSetMetaData metaData = rs.getMetaData();
                Object bean = clazz.newInstance();
                int count = metaData.getColumnCount();
                for(int i=0;i<count;i++){
                    String name = metaData.getColumnName(i+1);
                    Object data = rs.getObject(i+1);
                    Field f = clazz.getDeclaredField(name);
                    f.setAccessible(true);
                    f.set(bean,data);
                }
                list.add(bean);
            }
            return list.size()>0?list:null;
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
