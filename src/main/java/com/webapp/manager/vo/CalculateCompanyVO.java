package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class CalculateCompanyVO extends StoreVO {

	private String store_pur_com;
	private String coupon_cd;
	private String coupon_cd2;
	
	private String[] store_pur_com_arr; 
	private String[] coupon_cd_arr;
	private Integer level;
	
	private String coupon_cd_arr_str;
	
	private String product_store_id;
	
	
	
	public String getCoupon_cd_arr_str() {
		return coupon_cd_arr_str;
	}
	public void setCoupon_cd_arr_str(String coupon_cd_arr_str) {
		this.coupon_cd_arr_str = coupon_cd_arr_str;
	}
	public String getStore_pur_com() {
		return store_pur_com;
	}
	public void setStore_pur_com(String store_pur_com) {
		this.store_pur_com = store_pur_com;
	}
	public String getCoupon_cd() {
		return coupon_cd;
	}
	public void setCoupon_cd(String coupon_cd) {
		this.coupon_cd = coupon_cd;
	}
	
	public String[] getStore_pur_com_arr() {
		return store_pur_com.split(",");
	}
	public void setStore_pur_com_arr(String[] store_pur_com_arr) {
		this.store_pur_com_arr = store_pur_com_arr;
	}
	public String[] getCoupon_cd_arr() {
		return coupon_cd.split(",");
	}
	public void setCoupon_cd_arr(String[] coupon_cd_arr) {
		this.coupon_cd_arr = coupon_cd_arr;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getProduct_store_id() {
		return product_store_id;
	}
	public void setProduct_store_id(String product_store_id) {
		this.product_store_id = product_store_id;
	}
	public String getCoupon_cd2() {
		return coupon_cd2;
	}
	public void setCoupon_cd2(String coupon_cd2) {
		this.coupon_cd2 = coupon_cd2;
	}
	
	


	

	


	
	
	
}
