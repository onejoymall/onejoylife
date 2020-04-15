package com.webapp.mall.vo;

import com.webapp.board.common.SearchVO;

public class PaymentVO extends SearchVO {
    private String merchant_uid;
    private Integer cancel_request_amount;
    private String reason;
    private String refund_holder;
    private String refund_bank;
    private String refund_account;
    private String payment_status;
    private Boolean success;
    private String pay_method;

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMerchant_uid() {
        return merchant_uid;
    }

    public void setMerchant_uid(String merchant_uid) {
        this.merchant_uid = merchant_uid;
    }

    public Integer getCancel_request_amount() {
        return cancel_request_amount;
    }

    public void setCancel_request_amount(Integer cancel_request_amount) {
        this.cancel_request_amount = cancel_request_amount;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getRefund_holder() {
        return refund_holder;
    }

    public void setRefund_holder(String refund_holder) {
        this.refund_holder = refund_holder;
    }

    public String getRefund_bank() {
        return refund_bank;
    }

    public void setRefund_bank(String refund_bank) {
        this.refund_bank = refund_bank;
    }

    public String getRefund_account() {
        return refund_account;
    }

    public void setRefund_account(String refund_account) {
        this.refund_account = refund_account;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }
}
