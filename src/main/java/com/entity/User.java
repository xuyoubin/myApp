package com.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "user")
public class User implements Serializable{
	@Id
	@Column(name = "id")
	private long id;
	//登录名
	@Column(name = "name")
	private String name;
	//密码
	@Column(name = "pwd")
	private String pwd;
	//年龄
	@Column(name = "age")
	private String age;
	//注册时间
	@Column(name = "registertime")
	private Date registertime;
	//权限
	@Column(name = "power")
	private int power;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public Date getRegistertime() { return registertime; }
	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}
}
