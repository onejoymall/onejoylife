package com.webapp.mall.controller;

import com.webapp.common.security.dao.UserInfoDao;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class restapiController {
    @Autowired
    MessageSource messageSource;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private CurlPost curlPost;
    //이메일 인증
    @RequestMapping(value = "/authemail", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> authEmail(@RequestParam HashMap params){

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String email;
        String memo;
        String subject =  messageSource.getMessage("authSendMailTitle","ko");//
        memo = messageSource.getMessage("atuhSendMailContent","ko");//

        try {
            email = (String)params.get("email");
            //이메일 필수 체크
            if(email.isEmpty()){
                resultMap.put("message", messageSource.getMessage("error.required","ko"));
            }else{
                String basePassword = numberGender.numberGen(4,1);
                List<Map<String, Object>> userData = null;
                //이메일 유효성검사
                String regex ="^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
                Boolean emailValidation = email.matches(regex);
                if(emailValidation){
                    //이메일 중복확인
                    userData= userDAO.getUserList(params);
                    if(userData.size() <= 0){
                        //중복이 아니면 메일전송
//                mailSender.sendSimpleMessage(email, subject, memo+" : "+basePassword);
                        //메일이 정상 적으로 전송되면 회원 이메일과 인증코드를 저장하고 상태를 변경한다.
                        params.put("email_auth_code",basePassword);
                        userDAO.insertEmailAuth(params);
                        resultMap.put("status", "success");
                    }else{
                        //이메일 중복 메세지 출력
                        resultMap.put("message", messageSource.getMessage("error.exsnIdExst","ko"));
                    }
                }else{
                    resultMap.put("message", messageSource.getMessage("error.emailForm","ko"));
                }
            }
        } catch (Exception e) {
            resultMap.put("status", "fail");
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //회원 가입 처리
    @RequestMapping(value = "/signupProc", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> signupProc(@RequestParam HashMap params){
//        Map<String, Object> authList = new ;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            Map<String, Object> authList= userDAO.getEmailAuthList(params);
            //이메일 인증번호 전송 유무 확인
            Integer resultAuthCode = Integer.parseInt((String)authList.get("email_auth_code"));
            Integer postAuthCode = Integer.parseInt((String)params.get("email_auth_code"));
            if(authList.size() > 0){
                if(resultAuthCode.equals(postAuthCode)){
                    params.put("password", passwordEncoder.encode((String)params.get("password")));
                    userDAO.insertUser(params);
                    resultMap.put("status", "success");
                }else{
                    resultMap.put("message", messageSource.getMessage("error.notVldtAthrzCd","ko"));
                }
            }else{
                //이메일인증 미완료
                resultMap.put("message", messageSource.getMessage("error.emailResultFail","ko"));
            }


        } catch (Exception e) {
            resultMap.put("message", messageSource.getMessage("error.exsnIdExst","ko"));
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //로그인 처리 1
    @RequestMapping(value = "/loginProc", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> loginProc(@RequestParam HashMap params){
        Map<String, Object> postToken = null;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {

            String email = (String)params.get("email");
            String password =(String)params.get("password");
            if(email.isEmpty() || password.isEmpty()){
                resultMap.put("message", messageSource.getMessage("error.required","ko"));
            }else{
                params.put("password",passwordEncoder.encode((String)params.get("password")));
                Map<String,Object> loginUserList = userDAO.getLoginUserList(params);

                if( loginUserList.isEmpty()){
                    //최초 로그인시 토큰저장
                    postToken = CurlPost.curlPostFn("http://127.0.0.1:8080/oauth/token?client_id=clientapp&grant_type=password&username="+email+"&password="+password,"application/json","application/x-www-form-urlencoded");
                    params.put("access_token",postToken.get("access_token"));
                    userDAO.updateToken(params);
                    resultMap.put("access_token",postToken.get("access_token"));
                }else{
                    resultMap.put("message", messageSource.getMessage("error.notUsrInfo","ko"));
                }

            }
//
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //로그인 처리 2
    @RequestMapping(value = "/loginProcAuth", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> loginProcAuth(@RequestParam HashMap params, UserInfo userInfo , HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{
            if ( session.getAttribute("login") != null ){
                // 기존에 login이란 세션 값이 존재한다면
                session.removeAttribute("login"); // 기존값을 제거해 준다.
            }


            if ( userInfo != null ){ // 로그인 성공
                session.setAttribute("login", userInfo); // 세션에 login인이란 이름으로 UsersVO 객체를 저장해 놈.
                resultMap.put("redirectUrl", "/");
            }else { // 로그인에 실패한 경우
                resultMap.put("redirectUrl", "/login");
            }

        }catch (Exception e){
            resultMap.put("e", e);
        }
        return resultMap;
    }
}
