package com.webapp.mall.vo;

public class CommonVO {
    private String table_name;
    private String pk;
    private String[] chk;


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
