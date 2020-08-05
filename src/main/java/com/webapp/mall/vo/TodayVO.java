package com.webapp.mall.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TodayVO {
    private String product_sale_yn;
    private String product_use_yn;
    private String product_approval_yn;
    private String product_use_member_yn;

    public String getProduct_use_yn() {
        return product_use_yn;
    }

    public void setProduct_use_yn(String product_use_yn) {
        this.product_use_yn = product_use_yn;
    }

    public String getProduct_sale_yn() {
        return product_sale_yn;
    }

    public void setProduct_sale_yn(String product_sale_yn) {
        this.product_sale_yn = product_sale_yn;
    }

    List<String> product_cd_array= new ArrayList<String>();

    public List<String> getProduct_cd_array() {
        return product_cd_array;
    }

    public void setProduct_cd_array(List<String> today) {
        this.product_cd_array = today;
    }

    public void setProduct_cd_array_string(String product_cd) {
        this.product_cd_array.add(product_cd);
    }

	public String getProduct_use_member_yn() {
		return product_use_member_yn;
	}

	public void setProduct_use_member_yn(String product_use_member_yn) {
		this.product_use_member_yn = product_use_member_yn;
	}

	public String getProduct_approval_yn() {
		return product_approval_yn;
	}

	public void setProduct_approval_yn(String product_approval_yn) {
		this.product_approval_yn = product_approval_yn;
	}
}
