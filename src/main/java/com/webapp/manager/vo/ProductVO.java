package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

import java.util.List;

public class ProductVO extends SearchVO {
    String product_score;
    String product_store_id;
    String product_id;
    String product_cd;
    String product_market_cd;
    String product_use_yn;
    String product_sale_yn;
    String product_new_class;
    String product_md_class;
    String product_name;
    String product_name_en;
    String product_name_mg;
    String product_supply_pd_name;
    String product_model_name;
    String product_summary_memo;
    String product_brief_memo;
    String product_html;
    String product_mobile_memo_config;
    String product_mobile_html;
    String product_keyword;
    String product_tex_class;
    Integer product_user_payment;
    Integer product_company_payment;
    Integer product_payment;
    String product_payment_empty_yn;
    String product_payment_memo;
    String product_order_limit_quantity;
    Integer product_min_limit;
    Integer product_max_limit;
    Double product_point_rate;
    String product_go_event_yn;
    String product_adult_yn;
    String product_option_yn;
    String product_option_class;
    String product_option_view_type;
    String product_option_set_name;
    String product_option_input;
    String product_option_style;
    String product_option_button_img;
    String product_option_color;
    String product_option_required;
    String product_sold_out_memo;
    String product_add_option;
    String product_add_option_name;
    String product_add_option_required;
    String product_add_option_max_lang;
    String product_detail_image;
    String product_list_image;
    String product_list_image_sm;
    String product_list_image_response;
    String product_add_image;
    String product_made_company_cd;
    String product_supplier;
    String product_brand;
    String product_trend;
    String product_influencer;
    String product_self_class_cd;
    String product_create_date;
    String product_release_date;
    String product_validity_yn;
    String product_validity;
    String product_origin;
    String product_cm;
    String product_payment_info;
    String product_delivery_info;
    String product_change_info;
    String product_service_info;
    String product_delivery_class;
    String product_delivery_type;
    String product_delivery_International_type;
    String product_delivery_locale;
    String product_delivery_payment_type;
    String product_delivery_date;
    String product_delivery_payment_class;
    String product_delivery_payment;
    String product_delivery_store_pickup;
    String product_kg;
    String product_global_hs_code;
    String product_global_clearance;
    String product_material;
    String product_material_en;
    String product_fabric;
    String product_seo_yn;
    String product_seo_title;
    String product_seo_author;
    String product_seo_description;
    String product_seo_keywords;
    String product_seo_alt;
    String product_payment_type;
    String product_delivery_type_code;
    String product_memo;
    String product_point_class;
    Integer product_point_rate_cash;
    String product_sp_class;
    Integer searchToPayment;
    Integer searchBePayment;
    String product_live_type;
    String product_youtube_id;
    String product_payment_class_value;
    String product_use_member_yn;
    String product_validity_start;
    String product_validity_end;
    String product_stock_use_yn;
    Integer product_stock_quantity;
    String product_definition_key;
    String product_definition_value;
    String product_exposure_kr = "N";
    String product_exposure_usa = "N";
    String product_exposure_cn = "N";
    String product_exposure_jp = "N";
    String delivery_t_code;
    String product_type;//상품형태
    String product_approval_yn;
    String parentPK;
    String fileorder;
    

    public String getFileorder() {
		return fileorder;
	}

	public void setFileorder(String fileorder) {
		this.fileorder = fileorder;
	}

	public String getParentPK() {
		return parentPK;
	}

	public void setParentPK(String parentPK) {
		this.parentPK = parentPK;
	}

	public String getProduct_type() {
        return product_type;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }

    public String getDelivery_t_code() {
        return delivery_t_code;
    }

    public void setDelivery_t_code(String delivery_t_code) {
        this.delivery_t_code = delivery_t_code;
    }

    public String getProduct_exposure_kr() {
        return product_exposure_kr;
    }

    public void setProduct_exposure_kr(String product_exposure_kr) {
        this.product_exposure_kr = product_exposure_kr;
    }

    public String getProduct_exposure_usa() {
        return product_exposure_usa;
    }

