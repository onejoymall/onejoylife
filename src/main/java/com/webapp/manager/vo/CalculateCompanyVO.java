package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class CalculateCompanyVO extends StoreVO {

	private String store_pur_com;
	private String coupon_cd;
	private String[] store_pur_com_arr; 
	private String[] coupon_cd_arr;
	private Integer level;
	
	
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


	

	


	
	
	
}
