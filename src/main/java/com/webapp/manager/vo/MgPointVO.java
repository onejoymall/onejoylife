package com.webapp.manager.vo;

import com.webapp.board.common.SearchVO;

public class MgPointVO extends SearchVO {
    private Integer point;
    private Integer point_add;
    private String point_paid_memo;
    private Integer point_amount;
    private Integer point_use;
    private Integer point_paid_user_id;
    private String point_paid_type;
    private String point_paid_product_cd;
    private String username;
    private String email;
    private String item;
    
    
    public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getPoint_add() {
        return point_add;
    }

    public void setPoint_add(Integer point_add) {
        this.point_add = point_add;
    }

    public String getPoint_paid_memo() {
        return point_paid_memo;
    }

    public void setPoint_paid_memo(String point_paid_memo) {
        this.point_paid_memo = point_paid_memo;
    }

    public Integer getPoint_amount() {
        return point_amount;
    }

    public void setPoint_amount(Integer point_amount) {
        this.point_amount = point_amount;
    }

    public Integer getPoint_use() {
        return point_use;
    }

    public void setPoint_use(Integer point_use) {
        this.point_use = point_use;
    }

    public Integer getPoint_paid_user_id() {
        return point_paid_user_id;
    }

    public void setPoint_paid_user_id(Integer point_paid_user_id) {
        this.point_paid_user_id = point_paid_user_id;
    }

    public String getPoint_paid_type() {
        return point_paid_type;
    }

    public void setPoint_paid_type(String point_paid_type) {
        this.point_paid_type = point_paid_type;
    }

    public String getPoint_paid_product_cd() {
        return point_paid_product_cd;
    }

    public void setPoint_paid_product_cd(String point_paid_product_cd) {
        this.point_paid_product_cd = point_paid_product_cd;
    }
}
