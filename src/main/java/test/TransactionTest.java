package test;

import com.utils.JDBCUtils;
import org.apache.log4j.Logger;
import org.junit.Assert;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.nio.Buffer;
import java.sql.*;
import java.util.ArrayList;

public class TransactionTest {
    private static final Logger log = Logger.getLogger(TransactionTest.class);
    public void TransactionTest1(){
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rst = null;
        Savepoint sp = null; //回滚切入点
        try{
            conn = JDBCUtils.getConnection();
            conn.setAutoCommit(false);
            String sql1 = "UPDATE money SET money = money+100 WHERE name = 'A';";
            pre = conn.prepareStatement(sql1);
            pre.executeUpdate();
            int num = 1/0;
//            sp = conn.setSavepoint(); //回滚点
            String sql2 = "UPDATE money SET money = money-100 WHERE name = 'B';";
            pre = conn.prepareStatement(sql2);
//            pre.setCharacterStream();
            pre.executeUpdate();
            conn.commit();//提交事务
        }catch (Exception e){
            e.printStackTrace();
            System.out.print("更新错误");
            log.info("更新错误"+e.getMessage());
            try {
                System.out.print("手动回滚");
                conn.rollback();

//                conn.rollback(sp);
//                conn.commit();  //回滚后要手动提交事务

            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }finally {
            JDBCUtils.CloseAll(conn,pre,rst);
        }
    }

    //大文本和二进制存储

    public void TextClobReader(){
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JDBCUtils.getConnection();
            String sql = "UPDATE money SET logo = ? WHERE id = 2;";
            ps = conn.prepareStatement(sql);
            String path = TransactionTest.class.getClassLoader().getResource("1.png").getPath();
            path.replaceAll("20%","");
            File file = new File(path);
            FileInputStream fr = new FileInputStream(file);
//            ps.setCharacterStream(1,fr,file.length());//大文本
            ps.setBinaryStream(1,fr,(int) file.length());
            int num  =  ps.executeUpdate();
            if(num > 0 ){
                System.out.println("插入成功");
            }
            fr.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    //读取大文本 和二进制流

    public void TextClobWeiter(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JDBCUtils.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql  = "select logo from money where id = 2 ";
        try {
            ps = conn.prepareStatement(sql);
            rs =  ps.executeQuery();
            if(rs.next()){
//                String context = rs.getString("detail");
                InputStream in = rs.getBinaryStream("logo");
//                System.out.println(context);
                byte b[] = new byte[2014];
                int len = 0;
                try {
                    FileOutputStream out = new FileOutputStream( new File("F:\\1.png"));
                    while ( (len = in.read(b)) > 0){
                        out.write(b,0,len);
                    }
                    out.close();
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }


            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void  textBatch(){
//        org.springframework.util.Assert.notEmpty(new ArrayList(),"");
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JDBCUtils.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "insert into money (money,name) values(?,?)";
        try {
            ps = conn.prepareStatement(sql);
            for(int i=0;i<100;i++){
                ps.setDouble(1,5.0);
                ps.setString(2,"小"+i);
                ps.addBatch();
                if(i%10 == 0){
                    ps.executeBatch();
                    ps.clearBatch();
                }
            }
            ps.executeBatch();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




    public static void main(String[] arg){
        TransactionTest transactionTest = new TransactionTest();
//        transactionTest.TextClobWeiter();
//        transactionTest.TextClobReader();
//        transactionTest.TextClobWeiter();
        transactionTest.textBatch();
    }
}
