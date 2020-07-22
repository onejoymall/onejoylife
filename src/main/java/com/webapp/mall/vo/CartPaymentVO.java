package com.webapp.mall.vo;

public class CartPaymentVO extends CommonVO {
   private String cart_user_id;
   private String error_msg;
   private String merchant_uid;
   private String payment;
   private String payment_cd;
   private String order_no;
   private String pg_type;
   private String cart_cd;
   private String pay_method;
   private String imp_uid;
   private String payment_type_cd;
   private String pg_provider;
   private String success;
   private String payment_status;
   private String[] product_cd;
   private String[] product_cds;
   private String[] coupon_cd;
   private String[] payment_order_quantity;
   private String[] option_name;
   private String[] coupon_discount;
   private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }

    public String getMerchant_uid() {
        return merchant_uid;
    }

    public void setMerchant_uid(String merchant_uid) {
        this.merchant_uid = merchant_uid;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getPayment_cd() {
        return payment_cd;
    }

    public void setPayment_cd(String payment_cd) {
        this.payment_cd = payment_cd;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getPg_type() {
        return pg_type;
    }

    public void setPg_type(String pg_type) {
        this.pg_type = pg_type;
    }

    public String getCart_cd() {
        return cart_cd;
    }

    public void setCart_cd(String cart_cd) {
        this.cart_cd = cart_cd;
    }

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public String getImp_uid() {
        return imp_uid;
    }

    public void setImp_uid(String imp_uid) {
        this.imp_uid = imp_uid;
    }

    public String getPayment_type_cd() {
        return payment_type_cd;
    }

    public void setPayment_type_cd(String payment_type_cd) {
        this.payment_type_cd = payment_type_cd;
    }

    public String getPg_provider() {
        return pg_provider;
    }

    public void setPg_provider(String pg_provider) {
        this.pg_provider = pg_provider;
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getCart_user_id() {
        return cart_user_id;
    }

    public void setCart_user_id(String cart_user_id) {
        this.cart_user_id = cart_user_id;
    }

	public String[] getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String[] product_cd) {
		this.product_cd = product_cd;
	}

	public String[] getCoupon_cd() {
		return coupon_cd;
	}

	public void setCoupon_cd(String[] coupon_cd) {
		this.coupon_cd = coupon_cd;
	}

	public String[] getPayment_order_quantity() {
		return payment_order_quantity;
	}

	public void setPayment_order_quantity(String[] payment_order_quantity) {
		this.payment_order_quantity = payment_order_quantity;
	}

	public String[] getProduct_cds() {
		return product_cds;
	}

	public void setProduct_cds(String[] product_cds) {
		this.product_cds = product_cds;
	}

	public String[] getOption_name() {
		return option_name;
	}

	public void setOption_name(String[] option_name) {
		this.option_name = option_name;
	}

	public String[] getCoupon_discount() {
		return coupon_discount;
	}

	public void setCoupon_discount(String[] coupon_discount) {
		this.coupon_discount = coupon_discount;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

}
