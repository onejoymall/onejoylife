package com.webapp.mall.vo;
public class DeliveryInfoVO extends PaymentVO {
   private String product_cd;
   private String payment_class;
   private String giveaway_cd;
   private Integer order_user_id;
   private String order_user_name;
   private String order_user_email;
   private String order_user_phone;
   private String selectAddress;
   private String delivery_user_name;
   private String delivery_type;
   private String telNumber;
   private String postcode;
   private String roadAddress;
   private String extraAddress;
   private String jibunAddress;
   private String delivery_message_select;
   private String delivery_user_phone;
   private String delivery_user_tel;
   private String delivery_message;
   private String order_no;
   private String giveaway_play_cd;
   private String delivery_t_key;//택배조회 api 인증키
   private String delivery_t_code;//택배사 콛
   private String delivery_t_invoice;//택배 송장번호
   private String delivery_t_url;//REST API 호출 url
   private String delivery_status;


    public String getDelivery_status() {
        return delivery_status;
    }

    public void setDelivery_status(String delivery_status) {
        this.delivery_status = delivery_status;
    }

    public String getPayment_class() {
        return payment_class;
    }

    public void setPayment_class(String payment_class) {
        this.payment_class = payment_class;
    }

    public String getProduct_cd() {
        return product_cd;
    }

    public void setProduct_cd(String product_cd) {
        this.product_cd = product_cd;
    }

    public String getGiveaway_cd() {
        return giveaway_cd;
    }

    public void setGiveaway_cd(String giveaway_cd) {
        this.giveaway_cd = giveaway_cd;
    }

    public Integer getOrder_user_id() {
        return order_user_id;
    }

    public void setOrder_user_id(Integer order_user_id) {
        this.order_user_id = order_user_id;
    }

    public String getOrder_user_name() {
        return order_user_name;
    }

    public void setOrder_user_name(String order_user_name) {
        this.order_user_name = order_user_name;
    }

    public String getOrder_user_email() {
        return order_user_email;
    }

    public void setOrder_user_email(String order_user_email) {
        this.order_user_email = order_user_email;
    }

    public String getOrder_user_phone() {
        return order_user_phone;
    }

    public void setOrder_user_phone(String order_user_phone) {
        this.order_user_phone = order_user_phone;
    }

    public String getSelectAddress() {
        return selectAddress;
    }

    public void setSelectAddress(String selectAddress) {
        this.selectAddress = selectAddress;
    }

    public String getDelivery_user_name() {
        return delivery_user_name;
    }

    public void setDelivery_user_name(String delivery_user_name) {
        this.delivery_user_name = delivery_user_name;
    }

    public String getDelivery_type() {
        return delivery_type;
    }

    public void setDelivery_type(String delivery_type) {
        this.delivery_type = delivery_type;
    }

    public String getTelNumber() {
        return telNumber;
    }

    public void setTelNumber(String telNumber) {
        this.telNumber = telNumber;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getRoadAddress() {
        return roadAddress;
    }

    public void setRoadAddress(String roadAddress) {
        this.roadAddress = roadAddress;
    }

    public String getExtraAddress() {
        return extraAddress;
    }

    public void setExtraAddress(String extraAddress) {
        this.extraAddress = extraAddress;
    }

    public String getJibunAddress() {
        return jibunAddress;
    }

    public void setJibunAddress(String jibunAddress) {
        this.jibunAddress = jibunAddress;
    }

    public String getDelivery_message_select() {
        return delivery_message_select;
    }

    public void setDelivery_message_select(String delivery_message_select) {
        this.delivery_message_select = delivery_message_select;
    }

    public String getDelivery_user_phone() {
        return delivery_user_phone;
    }

    public void setDelivery_user_phone(String delivery_user_phone) {
        this.delivery_user_phone = delivery_user_phone;
    }

    public String getDelivery_user_tel() {
        return delivery_user_tel;
    }

    public void setDelivery_user_tel(String delivery_user_tel) {
        this.delivery_user_tel = delivery_user_tel;
    }

    public String getDelivery_message() {
        return delivery_message;
    }

    public void setDelivery_message(String delivery_message) {
        this.delivery_message = delivery_message;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getGiveaway_play_cd() {
        return giveaway_play_cd;
    }

    public void setGiveaway_play_cd(String giveaway_play_cd) {
        this.giveaway_play_cd = giveaway_play_cd;
    }

    public String getDelivery_t_key() {
        return delivery_t_key;
    }

    public void setDelivery_t_key(String delivery_t_key) {
        this.delivery_t_key = delivery_t_key;
    }

    public String getDelivery_t_code() {
        return delivery_t_code;
    }

    public void setDelivery_t_code(String delivery_t_code) {
        this.delivery_t_code = delivery_t_code;
    }

    public String getDelivery_t_invoice() {
        return delivery_t_invoice;
    }

    public void setDelivery_t_invoice(String delivery_t_invoice) {
        this.delivery_t_invoice = delivery_t_invoice;
    }

    public String getDelivery_t_url() {
        return delivery_t_url;
    }

    public void setDelivery_t_url(String delivery_t_url) {
        this.delivery_t_url = delivery_t_url;
    }
}
