package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class StoreVO extends SearchVO {
    private String store_id;
    private String store_password;
    private String store_passwordCf;
    private String store_name;
    private String store_reg;
    private String store_ceo_name;
    private String store_type;
    private String store_item;
    private String fileName;
    private String store_online_reg;
    private String store_tel;
    private String store_mail;
    private String store_fax;
    private String postcode;
    private String roadAddress;
    private String jibunAddress;
    private String extraAddress;
    private String store_approval_status;
    private String store_approval_date;

    public String getStore_approval_date() {
        return store_approval_date;
    }

    public void setStore_approval_date(String store_approval_date) {
        this.store_approval_date = store_approval_date;
    }

    public String getStore_approval_status() {
        return store_approval_status;
    }

    public void setStore_approval_status(String store_approval_status) {
        this.store_approval_status = store_approval_status;
    }

    public String getStore_passwordCf() {
        return store_passwordCf;
    }

    public void setStore_passwordCf(String store_passwordCf) {
        this.store_passwordCf = store_passwordCf;
    }

    public String getStore_id() {
        return store_id;
    }

    public void setStore_id(String store_id) {
        this.store_id = store_id;
    }

    public String getStore_password() {
        return store_password;
    }

    public void setStore_password(String store_password) {
        this.store_password = store_password;
    }

    public String getStore_name() {
        return store_name;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public String getStore_reg() {
        String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
        return store_reg.replaceAll(" " , "")
                .replaceAll("\\p{Z}", "")
                .replaceAll(match, "");
    }

    public void setStore_reg(String store_reg) {
        this.store_reg = store_reg;
    }

    public String getStore_ceo_name() {
        return store_ceo_name;
    }

    public void setStore_ceo_name(String store_ceo_name) {
        this.store_ceo_name = store_ceo_name;
    }

    public String getStore_type() {
        return store_type;
    }

    public void setStore_type(String store_type) {
        this.store_type = store_type;
    }

    public String getStore_item() {
        return store_item;
    }

    public void setStore_item(String store_item) {
        this.store_item = store_item;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getStore_online_reg() {
        return store_online_reg;
    }

    public void setStore_online_reg(String store_online_reg) {
        this.store_online_reg = store_online_reg;
    }

    public String getStore_tel() {
        return store_tel;
    }

    public void setStore_tel(String store_tel) {
        this.store_tel = store_tel;
    }

    public String getStore_mail() {
        return store_mail;
    }

    public void setStore_mail(String store_mail) {
        this.store_mail = store_mail;
    }

    public String getStore_fax() {
        return store_fax;
    }

    public void setStore_fax(String store_fax) {
        this.store_fax = store_fax;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getRoadAddress() {
        return roadAddress;
    }

    public void setRoadAddress(String roadAddress) {
        this.roadAddress = roadAddress;
    }

    public String getJibunAddress() {
        return jibunAddress;
    }

    public void setJibunAddress(String jibunAddress) {
        this.jibunAddress = jibunAddress;
    }

    public String getExtraAddress() {
        return extraAddress;
    }

    public void setExtraAddress(String extraAddress) {
        this.extraAddress = extraAddress;
    }
}
