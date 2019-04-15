package com.dao.impl;

import com.dao.RoadDao;
import com.entity.Road;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RoadDaoImpl implements RoadDao {

    @Autowired
    private SessionFactory sessionFactory;
    /**
     * 查询所有路灯 ---分页查询
     */
    public List findAll(int pageIndex, int pageNumber){
        String hql = "from Road";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setFirstResult(pageIndex).setMaxResults(pageNumber);
        List<Road> list = query.list();
        return list;
    };
    /**
     * 查询正常/损坏的路灯---分页查询
     */
    public List findNormal(int state,int pageIndex,int pageNumber){
        String hql = "from Road where state = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setFirstResult(pageIndex).setMaxResults(pageNumber);
        query.setInteger(0, state);
        List<Road> list = query.list();
        return list;
    }
    /**
     * 查询单个路灯
     */
    public Road findOnly(int id){
        String hql = "from Road where id = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0, id);
        List<Road> list = query.list();
        if(list.size() >0){
            return list.get(0);
        }else{
            return null;
        }
    }
    /**
     * 修改信息
     */
    public void update(Road road){
        try {
            sessionFactory.getCurrentSession().update(road);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    /**
     * 删除路灯
     */
    public void delete(int id){
        String hql ="delete from Road where id = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0, id);
        query.executeUpdate();

    }
    /**
     * 添加
     */
    public void add(Road road){
        sessionFactory.getCurrentSession().save(road);
    }

    /*
	*总数量
	 */
    public int count(){
        String hql = "from Road";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        int num = query.list().size();
        return  num;
    }
    /*
    *总数量根据状态
     */
    public List countByState(int state){
        String hql = "from Road as road where state = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0, state);
//        query.setLockMode("road", LockMode.)
//        int num = query.list().size();
        return  query.list();
    }

//    public List findAllByState(int state){
//        String hql = "from Road where state = ?";
//        Query query = sessionFactory.getCurrentSession().createQuery(hql);
//        query.setInteger(0, state);
//        List<Road> list = query.list();
//       return list;
//    }

}
