package com.webapp.board.app;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import com.webapp.board.common.utiletc;

public class BoardVO {

    private String bgno;
    private String brdno;
    private String brdtitle;
    private String brdwriter;
    private String brdmemo;
    private String brddate;
    private String brdhit;
    private String brddeleteflag;
    private String filecnt;
    private String replycnt;
    private String email;
    private String phone;
    private String question_type;
    private String order_no;
    private String bgtype;
    private String password;
    /* 첨부파일 */
    private List<MultipartFile> uploadfile;
    private List<MultipartFile> uploadfile2;
    private List<MultipartFile> uploadfile3;
    private List<MultipartFile> uploadfile4;
    private List<MultipartFile> uploadfile5;

    public String getBgno() {
        return bgno;
    }

    public void setBgno(String bgno) {
        this.bgno = bgno;
    }

    public String getBrdno() {
        return brdno;
    }

    public void setBrdno(String brdno) {
        this.brdno = brdno;
    }

    public String getBrdtitle() {
        return brdtitle;
    }

    public void setBrdtitle(String brdtitle) {
        this.brdtitle = brdtitle;
    }

    public String getBrdwriter() {
        return brdwriter;
    }

    public void setBrdwriter(String brdwriter) {
        this.brdwriter = brdwriter;
    }

    public String getBrdmemo() {
        return brdmemo;
    }

    public void setBrdmemo(String brdmemo) {
        this.brdmemo = brdmemo;
    }

    public String getBrddate() {
        return brddate;
    }

    public void setBrddate(String brddate) {
        this.brddate = brddate;
    }

    public String getBrdhit() {
        return brdhit;
    }

    public void setBrdhit(String brdhit) {
        this.brdhit = brdhit;
    }

    public String getBrddeleteflag() {
        return brddeleteflag;
    }

    public void setBrddeleteflag(String brddeleteflag) {
        this.brddeleteflag = brddeleteflag;
    }

    public String getFilecnt() {
        return filecnt;
    }

    public void setFilecnt(String filecnt) {
        this.filecnt = filecnt;
    }

    public String getReplycnt() {
        return replycnt;
    }

    public void setReplycnt(String replycnt) {
        this.replycnt = replycnt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getBgtype() {
        return bgtype;
    }

    public void setBgtype(String bgtype) {
        this.bgtype = bgtype;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<MultipartFile> getUploadfile() {
        return uploadfile;
    }

    public void setUploadfile(List<MultipartFile> uploadfile) {
        this.uploadfile = uploadfile;
    }

    public List<MultipartFile> getUploadfile2() {
        return uploadfile2;
    }

    public void setUploadfile2(List<MultipartFile> uploadfile2) {
        this.uploadfile2 = uploadfile2;
    }

    public List<MultipartFile> getUploadfile3() {
        return uploadfile3;
    }

    public void setUploadfile3(List<MultipartFile> uploadfile3) {
        this.uploadfile3 = uploadfile3;
    }

    public List<MultipartFile> getUploadfile4() {
        return uploadfile4;
    }

    public void setUploadfile4(List<MultipartFile> uploadfile4) {
        this.uploadfile4 = uploadfile4;
    }

    public List<MultipartFile> getUploadfile5() {
        return uploadfile5;
    }

    public void setUploadfile5(List<MultipartFile> uploadfile5) {
        this.uploadfile5 = uploadfile5;
    }
}
