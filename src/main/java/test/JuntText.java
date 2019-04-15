package test;


import com.alibaba.fastjson.JSONArray;
import com.dao.RoadDao;

import com.dao.impl.RoadDaoImpl;

import com.entity.Road;
import com.entity.User;
import com.service.RoadService;

import com.service.impl.RoadServiceImpl;
import com.utils.JDBCUtils;
import com.utils.PropertiesFileReadUtil;
import com.utils.ResultsetUtils.impl.BeanListHandle;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.poi.ss.formula.functions.T;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.BlockJUnit4ClassRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.StringUtils;
import test.TestDao.BeanInvoker;
import test.TestDao.MyDriverManager;
import test.TestDao.Strop;
import test.TestDao.TestDao;
import test.TestService.TestService;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

import static org.junit.Assert.assertEquals;

@RunWith(BlockJUnit4ClassRunner.class)

public class JuntText extends UnitTextBase {

    public JuntText(){
        super("classpath*:spring-bean.xml");
    }

    @Test
    public void text(){
//        TestDao testDao = new TestDaoImpl();
       TestService testService =  super.getBean("testServiceImpl");
       int sum =  testService.add();
//       if(testService instanceof TestService)

        System.out.println(String.format("结果是%s",testService instanceof TestService));
        System.out.println("结果sum = "+ sum);
//        testService.getSource();


    }

    @Test
    public void text2(){
//        TestDao testDao = new TestDaoImpl();
//        TestService testService2 =  super.getBean("testServiceImpl");
//        int sun2 = testService2.add();
        PropertiesFileReadUtil.loadConfigByFileInputStrean("");
        PropertiesFileReadUtil propertiesFileReadUtil = new PropertiesFileReadUtil();
        String value = propertiesFileReadUtil.getString("jdbc.maxPoolSize");
        System.out.println("结果值："+value);
    }

    @Test
    public void text3(){
        BeanInvoker beanInvoker = super.getBean("beanInvoker") ;
        beanInvoker.Say();


    }

    @Test
    public void test4(){
        Strop strop = super.getBean("strop");
        System.out.println(strop.getClass().getName());
    }

    @Test
    public void test5(){
        MyDriverManager manager = super.getBean("myDriverManager");
        System.out.println(manager.getClass().getName());
    }


