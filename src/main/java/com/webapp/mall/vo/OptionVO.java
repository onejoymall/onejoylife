package com.webapp.mall.vo;

import java.util.List;

public class OptionVO {

    private String cart_cd;
    private String order_no;
    private String option_name;
    private String select_option_value;
    private List<OptionVO> optionVOList;

    public List<OptionVO> getOptionVOList() {
        return optionVOList;
    }

    public void setOptionVOList(List<OptionVO> optionVOList) {
        this.optionVOList = optionVOList;
    }

    public String getCart_cd() {
        return cart_cd;
    }

    public void setCart_cd(String cart_cd) {
        this.cart_cd = cart_cd;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getOption_name() {
        return option_name;
    }

    public void setOption_name(String option_name) {
        this.option_name = option_name;
    }

    public String getSelect_option_value() {
        return select_option_value;
    }

    public void setSelect_option_value(String select_option_value) {
        this.select_option_value = select_option_value;
    }

}
