package com.dao;

import com.entity.Road;
import com.entity.User;

import java.util.List;

public interface RoadDao {
	
	/**
	 * 查询所有路灯 ---分页查询
	 */
	public List findAll(int pageIndex,int pageNumber);
	/**
	 * 查询正常/损坏的路灯---分页查询
	 */
	public List findNormal(int state,int pageIndex,int pageNumber);
	/**
	 * 查询正常/损坏的路灯所有
	 */
//	public List findAllByState(int state);
	/**
	 * 查询单个路灯
	 */
	public Road findOnly(int id);
	/**
	 * 修改信息
	 */
	public void update(Road road);
	/**
	 * 删除路灯
	 */
	public void delete(int id);
	/**
	 * 添加
	 */
	public void add(Road road);
	/*
	*总数量
	 */
	public int count();
	/*
	*总数量根据状态
	 */
	public List countByState(int state);

}
