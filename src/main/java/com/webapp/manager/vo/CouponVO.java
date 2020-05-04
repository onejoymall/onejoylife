package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class CouponVO extends SearchVO {
	private Integer coupon_id;
	private String coupon_cd;
	private String coupon_ct;
	private String supplier_cd;
	private String coupon_name;
	private String coupon_sale_type;
	private Integer coupon_sale_payment;
	private String coupon_sale_rate;
	private String country_supply = "";         // 검색 필드: 제목, 내용  
    private String[] country_supply_arr;        
	private String coupon_condition;
	private String coupon_issue_time;
	private Integer coupon_anniversary_before;
	private String coupon_issue_date;
	private String coupon_issue_order_end;
	private Integer coupon_min_amount;
	private Integer coupon_review_condition;
	private String coupon_buy_count_condition;
	private Integer coupon_min_buy_count;
	private Integer coupon_none_buy_month;
	private String coupon_use_range;
	private Integer coupon_use_min_amount;
	private String coupon_sale_cal_condition;
	private String coupon_dup_yn;
	private String coupon_type;
	private String coupon_use_payment_class;
	private String coupon_img_path;
	private String coupon_alert_class;
	private String coupon_valid_date_start;
	private String coupon_valid_date_end;
	private Integer coupon_issued_target_id;
	private Integer coupon_payment;
	private Integer coupon_payment_condition;
	private String coupon_class;
	private String coupon_use_yn;
	private String login_alert_yn;
	private String sms_alert_yn;
	private String email_alert_yn;
	private String reg_date;
	private String coupon_condition1;
	private String coupon_condition2;
	private String coupon_condition3;
	private String batch_country_supply;
	private String batch_coupon_valid_date_start;
	private String batch_coupon_valid_date_end;
	private String batch_coupon_use_range;
	private String batch_coupon_ct;
	private String batch_coupon_use_payment_class;
	private String[] chk;
	
	public Integer getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCoupon_cd() {
		return coupon_cd;
	}
	public void setCoupon_cd(String coupon_cd) {
		this.coupon_cd = coupon_cd;
	}
	public String getCoupon_ct() {
		return coupon_ct;
	}
	public void setCoupon_ct(String coupon_ct) {
		this.coupon_ct = coupon_ct;
	}
	public String getSupplier_cd() {
		return supplier_cd;
	}
	public void setSupplier_cd(String supplier_cd) {
		this.supplier_cd = supplier_cd;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public Integer getCoupon_sale_payment() {
		return coupon_sale_payment;
	}
	public void setCoupon_sale_payment(Integer coupon_sale_payment) {
		this.coupon_sale_payment = coupon_sale_payment;
	}
	public String getCoupon_sale_rate() {
		return coupon_sale_rate;
	}
	public void setCoupon_sale_rate(String coupon_sale_rate) {
		this.coupon_sale_rate = coupon_sale_rate;
	}
	public String getCountry_supply() {
		return country_supply;
	}
	public void setCountry_supply(String country_supply) {
		this.country_supply = country_supply;
	}
	public String getCoupon_condition() {
		return coupon_condition;
	}
	public void setCoupon_condition(String coupon_condition) {
		this.coupon_condition = coupon_condition;
	}
	public String getCoupon_issue_time() {
		return coupon_issue_time;
	}
	public void setCoupon_issue_time(String coupon_issue_time) {
		this.coupon_issue_time = coupon_issue_time;
	}
	public Integer getCoupon_anniversary_before() {
		return coupon_anniversary_before;
	}
	public void setCoupon_anniversary_before(Integer coupon_anniversary_before) {
		this.coupon_anniversary_before = coupon_anniversary_before;
	}
	public String getCoupon_issue_date() {
		return coupon_issue_date;
	}
	public void setCoupon_issue_date(String coupon_issue_date) {
		this.coupon_issue_date = coupon_issue_date;
	}
	public Integer getCoupon_min_amount() {
		return coupon_min_amount;
	}
	public void setCoupon_min_amount(Integer coupon_min_amount) {
		this.coupon_min_amount = coupon_min_amount;
	}
	public Integer getCoupon_review_condition() {
		return coupon_review_condition;
	}
	public void setCoupon_review_condition(Integer coupon_review_condition) {
		this.coupon_review_condition = coupon_review_condition;
	}
	public String getCoupon_buy_count_condition() {
		return coupon_buy_count_condition;
	}
	public void setCoupon_buy_count_condition(String coupon_buy_count_condition) {
		this.coupon_buy_count_condition = coupon_buy_count_condition;
	}
	public Integer getCoupon_min_buy_count() {
		return coupon_min_buy_count;
	}
	public void setCoupon_min_buy_count(Integer coupon_min_buy_count) {
		this.coupon_min_buy_count = coupon_min_buy_count;
	}
	public Integer getCoupon_none_buy_month() {
		return coupon_none_buy_month;
	}
	public void setCoupon_none_buy_month(Integer coupon_none_buy_month) {
		this.coupon_none_buy_month = coupon_none_buy_month;
	}
	public String getCoupon_use_range() {
		return coupon_use_range;
	}
	public void setCoupon_use_range(String coupon_use_range) {
		this.coupon_use_range = coupon_use_range;
	}
	public Integer getCoupon_use_min_amount() {
		return coupon_use_min_amount;
	}
	public void setCoupon_use_min_amount(Integer coupon_use_min_amount) {
		this.coupon_use_min_amount = coupon_use_min_amount;
	}
	public String getCoupon_sale_cal_condition() {
		return coupon_sale_cal_condition;
	}
	public void setCoupon_sale_cal_condition(String coupon_sale_cal_condition) {
		this.coupon_sale_cal_condition = coupon_sale_cal_condition;
	}
	public String getCoupon_dup_yn() {
		return coupon_dup_yn;
	}
	public void setCoupon_dup_yn(String coupon_dup_yn) {
		this.coupon_dup_yn = coupon_dup_yn;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public String getCoupon_use_payment_class() {
		return coupon_use_payment_class;
	}
	public void setCoupon_use_payment_class(String coupon_use_payment_class) {
		this.coupon_use_payment_class = coupon_use_payment_class;
	}
	public String getCoupon_img_path() {
		return coupon_img_path;
	}
	public void setCoupon_img_path(String coupon_img_path) {
		this.coupon_img_path = coupon_img_path;
	}
	public String getCoupon_alert_class() {
		return coupon_alert_class;
	}
	public void setCoupon_alert_class(String coupon_alert_class) {
		this.coupon_alert_class = coupon_alert_class;
	}
	public String getCoupon_valid_date_start() {
		return coupon_valid_date_start;
	}
	public void setCoupon_valid_date_start(String coupon_valid_date_start) {
		this.coupon_valid_date_start = coupon_valid_date_start;
	}
	public String getCoupon_valid_date_end() {
		return coupon_valid_date_end;
	}
	public void setCoupon_valid_date_end(String coupon_valid_date_end) {
		this.coupon_valid_date_end = coupon_valid_date_end;
	}
	public Integer getCoupon_issued_target_id() {
		return coupon_issued_target_id;
	}
	public void setCoupon_issued_target_id(Integer coupon_issued_target_id) {
		this.coupon_issued_target_id = coupon_issued_target_id;
	}
	public Integer getCoupon_payment() {
		return coupon_payment;
	}
	public void setCoupon_payment(Integer coupon_payment) {
		this.coupon_payment = coupon_payment;
	}
	public Integer getCoupon_payment_condition() {
		return coupon_payment_condition;
	}
	public void setCoupon_payment_condition(Integer coupon_payment_condition) {
		this.coupon_payment_condition = coupon_payment_condition;
	}
	public String getCoupon_class() {
		return coupon_class;
	}
	public void setCoupon_class(String coupon_class) {
		this.coupon_class = coupon_class;
	}
	public String getCoupon_use_yn() {
		return coupon_use_yn;
	}
	public void setCoupon_use_yn(String coupon_use_yn) {
		this.coupon_use_yn = coupon_use_yn;
	}
	public String getLogin_alert_yn() {
		return login_alert_yn;
	}
	public void setLogin_alert_yn(String login_alert_yn) {
		this.login_alert_yn = login_alert_yn;
	}
	public String getSms_alert_yn() {
		return sms_alert_yn;
	}
	public void setSms_alert_yn(String sms_alert_yn) {
		this.sms_alert_yn = sms_alert_yn;
	}
	public String getEmail_alert_yn() {
		return email_alert_yn;
	}
	public void setEmail_alert_yn(String email_alert_yn) {
		this.email_alert_yn = email_alert_yn;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getCoupon_sale_type() {
		return coupon_sale_type;
	}
	public void setCoupon_sale_type(String coupon_sale_type) {
		this.coupon_sale_type = coupon_sale_type;
	}
	public String getCoupon_condition1() {
		return coupon_condition1;
	}
	public void setCoupon_condition1(String coupon_condition1) {
		this.coupon_condition1 = coupon_condition1;
	}
	public String getCoupon_condition2() {
		return coupon_condition2;
	}
	public void setCoupon_condition2(String coupon_condition2) {
		this.coupon_condition2 = coupon_condition2;
	}
	public String getCoupon_condition3() {
		return coupon_condition3;
	}
	public void setCoupon_condition3(String coupon_condition3) {
		this.coupon_condition3 = coupon_condition3;
	}
	public String[] getCountry_supply_arr() {
		return country_supply.split(",");
	}
	public void setCountry_supply_arr(String[] country_supply_arr) {
		this.country_supply_arr = country_supply_arr;
	}
	public String getCoupon_issue_order_end() {
		return coupon_issue_order_end;
	}
	public void setCoupon_issue_order_end(String coupon_issue_order_end) {
		this.coupon_issue_order_end = coupon_issue_order_end;
	}
	public String getBatch_country_supply() {
		return batch_country_supply;
	}
	public void setBatch_country_supply(String batch_country_supply) {
		this.batch_country_supply = batch_country_supply;
	}
	public String getBatch_coupon_valid_date_start() {
		return batch_coupon_valid_date_start;
	}
	public void setBatch_coupon_valid_date_start(String batch_coupon_valid_date_start) {
		this.batch_coupon_valid_date_start = batch_coupon_valid_date_start;
	}
	public String getBatch_coupon_valid_date_end() {
		return batch_coupon_valid_date_end;
	}
	public void setBatch_coupon_valid_date_end(String batch_coupon_valid_date_end) {
		this.batch_coupon_valid_date_end = batch_coupon_valid_date_end;
	}
	public String getBatch_coupon_use_range() {
		return batch_coupon_use_range;
	}
	public void setBatch_coupon_use_range(String batch_coupon_use_range) {
		this.batch_coupon_use_range = batch_coupon_use_range;
	}
	public String getBatch_coupon_ct() {
		return batch_coupon_ct;
	}
	public void setBatch_coupon_ct(String batch_coupon_ct) {
		this.batch_coupon_ct = batch_coupon_ct;
	}
	public String getBatch_coupon_use_payment_class() {
		return batch_coupon_use_payment_class;
	}
	public void setBatch_coupon_use_payment_class(String batch_coupon_use_payment_class) {
		this.batch_coupon_use_payment_class = batch_coupon_use_payment_class;
	}
	public String[] getChk() {
		return chk;
	}
	public void setChk(String[] chk) {
		this.chk = chk;
	}
}
