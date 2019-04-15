package com.utils;

import com.entity.SystemLog;
import com.entity.User;
import com.service.SystemService;
import org.apache.log4j.Logger;
import org.apache.poi.ss.formula.functions.T;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

import static com.utils.HttpContextUtil.getRequset;

@Aspect
@Component
public class SystemLogAspect {

    private static final Logger log = Logger.getLogger(SystemLogAspect.class);

    @Resource
    SystemService systemService;

    //Controller层切点
     @Pointcut("execution (* com.controller..*.*(..))")
      public  void controllerAspect() {
     }

    //前置通知
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint){
        log.info("前置通知开始");
    }

    //配置controller环绕通知,使用在方法aspect()上注册的切入点
//    @Around("controllerAspect()")
//    public void around(JoinPoint joinPoint){
//        System.out.println("==========开始执行controller环绕通知===============");
//        long start = System.currentTimeMillis();
//            try {
//                long end = System.currentTimeMillis();
//                log.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms!");
//                System.out.println("==========结束执行controller环绕通知===============");
//            } catch (Throwable e) {
//                long end = System.currentTimeMillis();
//                if(log.isInfoEnabled()){
//                    log.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms with exception : " + e.getMessage());
//                }
//            }
//    }
    //记录日志
    @After( "controllerAspect()")
    public void after(JoinPoint joinPoint){
        HttpSession session =  getRequset().getSession();
        User user = (User) session.getAttribute(SessionUtil.USER_KEY);
        String addressIp = GetIp.getIpAddr();//ip地址
        try {
            String targetName = joinPoint.getTarget().getClass().getName(); //目标类名
            String targetMethod = joinPoint.getSignature().getName(); //目标方法
            Object[] objects = joinPoint.getArgs(); //参数对象
            Class clazz = Class.forName(targetName);
            Method [] Methods =  clazz.getMethods();
            String operationType = "";
            String operationName = "";
            for(Method method:Methods){
                if(method.getName().equals(targetMethod)){
                    Class [] clazzs = method.getParameterTypes();
                    if(objects.length == clazzs.length){
                        logC logc = method.getAnnotation(logC.class);
                        if(logc != null){
                            operationType = logc.operationType();
                            operationName = logc.operationName();
                        }
                        break;
                    }
                }
            }
             /*========控制台输出=========*/
             System.out.println("=====controller后置通知开始=====");
             System.out.println("请求方法:" +targetName+"."+targetMethod+"."+operationName);
             System.out.println("方法描述:" + operationName);
             System.out.println("请求IP:" + addressIp);
             /*========记入数据库=========*/
            SystemLog systemLog = new SystemLog();
            systemLog.setAddressip(addressIp);
            if(user != null){
                System.out.println("请求人:" + user.getName());
                systemLog.setCreateby(user.getName());
            }
            systemLog.setCreatedate(new Date());
            systemLog.setExceptioncode(null);
            systemLog.setExceptiondetail(null);
            systemLog.setLogtype(operationType);
            systemLog.setMethod(targetName+"."+targetMethod+"."+operationName);
            systemService.add(systemLog);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }

}
