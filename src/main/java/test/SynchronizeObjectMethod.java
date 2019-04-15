package test;

public class SynchronizeObjectMethod implements Runnable {
    static SynchronizeObjectMethod synchronizeObjectMethod1 = new SynchronizeObjectMethod();
    static SynchronizeObjectMethod synchronizeObjectMethod2 = new SynchronizeObjectMethod();

    public static void main(String[] args){
        Thread thread1 = new Thread(synchronizeObjectMethod1);
        Thread thread2 = new Thread(synchronizeObjectMethod2);
        thread1.start();
        thread2.start();
        try {
            thread1.join();
            thread2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("finished");
    }

    @Override
    public void run() {
        method();
    }

    public void method(){
        synchronized (SynchronizeObjectMethod.class){
            System.out.println("线程开始"+Thread.currentThread().getName());
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("线程结束"+Thread.currentThread().getName());
        }

    }


}
