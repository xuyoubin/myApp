package test;

public class SynchronizeObjectCode1  implements  Runnable{
    static SynchronizeObjectCode1 synchronizeObjectCode1 = new SynchronizeObjectCode1();
    Object lock1 = new Object();
    Object lock2 = new Object();
    @Override
    public void run() {

        synchronized (this){
            System.out.println("lock1部分，我叫"+Thread.currentThread().getName());
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(Thread.currentThread().getName()+"运行结束");
        }
    }

    public static void main(String[] args){
        Thread tread1 = new Thread(synchronizeObjectCode1);
        Thread thread2 = new Thread(synchronizeObjectCode1);
//        Thread.sleep(4);
        tread1.start();
        thread2.start();
        thread2.isAlive();
        thread2.getPriority();
        while (tread1.isAlive() || thread2.isAlive()){

        }
        System.out.println("finished");
    }
}
