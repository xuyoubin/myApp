package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;


@Entity
@Table(name = "ldtable")
public class Road {
	@Id
	@Column(name = "id")
	private int id;
	//编号
	@Column(name = "number")
	private String number;
	//安装日期
	@Column(name = "azdate")
	private Date azdate;
	//生产公司
	@Column(name = "scgs")
	private String scgs;
	//安装人员
	@Column(name = "azpeople")
	private String azpeople;
	//安装地址
	@Column(name = "azaddress")
	private String azaddress;
	//是否打开 1—打开 0—关闭
	@Column(name = "isopen")
	private String isopen;
	//电流
	@Column(name = "dl")
	private String dl;
	//电压
	@Column(name = "dy")
	private String dy;
	//状态  1—损坏 0—正常
	@Column(name = "state")
	private int state;
	//打开时间
	@Column(name = "opentime")
	private String opentime;
	//关闭时间
	@Column(name = "closetime")
	private String closetime;
	//操作人员
	@Column(name = "czpeople")
	private String czpeople;
	//备注
	@Column(name = "bz")
	private String bz;

	public int getId() {
		return id;
	}

	public String getNumber() {
		return number;
	}

	public Date getAzdate() {
		return azdate;
	}

	public String getScgs() {
		return scgs;
	}

	public String getAzpeople() {
		return azpeople;
	}

	public String getAzaddress() {
		return azaddress;
	}

	public String getIsopen() {
		return isopen;
	}

	public String getDl() {
		return dl;
	}

	public String getDy() {
		return dy;
	}

	public int getState() {
		return state;
	}

	public String getOpentime() {
		return opentime;
	}

	public String getClosetime() {
		return closetime;
	}

	public String getCzpeople() {
		return czpeople;
	}

	public String getBz() {
		return bz;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public void setAzdate(Date azdate) {
		this.azdate = azdate;
	}

	public void setScgs(String scgs) {
		this.scgs = scgs;
	}

	public void setAzpeople(String azpeople) {
		this.azpeople = azpeople;
	}

	public void setAzaddress(String azaddress) {
		this.azaddress = azaddress;
	}

	public void setIsopen(String isopen) {
		this.isopen = isopen;
	}

	public void setDl(String dl) {
		this.dl = dl;
	}

	public void setDy(String dy) {
		this.dy = dy;
	}

	public void setState(int state) {
		this.state = state;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}

	public void setCzpeople(String czpeople) {
		this.czpeople = czpeople;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
