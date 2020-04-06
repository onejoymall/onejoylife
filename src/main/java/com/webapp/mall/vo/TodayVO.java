package com.webapp.mall.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TodayVO {
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
}
