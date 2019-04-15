package test.TestDao;

import org.springframework.stereotype.Component;


public class StropImpl implements  Strop {

    public void init(){
        System.out.println("init method ^^^^^^");
    }

    public void destroy(){
        System.out.println("destroy method ^^^^^^");
    }

}
