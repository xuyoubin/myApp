package com.service.impl;

import com.dao.SystemLogDao;
import com.entity.SystemLog;
import com.service.SystemService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class SystemServiceImpl implements SystemService {

    @Resource
    SystemLogDao systemLogDao;

    @Override
    public void add(SystemLog sysLog) {
        systemLogDao.add(sysLog);
    }
}
