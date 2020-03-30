package com.webapp.mall.vo;

public class UserVO {
    private String email;
    private Integer email_auth_code;
    private String password;
    private String password_cf;

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