    public void setProduct_exposure_usa(String product_exposure_usa) {
        this.product_exposure_usa = product_exposure_usa;
    }

    public String getProduct_exposure_cn() {
        return product_exposure_cn;
    }

    public void setProduct_exposure_cn(String product_exposure_cn) {
        this.product_exposure_cn = product_exposure_cn;
    }

    public String getProduct_exposure_jp() {
        return product_exposure_jp;
    }

    public void setProduct_exposure_jp(String product_exposure_jp) {
        this.product_exposure_jp = product_exposure_jp;
    }

    public String getProduct_stock_use_yn() {
        return product_stock_use_yn;
    }

    public void setProduct_stock_use_yn(String product_stock_use_yn) {
        this.product_stock_use_yn = product_stock_use_yn;
    }

    public Integer getProduct_stock_quantity() {
        return product_stock_quantity;
    }

    public void setProduct_stock_quantity(Integer product_stock_quantity) {
        this.product_stock_quantity = product_stock_quantity;
    }

    public String getProduct_validity_start() {
        return product_validity_start;
    }

    public void setProduct_validity_start(String product_validity_start) {
        this.product_validity_start = product_validity_start;
    }

    public String getProduct_validity_end() {
        return product_validity_end;
    }

    public void setProduct_validity_end(String product_validity_end) {
        this.product_validity_end = product_validity_end;
    }

    public String getProduct_live_type() {
        return product_live_type;
    }

    public void setProduct_live_type(String product_live_type) {
        this.product_live_type = product_live_type;
    }

    public String getProduct_youtube_id() {
        return product_youtube_id;
    }

    public void setProduct_youtube_id(String product_youtube_id) {
        this.product_youtube_id = product_youtube_id;
    }

    public String getProduct_payment_class_value() {
        return product_payment_class_value;
    }

    public void setProduct_payment_class_value(String product_payment_class_value) {
        this.product_payment_class_value = product_payment_class_value;
    }

    public String getProduct_use_member_yn() {
        return product_use_member_yn;
    }

    public void setProduct_use_member_yn(String product_use_member_yn) {
        this.product_use_member_yn = product_use_member_yn;
    }

    public Integer getSearchToPayment() {
        return searchToPayment;
    }

    public void setSearchToPayment(Integer searchToPayment) {
        this.searchToPayment = searchToPayment;
    }

    public Integer getSearchBePayment() {
        return searchBePayment;
    }

    public void setSearchBePayment(Integer searchBePayment) {
        this.searchBePayment = searchBePayment;
    }

    public String getProduct_score() {
        return product_score;
    }

    public void setProduct_score(String product_score) {
        this.product_score = product_score;
    }

    public String getProduct_sp_class() {
        return product_sp_class;
    }

