package com.utils;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.logging.Logger;

/**
 * 创建数据库连接线程池
 */

public class JDBCPool implements DataSource {

    //并发处理，效率低
    List<String> list  = Collections.synchronizedList(new LinkedList<String>());
    ConcurrentLinkedQueue<String> list1 = new  ConcurrentLinkedQueue();

    //使用LinkedList存放数据库链接
    //因为这边要频繁读写list集合，所以使用LinkedList比较合适
    private static LinkedList<Connection> listconnections = new LinkedList<Connection>();

    //静态代码块中加载jdbc.properties配置
    static {
        InputStream in = JDBCPool.class.getClassLoader().getResourceAsStream("jdbc.properties");
        Properties properties = new Properties();
        try {
            properties.load(in);
            String driverClassName = properties.getProperty("jdbc.driverClassName");
            String url = properties.getProperty("jdbc.url");
            String name = properties.getProperty("jdbc.username");
            String pwd = properties.getProperty("jdbc.password");
            //获取初始化的线程池的链接数
            int jdbcpoolintsize = Integer.parseInt(properties.getProperty("jdbc.initialPoolSize"));
            //启动数据库驱动
            Class.forName(driverClassName);
            //启动链接数目
            for(int i = 0;i<jdbcpoolintsize;i++){
                Connection conn = DriverManager.getConnection(url,name,pwd);
                System.out.println("创建当前线程："+conn);
                //将创建的链接放到linkedlist集合中
                listconnections.add(conn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Connection getConnection() throws SQLException {
        if(listconnections.size()>0){
            //如果linked里面还有数据库链接，那么从其中获取一个链接
            final Connection conn = listconnections.removeFirst();
            System.out.println("获取完当前链接，还剩多少个链接："+listconnections.size());
            //返回一个Connection 对象的代理对象
            return  (Connection) Proxy.newProxyInstance(JDBCPool.class.getClassLoader(), new Class[]{Connection.class}, new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if(!"close".equals(method.getName())){
                        return  method.invoke(conn,args);
                    }else{
                        //如果调用close 就把conn还给连接池
                        listconnections.add(conn);
                        System.out.println("当前数据库链接被还给linked,当前链接池数量有："+listconnections.size());
                        return null;
                    }
                }
            });
        }else{
            System.out.println("当前数据库忙");
            throw new RuntimeException("当前数据库忙");
        }
    }

    @Override
    public Connection getConnection(String username, String password) throws SQLException {
        return null;
    }

    @Override
    public <T> T unwrap(Class<T> iface) throws SQLException {
        return null;
    }

    @Override
    public boolean isWrapperFor(Class<?> iface) throws SQLException {
        return false;
    }

    @Override
    public PrintWriter getLogWriter() throws SQLException {
        return null;
    }

    @Override
    public void setLogWriter(PrintWriter out) throws SQLException {

    }

    @Override
    public void setLoginTimeout(int seconds) throws SQLException {

    }

    @Override
    public int getLoginTimeout() throws SQLException {
        return 0;
    }

    @Override
    public Logger getParentLogger() throws SQLFeatureNotSupportedException {
        return null;
    }

}
