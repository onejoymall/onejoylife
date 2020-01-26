package com.webapp.common.support;

import com.webapp.common.vo.MailSenderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Component("mailSender")
public class MailSender {
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
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(mailHost);
        mailSender.setPort(mailPort);
        //추후 config context 와 properties 추가
        mailSender.setUsername(mailuserName);
        mailSender.setPassword(mailPassword);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", mailTransportProtocol);
        props.put("mail.smtp.auth", mailSmtpAuth);
        props.put("mail.smtp.starttls.enable", mailSmtpStarttlsEnable);
        props.put("mail.debug", mailDebug);

        return mailSender;
    }
    @Autowired
    public JavaMailSender emailSender;

    public void sendSimpleMessage(String to, String subject, String text) {
//        SimpleMailMessage message = new SimpleMailMessage();
        MimeMessage message = emailSender.createMimeMessage();
        try{
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            message.setSubject(subject,"UTF-8");
            message.setText(text,"UTF-8","html");
            messageHelper.setFrom(mailuserName, "OnejoyLife team");
            messageHelper.setTo(new InternetAddress(to,"", "UTF-8"));
            emailSender.send(message);
        }catch (Exception e){

        }
    }
}
