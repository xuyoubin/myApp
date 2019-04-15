package com.utils.ResultsetUtils;

import java.sql.ResultSet;

/*
*结果集处理方法
 */
public interface ResultsetHandle {

    /**
     * 结果集处理方法
     * 不同的处理方法，通过继承此接口 实现多态
     */
    public Object handle(ResultSet rs);
}
