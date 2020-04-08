package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class MgBrandVO extends SearchVO {

    private Integer no;
    private String product_brand;
    private String product_brand_name;
    private String product_brand_use_yn;

    public String getProduct_brand_use_yn() {
        return product_brand_use_yn;
    }

    public void setProduct_brand_use_yn(String product_brand_use_yn) {
        this.product_brand_use_yn = product_brand_use_yn;
    }

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getProduct_brand() {
        return product_brand;
    }

    public void setProduct_brand(String product_brand) {
        this.product_brand = product_brand;
    }

    public String getProduct_brand_name() {
        return product_brand_name;
    }

    public void setProduct_brand_name(String product_brand_name) {
        this.product_brand_name = product_brand_name;
    }
}
