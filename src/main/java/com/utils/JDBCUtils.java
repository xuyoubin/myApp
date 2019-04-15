package com.utils;





import com.utils.ResultsetUtils.ResultsetHandle;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JDBCUtils {

//    private static final Logger log = Logger.getLogger(JDBCUtils.class);
//    private static final String driver = "com.mysql.jdbc.Driver";
//    private static final String url = "jdbc:mysql://127.0.0.1:3306/myapp?useUnicode=true&characterEncoding=UTF-8";

    //批量处理的配置
//    private static final String url = "jdbc:mysql://127.0.0.1:3306/myapp?rewriteBatchedStatements=true&useUnicode=true&characterEncoding=UTF-8";


//    private static final String name = "root";
//    private static final String pwd = "";
//
//    private static Connection conn = null;
   private static JDBCPool jdbcPool = new JDBCPool();

    public static Connection getConnection() throws SQLException {
        return jdbcPool.getConnection();
//        log.info("调用JDBCUtils");
//        //获取配置信息
//        try {
//            InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
//            Properties properties = new Properties();
//            properties.load(in);
//            System.out.println(properties.getProperty("jdbc.username"));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        try {
//            Class.forName(driver);
////            ClassLoader.getSystemClassLoader();
//        }catch (ClassNotFoundException e){
//            e.printStackTrace();
//            System.out.print("驱动加载失败1");
//            log.info("驱动加载失败log");
//        }
//        try{
//            conn = DriverManager.getConnection(url,name,pwd);
//        }catch (SQLException e){
//            e.printStackTrace();
//            log.info("连接失败"+e.getMessage());
//        }
//        return  conn;
    }

    public static void CloseAll(Connection conn, PreparedStatement pst, ResultSet rst){
        if(rst != null){ //关闭resultSet 对象
            try {
                rst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(pst != null){
            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 万能的更新方法
     * 所有实体类的CUD操作代码基本相同，仅仅发送给数据库的sql不同，所有这里做统一封装
     * @param sql
     * @param parms
     */
    public  static void update(String sql ,Object[] parms) throws SQLException{
        Connection conn = null;
        PreparedStatement st = null;
        try{
            conn = getConnection();
            st = conn.prepareStatement(sql);
            for(int i=0;i<parms.length;i++){
                st.setObject(i+1,parms[i]);
            }
            st.executeUpdate();
        }finally {
            CloseAll(conn,st,null);
        }
    }

    /**
     * w万能查询方法统一封装
     * @param sql
     * @param parms
     * @param rh
     * @return
     * @throws SQLException
     */
    public static Object query(String sql , Object[] parms, ResultsetHandle rh) throws  SQLException{
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = getConnection();
            st = conn.prepareStatement(sql);
            for(int i=0;i<parms.length;i++){
                st.setObject(i+1,parms[1]);
            }
            rs = st.executeQuery();
            return rh.handle(rs);

        }finally {
            CloseAll(conn,st,rs);
        }
    }
    /**
     * Connection类讲解
     * createStatement ：创建向数据库发送sql的statement对象
     * prepareStatement ： 创建向数据库发送的预编译sql的prepareStatement对象
     * setAutoCommit(boolean autoCommit) :设置事务是否自动提交
     * commit（）：提交事务
     * rollback（）：回滚事务
     * prepareCall(sql);创建存储过程callableStatement对象
     */

    /**
     * Statement类讲解
     *
     * executeQuery（String sql）；用于向数据库发送查询语句
     * executeUpdate（String sql）；用于向数据库发送insert，update delete 语句
     * execute（String sql） 用于发送任何语句
     * addBatch(String sql),吧多条语句放到一个批处理中
     * executeBatch（），像数据库发送一个批sql语句
     */
    /**
     * ResultSet讲解
     * getObject（int index）
     * getObject（string columnName）
     * getString（int index）
     * next（） 移到下一行
     * Previous（）移动前一行
     * absolute（）移动到指定行
     * beforeFirst（）；
     * afterLast（）；
     */
    /**
     * Connection对象死非常稀有的资源，需要及时，正确的关闭，所以要放在finally，如果没有及时关闭容易宕机
     *
     * rewriteBatchedStatements = true;
     * 是开启addBatch（）和executeBatch（）的配置，批量处理
     */



}