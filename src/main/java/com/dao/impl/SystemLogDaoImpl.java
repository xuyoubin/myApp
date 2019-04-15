package com.dao.impl;

import com.dao.SystemLogDao;
import com.entity.SystemLog;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SystemLogDaoImpl implements SystemLogDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void add(SystemLog sysLog) {
        sessionFactory.getCurrentSession().save(sysLog);
    }
}
