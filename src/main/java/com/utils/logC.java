package com.utils;

import java.lang.annotation.*;

@Target({ElementType.METHOD,ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface logC {

    /**
     * 操作的类型
     * @return
     */
    public String operationType() default "";

    /**
     * 操作的描述
     * @return
     */
    public String operationName() default "";

}
