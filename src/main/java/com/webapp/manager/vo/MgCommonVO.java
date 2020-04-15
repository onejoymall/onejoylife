package com.webapp.manager.vo;

import java.util.List;
import java.util.Map;

public class MgCommonVO {
    private String table_name;
    private String pk;
    private String[] chk;
    private String column;
    private String update_value;

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public String getUpdate_value() {
        return update_value;
    }

    public void setUpdate_value(String update_value) {
        this.update_value = update_value;
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