    @Test
    public void test6(){
        String color = "red";
        char[] v = color.toCharArray();
        int n =v.length;
        int i = 0;
        while (n-- != 0){
            System.out.println(v[i]);
            i++;
        }

        byte[] bytes = new byte[1024];
        File file = new File("");
        FileInputStream fileInputStream = null;
        InputStream in = null;
        OutputStream out = null;
        Writer writer = null;
        Reader reader = null;
        try {
            in.read(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void testFileInputStream(){
        FileInputStream in = null;
//        FileReader in = null;
        FileOutputStream out = null;
        FileWriter fw = null;
        try {
            in = new FileInputStream(new File("H:\\myApp\\src\\main\\java\\com\\entity\\User.java"));
//             in = new FileReader(new File("H:\\\\myApp\\\\src\\\\main\\\\java\\\\com\\\\entity\\\\User.java"));
            BufferedInputStream bis = new BufferedInputStream(in);
//            out = new FileOutputStream("F:\\copy.java");
//
//            fw = new FileWriter("F:\\fw.java");
            int b = 0;
            for(int i=0;i<10&&(b=bis.read()) !=-1 ;i++){
                System.out.print((char)b);
            }



            bis.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
//            try {
//
//                fw.close();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }
        int b = 0;
        int num = 0;

//        try {
//            while ( (b = in.read()) != -1){
////                System.out.print((char)b);
//                fw.write(b);
//                num++;
//            }
//            in.close();
//            out.close();
//            System.out.println("一共读取的字节数"+num);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

    }

    @Test
    public void testBuffer(){
//        FileInputStream in = null;
        FileWriter fw = null;
        int i = 0;
        try {
//            in = new FileInputStream("H:\\myApp\\src\\main\\java\\com\\entity\\User.java");
            fw = new FileWriter("F:\\data.txt");
            BufferedWriter bw = new BufferedWriter(fw);
            String name = null;
            for(int j=0;j<10;j++){
                name = String.valueOf(j);
                bw.write(name);
                bw.newLine();
            }
            bw.flush();
            //读
            BufferedReader br = new BufferedReader(new FileReader("F:\\data.txt"));
            String s= null;
            while ( (s = br.readLine()) != null){
                System.out.println(s);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void  testOutputStreamWriter(){
        try {


            OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream("F:\\data.txt"));
            osw.write("hahahha");
            System.out.println(osw.getEncoding());
            osw.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //斐波那契数
    @Test
    public void text20() {
        int[] sum1 = null;
        int sum2[] = null;
       int sum =  num(4);
       System.out.println(sum);
    }
    public int num(int n){
        if(n == 1 || n == 2){
            return 1;
        }else{
            return num(n-1)+num(n-2);
        }
    }

    @Test
    public void testExecutors(){
        ExecutorService executorService = Executors.newCachedThreadPool();
        ExecutorService executorService1 = Executors.newFixedThreadPool(10);
        ExecutorService executorService2 = Executors.newScheduledThreadPool(3);

        for(int i = 0;i<10;i++){
            final int num = i;
//            try {
////                Thread.sleep(1000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }

            executorService.execute(new Runnable() {
                @Override
                public void run() {
                    System.out.println(num);
                }
            });
        }



//            new PreparedStatementCreator({
//                @Override
//                public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
//                    PreparedStatement ps = connection.
//                 }
//                    return null;
//                })
    }

    @Test
    public void  testJDBC(){
        String sql = "insert into user(name,age,pwd) values(?,?,?)";
        Object[] params = {"jdbc测试",12,"123321"};
        try {
            JDBCUtils.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void  testJDBC2(){
        String sql = "select * from user";
        Object params[] = {};
        try {
            List<User> list  = (List<User>) JDBCUtils.query(sql, params, new BeanListHandle(User.class));
            System.out.println(list.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /*
    *多线程管理测试今天
     */
    @Test
    public void  testExectors(){
        final String SUCCESS = "success";
        final  int NUM = 3;
       ExecutorService service = Executors.newFixedThreadPool(NUM);
//       Executors.newCachedThreadPool();
       long beigin = System.currentTimeMillis();
       Future<Object> future =  service.submit(new Callable<Object>() {
           @Override
           public Object call() throws Exception {
               Thread.sleep(9000);
               System.out.println("当前线程执行完毕:"+Thread.currentThread().getName());
               String names = "小米";
//               int s = 1/0;
               return names;
           }
       });

        Future<Object> future1 =  service.submit(new Callable<Object>() {
            @Override
            public Object call() throws Exception {
                Thread.sleep(5000);
                System.out.println("当前线程执行完毕:"+Thread.currentThread().getName());
                String names = "小红";
                return names;
            }
        });

        try {
            Object data = future.get();
            Object data1 = future1.get();
            System.out.println("线程池返回值1"+data);
            System.out.println("线程池返回值1"+data1);

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        long end = System.currentTimeMillis();
        long time = end - beigin;
        System.out.println("-------------------main thread end:"+ time);
    }

    @Test
    public void  testExectors2(){
        final String SUCCESS = "success";
        final  int NUM = 3;
        long beigin = System.currentTimeMillis();

        try {
            Thread.sleep(9000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }


        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        long end = System.currentTimeMillis();
        long time = end - beigin;
        System.out.println("-------------------main thread end:"+ time);
    }

    @Test
    public void  testQueryRunner(){
        QueryRunner queryRunner = new QueryRunner();
        String sql = "select * from user";
        Object params[] = {};
        try {
            List<User> list  = (List<User>) JDBCUtils.query(sql, params, new BeanListHandle(User.class));
            System.out.println(list.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void  testHT(){
        String name = "R927061(1)";
        String name1 = "R927061（1）";
        System.out.println(name.length());
        System.out.println(name1.length());
        System.out.println(name1.equals(name));
    }
}
