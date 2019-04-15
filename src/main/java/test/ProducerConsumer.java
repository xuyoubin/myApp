package test;

public class ProducerConsumer {
    public static void main(String[] args){
        StackShop stackShop = new StackShop();
        Runnable c = new Customer(stackShop);
        Runnable p = new Product(stackShop);
        Thread t1 = new Thread(c);
        Thread t2 = new Thread(p);
        t1.start();
        t2.start();
    }
}

/**
 * 创造堆栈结构
 */
 class StackShop{
     private int num = 0;
     private char[] data = new char[6];

    /**
     * 存
     * @param c
     */
     public synchronized void push(char c){
         if(num == data.length){
             try {
                 this.wait();
             } catch (InterruptedException e) {
                 e.printStackTrace();
             }
         }
         this.notify();
         data[num] = c;
         num++;

     }

     public synchronized char pop(){
         if(num == 0){
             try {
                 this.wait();
             } catch (InterruptedException e) {
                 e.printStackTrace();
             }
         }
         this.notify();
         num --;
         return data[num];
     }

}

class Product implements Runnable {
    StackShop stackShop;
    Product(StackShop s){
        stackShop = s;
    }

    @Override
    public void run() {
        for(int i=0;i<20;i++){
            char c = (char)(Math.random()*26+'A');
            stackShop.push(c);
            System.out.println("product:"+c);
        }
        try {
            Thread.sleep((int)(Math.random()*1000));
        } catch (InterruptedException e) {
            e.printStackTrace();
        };
    }


}

class Customer implements Runnable {
    StackShop stackShop;
    Customer(StackShop s){
        stackShop = s;
    }

    @Override
    public void run() {
        for(int i=0;i<20;i++){
            char c = stackShop.pop();
            System.out.println("消费:"+c);
        }
        try {
            Thread.sleep((int)(Math.random()*1000));
        } catch (InterruptedException e) {
            e.printStackTrace();
        };
    }


}
