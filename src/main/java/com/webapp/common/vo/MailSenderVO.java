package com.webapp.common.vo;

import org.springframework.beans.factory.annotation.Value;

public class MailSenderVO {
    @Value("${mailHost}")
    private String mailHost;
    @Value("${mailPort}")
    private Integer mailPort;
    @Value("${mailuserName}")
    private String mailuserName;
    @Value("${mailPassword}")
    private String mailPassword;
    @Value("${mailTransportProtocol}")
    private String mailTransportProtocol;
    @Value("${mailSmtpAuth}")
    private String mailSmtpAuth;
    @Value("${mailSmtpStarttlsEnable}")
    private String mailSmtpStarttlsEnable;
    @Value("${mailDebug}")
    private String mailDebug;


    public String getMailDebug() {
        return mailDebug;
    }

    public String getMailSmtpAuth() {
        return mailSmtpAuth;
    }

    public String getMailSmtpStarttlsEnable() {
        return mailSmtpStarttlsEnable;
    }

    public String getMailTransportProtocol() {
        return mailTransportProtocol;
    }

    public Integer getMailPort() {
        return mailPort;
    }

    public String getMailHost() {
        return mailHost;
    }

    public String getMailPassword() {
        return mailPassword;
    }

    public String getMailuserName() {
        return mailuserName;
    }

    public void setMailDebug(String mailDebug) {
        this.mailDebug = mailDebug;
    }

    public void setMailSmtpAuth(String mailSmtpAuth) {
        this.mailSmtpAuth = mailSmtpAuth;
    }

    public void setMailSmtpStarttlsEnable(String mailSmtpStarttlsEnable) {
        this.mailSmtpStarttlsEnable = mailSmtpStarttlsEnable;
    }

    public void setMailTransportProtocol(String mailTransportProtocol) {
        this.mailTransportProtocol = mailTransportProtocol;
    }

    public void setMailHost(String mailHost) {
        this.mailHost = mailHost;
    }

    public void setMailPassword(String mailPassword) {
        this.mailPassword = mailPassword;
    }

    public void setMailPort(Integer mailPort) {
        this.mailPort = mailPort;
    }

    public void setMailuserName(String mailuserName) {
        this.mailuserName = mailuserName;
    }

}
