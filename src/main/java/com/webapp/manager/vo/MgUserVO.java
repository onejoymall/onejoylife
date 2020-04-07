package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class MgUserVO  extends SearchVO {
    private String user_id;
    private String username;
    private String email;
    private Integer level;
    private String sex;
    private String birth;
    private String phone;
    private String user_grant_name;
    private Integer payment_limit;
    private Integer payment_event_amount;
    private Integer payment_point_limit;
    private Integer event_point;
    private Integer user_grant_no;
    private String[] chk;
    private Integer user_grant;

    public Integer getUser_grant() {
        return user_grant;
    }

    public void setUser_grant(Integer user_grant) {
        this.user_grant = user_grant;
    }

    public String[] getChk() {
        return chk;
    }

    public void setChk(String[] chk) {
        this.chk = chk;
    }

    public Integer getUser_grant_no() {
        return user_grant_no;
    }

    public void setUser_grant_no(Integer user_grant_no) {
        this.user_grant_no = user_grant_no;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUser_grant_name() {
        return user_grant_name;
    }

    public void setUser_grant_name(String user_grant_name) {
        this.user_grant_name = user_grant_name;
    }

    public Integer getPayment_limit() {
        return payment_limit;
    }

    public void setPayment_limit(Integer payment_limit) {
        this.payment_limit = payment_limit;
    }

    public Integer getPayment_event_amount() {
        return payment_event_amount;
    }

    public void setPayment_event_amount(Integer payment_event_amount) {
        this.payment_event_amount = payment_event_amount;
    }

    public Integer getPayment_point_limit() {
        return payment_point_limit;
    }

    public void setPayment_point_limit(Integer payment_point_limit) {
        this.payment_point_limit = payment_point_limit;
    }

    public Integer getEvent_point() {
        return event_point;
    }

    public void setEvent_point(Integer event_point) {
        this.event_point = event_point;
    }

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

}
