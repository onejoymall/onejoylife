package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class MgUserVO  extends SearchVO {
    private String user_id;
    private String username;
    private String email;
    private Integer level;
    private String sex;
    private String birth;
    private System phone;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public System getPhone() {
        return phone;
    }

    public void setPhone(System phone) {
        this.phone = phone;
    }
}
