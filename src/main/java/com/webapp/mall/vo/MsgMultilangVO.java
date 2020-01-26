package com.webapp.mall.vo;

import java.math.BigDecimal;

public class MsgMultilangVO {
    String langCd;	//언어 코드
    String msgId;	//메시지 ID
    String msgCont;	//메시지 내용
    String regId;	//등록자 ID
    String regDt;	//등록 일시
    String modId;	//수정자 ID
    String modDt;	//수정 일시

    public String getRegDt() {
        return regDt;
    }

    public String getModDt() {
        return modDt;
    }

    public String getLangCd() {
        return langCd;
    }

    public String getModId() {
        return modId;
    }

    public String getMsgCont() {
        return msgCont;
    }

    public String getMsgId() {
        return msgId;
    }

    public String getRegId() {
        return regId;
    }

    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    public void setModDt(String modDt) {
        this.modDt = modDt;
    }

    public void setModId(String modId) {
        this.modId = modId;
    }

    public void setMsgCont(String msgCont) {
        this.msgCont = msgCont;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }
}
