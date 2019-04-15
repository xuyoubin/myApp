package test;

public class Synchronized1 implements Runnable {
    static Synchronized1 synchronized1 = new Synchronized1();

    static int i = 0;

    public static void main(String[] args) throws InterruptedException {
//        int[] num = {1,2,3};
//        int[] num1 = new int[5];
        Thread thread1 = new Thread(synchronized1);
        Thread thread2 = new Thread(synchronized1);
        thread1.start();
        thread2.start();
        thread1.join();
        thread2.join();
        System.out.print("和="+i);

    }
    @Override
    public void run() {
        for (int j = 0;j<10000000;j++){
            i++;
        }
    }
}
