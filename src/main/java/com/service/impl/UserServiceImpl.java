package com.service.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.utils.BeanAndString;
import com.utils.JDBCUtils;
import com.utils.kafkaUtils.KafkaProduce;
import com.utils.kafkaUtils.ReadKafkaPropertiesUtils;
import org.springframework.stereotype.Service;
import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;
import org.springframework.transaction.annotation.Transactional;


@Service
//@Transactional
public class UserServiceImpl implements UserService {
	
	@Resource
	UserDao userDao;

	public User login(String name, String pwd) {
		User userInfo = null;
		if(!"".equals(name.trim()) && !"".equals(pwd.trim())){
			userInfo = userDao.findByNameAndPwd(name,pwd);
		}
//		if(userInfo != null){
//			String loginip  = getIpAddr();
//			userInfo.setLastlogintime(new Date());
//			userInfo.setLoginip(loginip);
//			userDao.update(userInfo);
//		}
		return userInfo;
	}
	

	public User findUser(String name){
		User userInfo = null;
		if(!"".equals(name)){
			try {
				userInfo = userDao.findByName(name);
			}catch (Exception e){
				e.printStackTrace();
			}


		}
		return userInfo;
	}

	public void add(String name,String pwd, String age,String power) {
		User user = new User();
//		String ip  = getIpAddr();
		user.setAge(age);
		user.setName(name);
		user.setPwd(pwd);
		user.setPower(Integer.parseInt(power));
		user.setRegistertime(new Date());
		//直接走数据库
		userDao.add(user);
	}


	public void update(User user) {
		userDao.update(user);
	}


	public User findById(int id) {
		return userDao.findById(id);
	}

	/**
	 * 查询用户列表
	 */
	public List findUsers(){
		return userDao.findUsers();
	}
	/**
	 * @Date 20:52 2019/3/28
	 * @Remark   保存数据
	 **/
	public void add(User user){

//		userDao.add(user);
		String sql = "insert into user(name,age,pwd) values(?,?,?)";
		Object[] params = {user.getName(),Integer.valueOf(user.getAge()),user.getPwd()};
		try {
			JDBCUtils.update(sql, params);
			addQues();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	};

	public void addQues(){
		int num = 1/0;
		String sql2 = "insert into question(ques) values(?)";
		Object[] params2 = {"你好需要帮助吗？"};
		try {
			JDBCUtils.update(sql2, params2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	};
}


