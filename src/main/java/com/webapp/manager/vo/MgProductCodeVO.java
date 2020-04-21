package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class MgProductCodeVO extends SearchVO {


    private String product_class_code_type;
    private String product_class_code;
    private String product_class_name;
    private String product_class_use_yn;

    public String getProduct_class_code_type() {
        return product_class_code_type;
    }

    public void setProduct_class_code_type(String product_class_code_type) {
        this.product_class_code_type = product_class_code_type;
    }

    public String getProduct_class_code() {
        return product_class_code;
    }

    public void setProduct_class_code(String product_class_code) {
        this.product_class_code = product_class_code;
    }

    public String getProduct_class_name() {
        return product_class_name;
    }

    public void setProduct_class_name(String product_class_name) {
        this.product_class_name = product_class_name;
    }

    public String getProduct_class_use_yn() {
        return product_class_use_yn;
    }

    public void setProduct_class_use_yn(String product_class_use_yn) {
        this.product_class_use_yn = product_class_use_yn;
    }
}
