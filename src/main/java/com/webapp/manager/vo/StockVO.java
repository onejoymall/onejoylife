package com.webapp.manager.vo;

public class StockVO extends MgCommonVO {

    String product_stock_use_yn;
    Integer product_stock_quantity;

    public String getProduct_stock_use_yn() {
        return product_stock_use_yn;
    }

    public void setProduct_stock_use_yn(String product_stock_use_yn) {
        this.product_stock_use_yn = product_stock_use_yn;
    }

    public Integer getProduct_stock_quantity() {
        return product_stock_quantity;
    }

    public void setProduct_stock_quantity(Integer product_stock_quantity) {
        this.product_stock_quantity = product_stock_quantity;
    }
}
