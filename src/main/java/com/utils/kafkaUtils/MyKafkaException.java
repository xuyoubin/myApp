package com.utils.kafkaUtils;

/**
 * @Date: 2019/3/28 10:17
 * @Author: ybxu
 * @Version: 1.0
 * @Remark:
 **/
public class MyKafkaException extends RuntimeException  {
   /*
    * @Date 10:17 2019/3/28
    * @Remark 错误代码
    **/
   private boolean success ;

   public MyKafkaException(String message){
       super(message);
   }

   /**
    * @Date 10:20 2019/3/28
    * @Remark  构造函数
    **/
   public MyKafkaException(boolean success,String message){
       super(message);
       this.success = success;
   }

    public boolean isSuccess() {
        return success;
    }
}
