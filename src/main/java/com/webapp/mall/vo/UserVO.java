package com.webapp.mall.vo;

public class UserVO {
    private String email;
    private Integer email_auth_code;
    private String password;
    private String password_cf;
    private String newpassword;
    private String renewpassword;
    private String user_privacy_policy;
    private String email_privacy_policy;
    private String log_type;

    public String getLog_type() {
        return log_type;
    }

    public void setLog_type(String log_type) {
        this.log_type = log_type;
    }

    public String getRenewpassword() {
        return renewpassword;
    }

    public void setRenewpassword(String renewpassword) {
        this.renewpassword = renewpassword;
    }

    public String getUser_privacy_policy() {
        return user_privacy_policy;
    }

    public void setUser_privacy_policy(String user_privacy_policy) {
        this.user_privacy_policy = user_privacy_policy;
    }

    public String getEmail_privacy_policy() {
        return email_privacy_policy;
    }

    public void setEmail_privacy_policy(String email_privacy_policy) {
        this.email_privacy_policy = email_privacy_policy;
    }

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getEmail_auth_code() {
        return email_auth_code;
    }

    public void setEmail_auth_code(Integer email_auth_code) {
        this.email_auth_code = email_auth_code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword_cf() {
        return password_cf;
    }

    public void setPassword_cf(String password_cf) {
        this.password_cf = password_cf;
    }
}