    public void setProduct_sp_class(String product_sp_class) {
        this.product_sp_class = product_sp_class;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProduct_cd() {
        return product_cd;
    }

    public void setProduct_cd(String product_cd) {
        this.product_cd = product_cd;
    }

    public String getProduct_market_cd() {
        return product_market_cd;
    }

    public void setProduct_market_cd(String product_market_cd) {
        this.product_market_cd = product_market_cd;
    }

    public String getProduct_use_yn() {
        return product_use_yn;
    }

    public void setProduct_use_yn(String product_use_yn) {
        this.product_use_yn = product_use_yn;
    }

    public String getProduct_sale_yn() {
        return product_sale_yn;
    }

    public void setProduct_sale_yn(String product_sale_yn) {
        this.product_sale_yn = product_sale_yn;
    }

    public String getProduct_new_class() {
        return product_new_class;
    }

    public void setProduct_new_class(String product_new_class) {
        this.product_new_class = product_new_class;
    }

    public String getProduct_md_class() {
        return product_md_class;
    }

    public void setProduct_md_class(String product_md_class) {
        this.product_md_class = product_md_class;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_name_en() {
        return product_name_en;
    }

    public void setProduct_name_en(String product_name_en) {
        this.product_name_en = product_name_en;
    }

    public String getProduct_name_mg() {
        return product_name_mg;
    }

    public void setProduct_name_mg(String product_name_mg) {
        this.product_name_mg = product_name_mg;
    }

    public String getProduct_supply_pd_name() {
        return product_supply_pd_name;
    }

    public void setProduct_supply_pd_name(String product_supply_pd_name) {
        this.product_supply_pd_name = product_supply_pd_name;
    }

    public String getProduct_model_name() {
        return product_model_name;
    }

    public void setProduct_model_name(String product_model_name) {
        this.product_model_name = product_model_name;
    }

    public String getProduct_summary_memo() {
        return product_summary_memo;
    }

    public void setProduct_summary_memo(String product_summary_memo) {
        this.product_summary_memo = product_summary_memo;
    }

    public String getProduct_brief_memo() {
        return product_brief_memo;
    }

    public void setProduct_brief_memo(String product_brief_memo) {
        this.product_brief_memo = product_brief_memo;
    }

    public String getProduct_html() {
        return product_html;
    }

    public void setProduct_html(String product_html) {
        this.product_html = product_html;
    }

    public String getProduct_mobile_memo_config() {
        return product_mobile_memo_config;
    }

    public void setProduct_mobile_memo_config(String product_mobile_memo_config) {
        this.product_mobile_memo_config = product_mobile_memo_config;
    }

    public String getProduct_mobile_html() {
        return product_mobile_html;
    }

    public void setProduct_mobile_html(String product_mobile_html) {
        this.product_mobile_html = product_mobile_html;
    }

    public String getProduct_keyword() {
        return product_keyword;
    }

    public void setProduct_keyword(String product_keyword) {
        this.product_keyword = product_keyword;
    }

    public String getProduct_tex_class() {
        return product_tex_class;
    }

    public void setProduct_tex_class(String product_tex_class) {
        this.product_tex_class = product_tex_class;
    }

    public Integer getProduct_user_payment() {
        return product_user_payment;
    }

    public void setProduct_user_payment(Integer product_user_payment) {
        this.product_user_payment = product_user_payment;
    }

    public Integer getProduct_company_payment() {
        return product_company_payment;
    }

    public void setProduct_company_payment(Integer product_company_payment) {
        this.product_company_payment = product_company_payment;
    }

    public Integer getProduct_payment() {
        return product_payment;
    }

    public void setProduct_payment(Integer product_payment) {
        this.product_payment = product_payment;
    }

    public String getProduct_payment_empty_yn() {
        return product_payment_empty_yn;
    }

    public void setProduct_payment_empty_yn(String product_payment_empty_yn) {
        this.product_payment_empty_yn = product_payment_empty_yn;
    }

    public String getProduct_payment_memo() {
        return product_payment_memo;
    }

    public void setProduct_payment_memo(String product_payment_memo) {
        this.product_payment_memo = product_payment_memo;
    }

    public String getProduct_order_limit_quantity() {
        return product_order_limit_quantity;
    }

    public void setProduct_order_limit_quantity(String product_order_limit_quantity) {
        this.product_order_limit_quantity = product_order_limit_quantity;
    }

    public Integer getProduct_min_limit() {
        return product_min_limit;
    }

    public void setProduct_min_limit(Integer product_min_limit) {
        this.product_min_limit = product_min_limit;
    }

    public Integer getProduct_max_limit() {
        return product_max_limit;
    }

    public void setProduct_max_limit(Integer product_max_limit) {
        this.product_max_limit = product_max_limit;
    }

    public Double getProduct_point_rate() {
        return product_point_rate;
    }

    public void setProduct_point_rate(Double product_point_rate) {
        this.product_point_rate = product_point_rate;
    }

    public String getProduct_go_event_yn() {
        return product_go_event_yn;
    }

    public void setProduct_go_event_yn(String product_go_event_yn) {
        this.product_go_event_yn = product_go_event_yn;
    }

    public String getProduct_adult_yn() {
        return product_adult_yn;
    }

    public void setProduct_adult_yn(String product_adult_yn) {
        this.product_adult_yn = product_adult_yn;
    }

    public String getProduct_option_yn() {
        return product_option_yn;
    }

    public void setProduct_option_yn(String product_option_yn) {
        this.product_option_yn = product_option_yn;
    }

    public String getProduct_option_class() {
        return product_option_class;
    }

    public void setProduct_option_class(String product_option_class) {
        this.product_option_class = product_option_class;
    }

    public String getProduct_option_view_type() {
        return product_option_view_type;
    }

    public void setProduct_option_view_type(String product_option_view_type) {
        this.product_option_view_type = product_option_view_type;
    }

    public String getProduct_option_set_name() {
        return product_option_set_name;
    }

    public void setProduct_option_set_name(String product_option_set_name) {
        this.product_option_set_name = product_option_set_name;
    }

    public String getProduct_option_input() {
        return product_option_input;
    }

    public void setProduct_option_input(String product_option_input) {
        this.product_option_input = product_option_input;
    }

    public String getProduct_option_style() {
        return product_option_style;
    }

    public void setProduct_option_style(String product_option_style) {
        this.product_option_style = product_option_style;
    }

    public String getProduct_option_button_img() {
        return product_option_button_img;
    }

    public void setProduct_option_button_img(String product_option_button_img) {
        this.product_option_button_img = product_option_button_img;
    }

    public String getProduct_option_color() {
        return product_option_color;
    }

    public void setProduct_option_color(String product_option_color) {
        this.product_option_color = product_option_color;
    }

    public String getProduct_option_required() {
        return product_option_required;
    }

    public void setProduct_option_required(String product_option_required) {
        this.product_option_required = product_option_required;
    }

    public String getProduct_sold_out_memo() {
        return product_sold_out_memo;
    }

    public void setProduct_sold_out_memo(String product_sold_out_memo) {
        this.product_sold_out_memo = product_sold_out_memo;
    }

    public String getProduct_add_option() {
        return product_add_option;
    }

    public void setProduct_add_option(String product_add_option) {
        this.product_add_option = product_add_option;
    }

    public String getProduct_add_option_name() {
        return product_add_option_name;
    }

    public void setProduct_add_option_name(String product_add_option_name) {
        this.product_add_option_name = product_add_option_name;
    }

    public String getProduct_add_option_required() {
        return product_add_option_required;
    }

    public void setProduct_add_option_required(String product_add_option_required) {
        this.product_add_option_required = product_add_option_required;
    }

    public String getProduct_add_option_max_lang() {
        return product_add_option_max_lang;
    }

    public void setProduct_add_option_max_lang(String product_add_option_max_lang) {
        this.product_add_option_max_lang = product_add_option_max_lang;
    }

    public String getProduct_detail_image() {
        return product_detail_image;
    }

    public void setProduct_detail_image(String product_detail_image) {
        this.product_detail_image = product_detail_image;
    }

    public String getProduct_list_image() {
        return product_list_image;
    }

    public void setProduct_list_image(String product_list_image) {
        this.product_list_image = product_list_image;
    }

    public String getProduct_list_image_sm() {
        return product_list_image_sm;
    }

    public void setProduct_list_image_sm(String product_list_image_sm) {
        this.product_list_image_sm = product_list_image_sm;
    }

    public String getProduct_list_image_response() {
        return product_list_image_response;
    }

    public void setProduct_list_image_response(String product_list_image_response) {
        this.product_list_image_response = product_list_image_response;
    }

    public String getProduct_add_image() {
        return product_add_image;
    }

    public void setProduct_add_image(String product_add_image) {
        this.product_add_image = product_add_image;
    }

    public String getProduct_made_company_cd() {
        return product_made_company_cd;
    }

    public void setProduct_made_company_cd(String product_made_company_cd) {
        this.product_made_company_cd = product_made_company_cd;
    }

    public String getProduct_supplier() {
        return product_supplier;
    }

    public void setProduct_supplier(String product_supplier) {
        this.product_supplier = product_supplier;
    }

    public String getProduct_brand() {
        return product_brand;
    }

    public void setProduct_brand(String product_brand) {
        this.product_brand = product_brand;
    }

    public String getProduct_trend() {
        return product_trend;
    }

    public void setProduct_trend(String product_trend) {
        this.product_trend = product_trend;
    }

    public String getProduct_influencer() {
        return product_influencer;
    }

    public void setProduct_influencer(String product_influencer) {
        this.product_influencer = product_influencer;
    }

    public String getProduct_self_class_cd() {
        return product_self_class_cd;
    }

    public void setProduct_self_class_cd(String product_self_class_cd) {
        this.product_self_class_cd = product_self_class_cd;
    }

    public String getProduct_create_date() {
        return product_create_date;
    }

    public void setProduct_create_date(String product_create_date) {
        this.product_create_date = product_create_date;
    }

    public String getProduct_release_date() {
        return product_release_date;
    }

    public void setProduct_release_date(String product_release_date) {
        this.product_release_date = product_release_date;
    }

    public String getProduct_validity_yn() {
        return product_validity_yn;
    }

    public void setProduct_validity_yn(String product_validity_yn) {
        this.product_validity_yn = product_validity_yn;
    }

    public String getProduct_validity() {
        return product_validity;
    }

    public void setProduct_validity(String product_validity) {
        this.product_validity = product_validity;
    }

    public String getProduct_origin() {
        return product_origin;
    }

    public void setProduct_origin(String product_origin) {
        this.product_origin = product_origin;
    }

    public String getProduct_cm() {
        return product_cm;
    }

    public void setProduct_cm(String product_cm) {
        this.product_cm = product_cm;
    }

    public String getProduct_payment_info() {
        return product_payment_info;
    }

    public void setProduct_payment_info(String product_payment_info) {
        this.product_payment_info = product_payment_info;
    }

    public String getProduct_delivery_info() {
        return product_delivery_info;
    }

    public void setProduct_delivery_info(String product_delivery_info) {
        this.product_delivery_info = product_delivery_info;
    }

    public String getProduct_change_info() {
        return product_change_info;
    }

    public void setProduct_change_info(String product_change_info) {
        this.product_change_info = product_change_info;
    }

    public String getProduct_service_info() {
        return product_service_info;
    }

    public void setProduct_service_info(String product_service_info) {
        this.product_service_info = product_service_info;
    }

    public String getProduct_delivery_class() {
        return product_delivery_class;
    }

    public void setProduct_delivery_class(String product_delivery_class) {
        this.product_delivery_class = product_delivery_class;
    }

    public String getProduct_delivery_type() {
        return product_delivery_type;
    }

    public void setProduct_delivery_type(String product_delivery_type) {
        this.product_delivery_type = product_delivery_type;
    }

    public String getProduct_delivery_International_type() {
        return product_delivery_International_type;
    }

    public void setProduct_delivery_International_type(String product_delivery_International_type) {
        this.product_delivery_International_type = product_delivery_International_type;
    }

    public String getProduct_delivery_locale() {
        return product_delivery_locale;
    }

    public void setProduct_delivery_locale(String product_delivery_locale) {
        this.product_delivery_locale = product_delivery_locale;
    }

    public String getProduct_delivery_payment_type() {
        return product_delivery_payment_type;
    }

    public void setProduct_delivery_payment_type(String product_delivery_payment_type) {
        this.product_delivery_payment_type = product_delivery_payment_type;
    }

    public String getProduct_delivery_date() {
        return product_delivery_date;
    }

    public void setProduct_delivery_date(String product_delivery_date) {
        this.product_delivery_date = product_delivery_date;
    }

    public String getProduct_delivery_payment_class() {
        return product_delivery_payment_class;
    }

    public void setProduct_delivery_payment_class(String product_delivery_payment_class) {
        this.product_delivery_payment_class = product_delivery_payment_class;
    }

    public String getProduct_delivery_payment() {
        return product_delivery_payment;
    }

    public void setProduct_delivery_payment(String product_delivery_payment) {
        this.product_delivery_payment = product_delivery_payment;
    }

    public String getProduct_delivery_store_pickup() {
        return product_delivery_store_pickup;
    }

    public void setProduct_delivery_store_pickup(String product_delivery_store_pickup) {
        this.product_delivery_store_pickup = product_delivery_store_pickup;
    }

    public String getProduct_kg() {
        return product_kg;
    }

    public void setProduct_kg(String product_kg) {
        this.product_kg = product_kg;
    }

    public String getProduct_global_hs_code() {
        return product_global_hs_code;
    }

    public void setProduct_global_hs_code(String product_global_hs_code) {
        this.product_global_hs_code = product_global_hs_code;
    }

    public String getProduct_global_clearance() {
        return product_global_clearance;
    }

    public void setProduct_global_clearance(String product_global_clearance) {
        this.product_global_clearance = product_global_clearance;
    }

    public String getProduct_material() {
        return product_material;
    }

    public void setProduct_material(String product_material) {
        this.product_material = product_material;
    }

    public String getProduct_material_en() {
        return product_material_en;
    }

    public void setProduct_material_en(String product_material_en) {
        this.product_material_en = product_material_en;
    }

    public String getProduct_fabric() {
        return product_fabric;
    }

    public void setProduct_fabric(String product_fabric) {
        this.product_fabric = product_fabric;
    }

    public String getProduct_seo_yn() {
        return product_seo_yn;
    }

    public void setProduct_seo_yn(String product_seo_yn) {
        this.product_seo_yn = product_seo_yn;
    }

    public String getProduct_seo_title() {
        return product_seo_title;
    }

    public void setProduct_seo_title(String product_seo_title) {
        this.product_seo_title = product_seo_title;
    }

    public String getProduct_seo_author() {
        return product_seo_author;
    }

    public void setProduct_seo_author(String product_seo_author) {
        this.product_seo_author = product_seo_author;
    }

    public String getProduct_seo_description() {
        return product_seo_description;
    }

    public void setProduct_seo_description(String product_seo_description) {
        this.product_seo_description = product_seo_description;
    }

    public String getProduct_seo_keywords() {
        return product_seo_keywords;
    }

    public void setProduct_seo_keywords(String product_seo_keywords) {
        this.product_seo_keywords = product_seo_keywords;
    }

    public String getProduct_seo_alt() {
        return product_seo_alt;
    }

    public void setProduct_seo_alt(String product_seo_alt) {
        this.product_seo_alt = product_seo_alt;
    }

    public String getProduct_payment_type() {
        return product_payment_type;
    }

    public void setProduct_payment_type(String product_payment_type) {
        this.product_payment_type = product_payment_type;
    }

    public String getProduct_delivery_type_code() {
        return product_delivery_type_code;
    }

    public void setProduct_delivery_type_code(String product_delivery_type_code) {
        this.product_delivery_type_code = product_delivery_type_code;
    }

    public String getProduct_memo() {
        return product_memo;
    }

    public void setProduct_memo(String product_memo) {
        this.product_memo = product_memo;
    }

    public String getProduct_point_class() {
        return product_point_class;
    }

    public void setProduct_point_class(String product_point_class) {
        this.product_point_class = product_point_class;
    }

    public Integer getProduct_point_rate_cash() {
        return product_point_rate_cash;
    }

    public void setProduct_point_rate_cash(Integer product_point_rate_cash) {
        this.product_point_rate_cash = product_point_rate_cash;
    }

	public String getProduct_store_id() {
		return product_store_id;
	}

	public void setProduct_store_id(String product_store_id) {
		this.product_store_id = product_store_id;
	}

	public String getProduct_definition_key() {
		return product_definition_key;
	}

	public void setProduct_definition_key(String product_definition_key) {
		this.product_definition_key = product_definition_key;
	}

	public String getProduct_definition_value() {
		return product_definition_value;
	}

	public void setProduct_definition_value(String product_definition_value) {
		this.product_definition_value = product_definition_value;
	}

	public String getProduct_approval_yn() {
		return product_approval_yn;
	}

	public void setProduct_approval_yn(String product_approval_yn) {
		this.product_approval_yn = product_approval_yn;
	}
}
