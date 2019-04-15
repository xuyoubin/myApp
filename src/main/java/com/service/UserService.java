package com.service;

import com.entity.User;

import java.util.List;


public interface UserService {
	/**
	 * 用户登录
	 */
	public User login(String name, String pwd);
	/**
	 * 根据用户名查找客户信息
	 */
	public User findUser(String name);

	/**
	 * 添加一个用户
	 */
	public void add(String name, String pwd, String age,String power);
	/**
	 * 修改用户信息
	 */
	public void update(User user);
	/**
	 * 根据id查找一条用户信息
	 */
	public User findById(int id);

	/**
	 * 查询用户列表
	 */
	public List findUsers();

	/**
	 * 添加一个用户
	 */
	public void add(User user);

}
