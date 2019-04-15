package com.service.impl;

import com.dao.RoadDao;
import com.entity.Road;
import com.service.RoadService;
import com.utils.PageBean;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class RoadServiceImpl implements RoadService {
    private static final Logger log = Logger.getLogger(RoadServiceImpl.class);

    @Resource
    RoadDao roadDao;
    /**
     * 查询所有路灯 ---分页查询
     */
    public PageBean<Road> findAll(int pageIndex, int pageNumber){
        int count = roadDao.count();
        PageBean pg = new PageBean(pageIndex,pageNumber,count);
        int startIndex = pg.getStartIndex();
        List list = roadDao.findAll(startIndex,pageNumber);
        pg.setList(list);
        return pg;
    }
    /**
     * 删除路灯
     */
    public void delete(String parms){
        //批量删除，用；隔开
       String []array   = parms.split(";");
       for(int i=0;i<array.length;i++){
           if(2==i){
               int sun = i/0;
               log.info("发现异常");
//               throw new RuntimeException("发现异常");
               roadDao.delete(Integer.valueOf(array[i]));
           }else{
               roadDao.delete(Integer.valueOf(array[i]));
           }

       }
    }

    @Override
    public PageBean<Road> findNormal(int state, int pageIndex, int pageNumber) {
        int count = roadDao.countByState(state).size();
        PageBean pg = new PageBean(pageIndex,pageNumber,count);
        int startIndex = pg.getStartIndex();
        List list = roadDao.findNormal(state,startIndex,pageNumber);
        pg.setList(list);
        return pg;
    }

    @Override
    public Road findOnly(int id) {
        return roadDao.findOnly(id);
    }

    /**
     * 事务配置测试
     */
    @Override
//    @Transactional
    public void updateRoad(Road road) {
//        try {
            roadDao.update(road);
            int i=1/0;//出现错误要实现回滚
//        }catch (Exception e){
//            e.printStackTrace();
//        }

    }

    @Override
    public void add(Road road) {
        roadDao.add(road);
    }

    @Override
    public List findAllByState(int state){
        return roadDao.countByState(state);
    }
}
