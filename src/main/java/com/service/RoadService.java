package com.service;

import com.entity.Road;
import com.utils.PageBean;

import java.util.List;


public interface RoadService {

    /**
     * 查询所有路灯 ---分页查询
     */
    public PageBean<Road> findAll(int pageIndex, int pageNumber);
    /**
     * 删除路灯
     */
    public void delete(String parms);

    /**
     * 查询正常/损坏的路灯---分页查询
     */
    public PageBean<Road>  findNormal(int state, int pageIndex, int pageNumber);
    /**
     * 查询单个路灯
     */
    public Road findOnly(int id);
    /**
     * 修改信息
     */
    public void updateRoad(Road road);
    /**
     * 添加
     */
    public void add(Road road);
    /**
     * 查询正常/损坏的路灯所有
     */
    public List findAllByState(int state);

}
