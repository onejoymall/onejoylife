package com.webapp.board.common;

public class SearchVO extends PageVO{
    private Integer usr_id;
    private String bgno;                       // 게시판 그룹
    private String searchKeyword = "";         // 검색 키워드
    private String searchType = "";            // 검색 필드: 제목, 내용  
    private String[] searchTypeArr;            // 검색 필드를 배열로 변환
    private String product_sale_yn;
    private String product_use_yn;
    private String product_ct;
    private Integer pd_category_id;
    private String mainViewType;
    private String orderByKey;
    private String orderByValue;
    private Integer sortOrder;
    private Integer giveaway_id;
    private String start_date;
    private String end_date;
    private String product_name;
    private String product_use_member_yn;
    private String sales_criteria;
    private String question_type;
    private String category1;
    private String category2;
    private String category3;
    private String product_approval_yn;
    private String store_id;
    private String product_type;
    private String coupon_cd;
    private String coupon_cd2;
    private String store_pur_com;
    

    
    
    

    public String getStore_pur_com() {
		return store_pur_com;
	}

	public void setStore_pur_com(String store_pur_com) {
		this.store_pur_com = store_pur_com;
	}

	public String getCoupon_cd() {
		return coupon_cd;
	}

	public void setCoupon_cd(String coupon_cd) {
		this.coupon_cd = coupon_cd;
	}

	public String getCoupon_cd2() {
		return coupon_cd2;
	}

	public void setCoupon_cd2(String coupon_cd2) {
		this.coupon_cd2 = coupon_cd2;
	}

	public String getProduct_type() {
        return product_type;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }

    public String getProduct_use_member_yn() {
        return product_use_member_yn;
    }

    public void setProduct_use_member_yn(String product_use_member_yn) {
        this.product_use_member_yn = product_use_member_yn;
    }

    public Integer getUsr_id() {
        return usr_id;
    }

    public void setUsr_id(Integer usr_id) {
        this.usr_id = usr_id;
    }

    public String getProduct_use_yn() {
        return product_use_yn;
    }

    public void setProduct_use_yn(String product_use_yn) {
        this.product_use_yn = product_use_yn;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public Integer getGiveaway_id() {
        return giveaway_id;
    }

    public void setGiveaway_id(Integer giveaway_id) {
        this.giveaway_id = giveaway_id;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getOrderByKey() {
        return orderByKey;
    }

    public void setOrderByKey(String orderByKey) {
        this.orderByKey = orderByKey;
    }

    public String getOrderByValue() {
        return orderByValue;
    }

    public void setOrderByValue(String orderByValue) {
        this.orderByValue = orderByValue;
    }

    public String getMainViewType() {
        return mainViewType;
    }

    public void setMainViewType(String mainViewType) {
        this.mainViewType = mainViewType;
    }

    public Integer getPd_category_id() {
        return pd_category_id;
    }

    public void setPd_category_id(Integer pd_category_id) {
        this.pd_category_id = pd_category_id;
    }

    public String getProduct_ct() {
        return product_ct;
    }

    public void setProduct_ct(String product_ct) {
        this.product_ct = product_ct;
    }

    public void setSearchTypeArr(String[] searchTypeArr) {
        this.searchTypeArr = searchTypeArr;
    }

    public String getProduct_sale_yn() {
        return product_sale_yn;
    }

    public void setProduct_sale_yn(String product_sale_yn) {
        this.product_sale_yn = product_sale_yn;
    }

    public String getBgno() {
        return bgno;
    }

    public void setBgno(String bgno) {
        this.bgno = bgno;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }
    
    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }
    
    public String getSearchType() {
        return searchType;
    }
    
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String[] getSearchTypeArr() {
        return searchType.split(",");
    }

	public String getSales_criteria() {
		return sales_criteria;
	}

	public void setSales_criteria(String sales_criteria) {
		this.sales_criteria = sales_criteria;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getCategory3() {
		return category3;
	}

	public void setCategory3(String category3) {
		this.category3 = category3;
	}

	public String getProduct_approval_yn() {
		return product_approval_yn;
	}

	public void setProduct_approval_yn(String product_approval_yn) {
		this.product_approval_yn = product_approval_yn;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
}
 