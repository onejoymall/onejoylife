package com.webapp.mall.vo;

import com.webapp.board.common.SearchVO;

public class MyPageVO extends SearchVO {
    String payment_status;
    Integer payment_user_id;

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public Integer getPayment_user_id() {
        return payment_user_id;
    }

    public void setPayment_user_id(Integer payment_user_id) {
        this.payment_user_id = payment_user_id;
    }
}
