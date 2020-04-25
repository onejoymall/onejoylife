package com.webapp.mall.vo;

import com.webapp.board.common.SearchVO;

public class QnaVO extends SearchVO {
private String product_cd;
private String qna_title;
private String qna_memo;
private String qna_type;
private String qna_open_type;
private String qna_writer;
private Integer qna_writer_id;
private String email;
private String qna_type_name;
private String rewriter_name;
private String reg_date;

    public String getQna_open_type() {
        return qna_open_type;
    }

    public void setQna_open_type(String qna_open_type) {
        this.qna_open_type = qna_open_type;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public String getProduct_cd() {
        return product_cd;
    }

    public void setProduct_cd(String product_cd) {
        this.product_cd = product_cd;
    }

    public String getQna_title() {
        return qna_title;
    }

    public void setQna_title(String qna_title) {
        this.qna_title = qna_title;
    }

    public String getQna_memo() {
        return qna_memo;
    }

    public void setQna_memo(String qna_memo) {
        this.qna_memo = qna_memo;
    }

    public String getQna_type() {
        return qna_type;
    }

    public void setQna_type(String qna_type) {
        this.qna_type = qna_type;
    }

    public String getQna_writer() {
        return qna_writer;
    }

    public void setQna_writer(String qna_writer) {
        this.qna_writer = qna_writer;
    }

    public Integer getQna_writer_id() {
        return qna_writer_id;
    }

    public void setQna_writer_id(Integer qna_writer_id) {
        this.qna_writer_id = qna_writer_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQna_type_name() {
        return qna_type_name;
    }

    public void setQna_type_name(String qna_type_name) {
        this.qna_type_name = qna_type_name;
    }

    public String getRewriter_name() {
        return rewriter_name;
    }

    public void setRewriter_name(String rewriter_name) {
        this.rewriter_name = rewriter_name;
    }
}
