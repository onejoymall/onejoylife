package com.webapp.board.common;


import com.webapp.mall.vo.GiveawayVO;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchVO extends PageVO{

    private String bgno;                       // 게시판 그룹
    private String searchKeyword = "";         // 검색 키워드
    private String searchType = "";            // 검색 필드: 제목, 내용  
    private String[] searchTypeArr;            // 검색 필드를 배열로 변환
    private String product_sale_yn;
    private Integer product_ct;
    private Integer pd_category_id;
    private String mainViewType;
    private String orderByKey;
    private String orderByValue;
    private Integer sortOrder;
    private Integer giveaway_id;
    private String start_date;
    private String end_date;

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

    public Integer getProduct_ct() {
        return product_ct;
    }

    public void setProduct_ct(Integer product_ct) {
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

}
 