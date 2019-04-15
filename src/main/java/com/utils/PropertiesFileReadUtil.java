package com.utils;

import org.apache.commons.lang.StringUtils;

import java.io.*;
import java.util.Properties;

public class PropertiesFileReadUtil {

    /**
     * 判断文件是否已经加载过
     */
    private static boolean isLoaded  = false;

    /**
     * 属性对象
     */
    private static Properties properties = new Properties();



    /**
     * 通过getResourceAsStream加载配置文件
     */
    public static void loadConfigByResourceAsStream(String context){
        String fileName = null;
        InputStream in = null;
        if(StringUtils.isNotEmpty(context)){
            fileName = context;
        }else{
            fileName = "jdbc.properties";
        }
        if(isLoaded){
            return;
        }
        try {
            in = PropertiesFileReadUtil.class.getClassLoader().getResourceAsStream(fileName);
            properties.load(in);
            isLoaded = true;
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(in != null){
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    /**
     * 通过fileInputStream 读取配置文件
     */
    public static void loadConfigByFileInputStrean(String context){
        InputStream in = null;
        String fileName = null;
        if(StringUtils.isNotEmpty(context)){
            fileName = context;
        }else{
            fileName = "jdbc.properties";
        }

        try {
            String catalinaHome = new File("").getAbsolutePath();
            catalinaHome = catalinaHome+File.separator+"src"+File.separator+"main"+File.separator+"resources"+File.separator+fileName;
            System.out.println(catalinaHome);
//            in = new FileInputStream(new File(catalinaHome));
            in  = new BufferedInputStream(new FileInputStream(catalinaHome));
            properties.load(in);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(in != null){
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }


    /**
     * 获取字符串
     * @param key
     * @return
     */
    public String getString(String key){
        return properties.getProperty(key,"");
    }
    /**
     * 获取boolean值
     */
    public boolean getBoolean(String key){
        return Boolean.parseBoolean(properties.getProperty(key,"false"));
    }
    /**
     * 获取int 值
     */
    public int getInteger(String key){
        return Integer.parseInt(properties.getProperty(key,"0"));
    }
    /**
     * 获取float 值
     */
    public float getFloat(String key){
        return Float.parseFloat(properties.getProperty(key,"0.0f"));
    }
    /**
     * 获取double 值
     */
    public double getDouble(String key){
        return Double.parseDouble(properties.getProperty(key,"0.0d"));
    }
}
