package com.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.utils.JDBCUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.dao.UserDao;
import com.entity.User;


@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * 根据用户号或用户密码
	 */
	public User findByNameAndPwd(String name, String pwd) {
		User user = null;
		String hql = "from User where name =? and pwd = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, name);
		query.setString(1, pwd);
		List<User> list = query.list();
		if(list.size() > 0){
			user = list.get(0);
		}
		return user;
	}

	public User findByName(String name) {
		String hql = "from User where name = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
//		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, name);
		List<User> list = query.list();
		if(list.size() >0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public void add(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	
	public void updateUser(String hql, Object... parms) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		if(parms != null && parms.length>0){
			for(int i=0; i<parms.length;i++){
				query.setParameter(i, parms[i]);
			}
		}
		query.executeUpdate();
	}

	public void update(User user) {
		sessionFactory.getCurrentSession().update(user);
		
	}


	public User findById(int id) {
		String hql = "from User where id = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		List<User> list = query.list();
		if(list.size() >0){
			return list.get(0);
		}else{
			return null;
		}
	}
	/**
	 * 查询用户列表
	 */
	public List findUsers(){
		String hql = "from User Order by id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<User> list = query.list();
		return  list;
	}
	

	


	

}
