package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class StoreVO extends SearchVO {
    private String store_id;
    private String supplier_cd;   
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
    private String[] store_approval_status_arr;
    private String store_approval_date;
    private String tex_email;
    private String store_bank_account;
    private String store_bank_holder;
    private String store_bank_name;
    private String enable_mg_menu_id;
    private Integer level;
    private String store_info_chkDate;
    private String info_alert_date;
    private String alert_chk;
    private String store_creator_yn;
    private String store_pur_com;
    
    

    public String getStore_pur_com() {
		return store_pur_com;
	}

	public void setStore_pur_com(String store_pur_com) {
		this.store_pur_com = store_pur_com;
	}

	public String getStore_creator_yn() {
        return store_creator_yn;
    }

    public void setStore_creator_yn(String store_creator_yn) {
        this.store_creator_yn = store_creator_yn;
    }

    public String getStore_info_chkDate() {
		return store_info_chkDate;
	}

	public void setStore_info_chkDate(String store_info_chkDate) {
		this.store_info_chkDate = store_info_chkDate;
	}

	public String getInfo_alert_date() {
		return info_alert_date;
	}

	public void setInfo_alert_date(String info_alert_date) {
		this.info_alert_date = info_alert_date;
	}

	public String getAlert_chk() {
		return alert_chk;
	}

	public void setAlert_chk(String alert_chk) {
		this.alert_chk = alert_chk;
	}

	public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getEnable_mg_menu_id() {
        return enable_mg_menu_id;
    }

    public void setEnable_mg_menu_id(String enable_mg_menu_id) {
        this.enable_mg_menu_id = enable_mg_menu_id;
    }

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
    
    public void setStore_approval_status_arr(String[] store_approval_status_arr) {
        this.store_approval_status_arr = store_approval_status_arr;
    }

    public String[] getStore_approval_status_arr() {
        return store_approval_status.split(",");
    }

	public String getTex_email() {
		return tex_email;
	}

	public void setTex_email(String tex_email) {
		this.tex_email = tex_email;
	}

	public String getStore_bank_account() {
		return store_bank_account;
	}

	public void setStore_bank_account(String store_bank_account) {
		this.store_bank_account = store_bank_account;
	}

	public String getStore_bank_holder() {
		return store_bank_holder;
	}

	public void setStore_bank_holder(String store_bank_holder) {
		this.store_bank_holder = store_bank_holder;
	}

	public String getStore_bank_name() {
		return store_bank_name;
	}

	public void setStore_bank_name(String store_bank_name) {
		this.store_bank_name = store_bank_name;
	}

	public String getSupplier_cd() {
		return supplier_cd;
	}

	public void setSupplier_cd(String supplier_cd) {
		this.supplier_cd = supplier_cd;
	}
    
}
