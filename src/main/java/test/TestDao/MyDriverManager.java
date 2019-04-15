package test.TestDao;

import org.springframework.stereotype.Component;


public class MyDriverManager {

    public MyDriverManager(String url,String name,String pwd){
        System.out.println("url = "+url);
        System.out.println("name = "+name);
        System.out.println("pwd = "+pwd);
    }
}
