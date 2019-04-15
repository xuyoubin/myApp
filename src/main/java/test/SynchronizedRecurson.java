package test;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class SynchronizedRecurson {
    int a = 0;

    public static void main(String[] args ){
        SynchronizedRecurson synchronizedRecurson = new SynchronizedRecurson();
        synchronizedRecurson.method1();
        Lock lock = new ReentrantLock();
    }


    private synchronized void method1() {
        System.out.println("当前方法 a="+ a);
        if(a == 0){
            a++;
            method1();
        }
    }
}
