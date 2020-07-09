package com.pojo;

import com.sun.org.apache.xpath.internal.operations.Bool;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.util.Date;

public class Article {
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getCreattime() {
        return creattime;
    }

    public void setCreattime(String creattime) {
        this.creattime = creattime;
    }

    public int getLooktimes() {
        return looktimes;
    }

    public void setLooktimes(int looktimes) {
        this.looktimes = looktimes;
    }

    private String id;
    private String title;
    private String detail;
    private String creattime;
    private boolean isdel;
    private int looktimes;

    public boolean isIsdel() {
        return isdel;
    }

    public void setIsdel(boolean isdel) {
        this.isdel = isdel;
    }

    public String getAdminid() {
        return adminid;
    }

    public void setAdminid(String adminid) {
        this.adminid = adminid;
    }

    private String adminid;
    private String categoryid;
    private boolean ispublic;
    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }

    public boolean isIspublic() {
        return ispublic;
    }

    public void setIspublic(boolean ispublic) {
        this.ispublic = ispublic;
    }
}
