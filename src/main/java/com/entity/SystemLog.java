package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "systemlog")
public class SystemLog {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "method")
    private String method;

    @Column(name = "logtype")
    private String logtype;

    @Column(name = "addressip")
    private String addressip;

    @Column(name = "parms")
    private String parms;

    @Column(name = "createby")
    private String createby;

    @Column(name = "createdate")
    private Date createdate;

    @Column(name = "exceptioncode")
    private String exceptioncode;

    @Column(name = "exceptiondetail")
    private String exceptiondetail;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getLogtype() {
        return logtype;
    }

    public void setLogtype(String logtype) {
        this.logtype = logtype;
    }

    public String getAddressip() {
        return addressip;
    }

    public void setAddressip(String addressip) {
        this.addressip = addressip;
    }

    public String getParms() {
        return parms;
    }

    public void setParms(String parms) {
        this.parms = parms;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getExceptioncode() {
        return exceptioncode;
    }

    public void setExceptioncode(String exceptioncode) {
        this.exceptioncode = exceptioncode;
    }

    public String getExceptiondetail() {
        return exceptiondetail;
    }

    public void setExceptiondetail(String exceptiondetail) {
        this.exceptiondetail = exceptiondetail;
    }
}
