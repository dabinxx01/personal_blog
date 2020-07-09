package com.pojo;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class User {

    private String userId;
    private String userName;
    private String password;
    private String email;
    private String headpic;

    public String getHeadpic() {
        return headpic;
    }

    public int getLogintimes() {
        return logintimes;
    }

    public boolean getPermission() {
        return permission;
    }

    private int logintimes;
    private boolean permission;

    public void setHeadpic(String headpic) {
        this.headpic = headpic;
    }

    public void setLogintimes(int logintimes) {
        this.logintimes = logintimes;
    }

    public void setPermission(boolean permission) {
        this.permission = permission;
    }


    public String getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }


    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
