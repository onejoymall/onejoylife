package com.webapp.mall.vo;

import com.webapp.board.common.SearchVO;

import java.util.ArrayList;
import java.util.List;

public class SearchFilterVO extends SearchVO {
    private String product_delivery_International_type;
    private String[] product_delivery_International_type_arr;
    private String product_delivery_payment_class;
    private String[] product_delivery_payment_class_arr;
    private String product_brand;
    private String[] product_brand_arr;
    private String product_option_color;
    private String[] product_option_color_arr;
    private String product_score;
    private String[] product_score_arr;
    private Integer searchToPayment;
    private Integer searchBePayment;
    //.split(",");.split("\\,")
    public String getProduct_delivery_International_type() {
        return product_delivery_International_type;
    }
    public void setProduct_delivery_International_type(String product_delivery_International_type) {
        this.product_delivery_International_type = product_delivery_International_type;
    }
    public void setProduct_delivery_International_type_arr(String[] product_delivery_International_type_arr) {
        this.product_delivery_International_type_arr = product_delivery_International_type_arr;
    }
    public String getProduct_delivery_payment_class() {
        return product_delivery_payment_class;
    }
    public void setProduct_delivery_payment_class(String product_delivery_payment_class) {
        this.product_delivery_payment_class = product_delivery_payment_class;
    }
    public void setProduct_delivery_payment_class_arr(String[] product_delivery_payment_class_arr) {
        this.product_delivery_payment_class_arr = product_delivery_payment_class_arr;
    }
    public String getProduct_brand() {
        return product_brand;
    }
    public void setProduct_brand(String product_brand) {
        this.product_brand = product_brand;
    }
    public void setProduct_brand_arr(String[] product_brand_arr) {
        this.product_brand_arr = product_brand_arr;
    }
    public String getProduct_option_color() {
        return product_option_color;
    }
    public void setProduct_option_color(String product_option_color) {
        this.product_option_color = product_option_color;
    }
    public void setProduct_option_color_arr(String[] product_option_color_arr) {
        this.product_option_color_arr = product_option_color_arr;
    }

    public String getProduct_score() {
        return product_score;
    }
    public void setProduct_score(String product_score) {
        this.product_score = product_score;
    }
    public void setProduct_score_arr(String[] product_score_arr) {
        this.product_score_arr = product_score_arr;
    }
    public Integer getSearchToPayment() {
        return searchToPayment;
    }
    public void setSearchToPayment(Integer searchToPayment) {
        this.searchToPayment = searchToPayment;
    }
    public Integer getSearchBePayment() {
        return searchBePayment;
    }
    public void setSearchBePayment(Integer searchBePayment) {
        this.searchBePayment = searchBePayment;
    }
    public String[] getProduct_delivery_International_type_arr() {
        return product_delivery_International_type.split("\\^");
    }
    public String[] getProduct_delivery_payment_class_arr() {
        return product_delivery_payment_class.split("\\^");
    }
    public String[] getProduct_score_arr() {
        return product_score.split("\\^");
    }
    public String[] getProduct_option_color_arr() {
        return product_option_color.split("\\^");
    }
    public String[] getProduct_brand_arr() {
        return product_brand.split("\\^");
    }
}
