package com.webapp.mall.vo;

public class PaymentVO {
    private String merchant_uid;
    private Integer cancel_request_amount;
    private String reason;
    private String refund_holder;
    private String refund_bank;
    private String refund_account;
    private String payment_status;
    private String success;

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
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