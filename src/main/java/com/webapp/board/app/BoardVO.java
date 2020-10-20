package com.webapp.board.app;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import com.webapp.board.common.SearchVO;
import com.webapp.board.common.utiletc;

public class BoardVO extends SearchVO{
    private Integer usr_id;
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
    private String question_type_name;
    private String order_no;
    private String bgtype;
    private String password;
    private String redate;
    private String rememo;
    private String rewriter;
    private String reno;
    private String answer_yn;
    private String[] answer_yn_arr;
    private String filename;
    private String realname;
    private String store_id;
    private String supplier_cd;
    private String filelink;


	public String getFilelink() {
		return filelink;
	}

	public void setFilelink(String filelink) {
		this.filelink = filelink;
	}

	public String getSupplier_cd() {
        return supplier_cd;
    }

    public void setSupplier_cd(String supplier_cd) {
        this.supplier_cd = supplier_cd;
    }

    public String getStore_id() {
        return store_id;
    }

    public void setStore_id(String store_id) {
        this.store_id = store_id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getReno() {
        return reno;
    }

    public void setReno(String reno) {
        this.reno = reno;
    }

    /* 첨부파일 */
    private List<MultipartFile> uploadfile;
    private List<MultipartFile> uploadfile2;
    private List<MultipartFile> uploadfile3;
    private List<MultipartFile> uploadfile4;
    private List<MultipartFile> uploadfile5;
    private List<MultipartFile> uploadfile6;

    public Integer getUsr_id() {
        return usr_id;
    }

    public void setUsr_id(Integer usr_id) {
        this.usr_id = usr_id;
    }

    public String getQuestion_type_name() {
        return question_type_name;
    }

    public void setQuestion_type_name(String question_type_name) {
        this.question_type_name = question_type_name;
    }

    public String getRewriter() {
        return rewriter;
    }

    public void setRewriter(String rewriter) {
        this.rewriter = rewriter;
    }

    public String getRememo() {
        return rememo;
    }

    public void setRememo(String rememo) {
        this.rememo = rememo;
    }

    public String getRedate() {
        return redate;
    }

    public void setRedate(String redate) {
        this.redate = redate;
    }

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
    
    public List<MultipartFile> getUploadfile6() {
        return uploadfile6;
    }

    public void setUploadfile6(List<MultipartFile> uploadfile6) {
        this.uploadfile6 = uploadfile6;
    }

	public String getAnswer_yn() {
		return answer_yn;
	}

	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}

	public String[] getAnswer_yn_arr() {
		if(answer_yn == null) {
			return null;
		}
		return answer_yn.split(",");
	}

	public void setAnswer_yn_arr(String[] answer_yn_arr) {
		this.answer_yn_arr = answer_yn_arr;
	}
    
    
}
