package com.webapp.mall.vo;

public class CommonVO {
    private String table_name;
    private String pk;
    private String[] chk;
    private String[] product_cd_arr;

    public String[] getProduct_cd_arr() {
        return product_cd_arr;
    }

    public void setProduct_cd_arr(String[] product_cd_arr) {
        this.product_cd_arr = product_cd_arr;
    }

    public String getPk() {
        return pk;
    }

    public String getTable_name() {
        return table_name;
    }

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

    public void setPk(String pk) {
        this.pk = pk;
    }

    public void setChk(String[] chk) {
        this.chk = chk;
    }

    public String[] getChk() {
        return chk;
    }
}
