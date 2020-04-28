package com.webapp.manager.vo;

public class CategoryVO extends MgCommonVO {
    String product_ct;
    String product_md_class;
    String product_sp_class;
    String product_new_class;

    public String getProduct_ct() {
        return product_ct;
    }

    public void setProduct_ct(String product_ct) {
        this.product_ct = product_ct;
    }

    public String getProduct_md_class() {
        return product_md_class;
    }

    public void setProduct_md_class(String product_md_class) {
        this.product_md_class = product_md_class;
    }

    public String getProduct_sp_class() {
        return product_sp_class;
    }

    public void setProduct_sp_class(String product_sp_class) {
        this.product_sp_class = product_sp_class;
    }

    public String getProduct_new_class() {
        return product_new_class;
    }

    public void setProduct_new_class(String product_new_class) {
        this.product_new_class = product_new_class;
    }
}
