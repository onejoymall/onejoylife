package com.webapp.mall.controller;
import com.sun.javafx.collections.MappingChange;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.util.CollectionUtils.isEmpty;

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
    @Autowired
    private PointDAO pointDAO;
    @Autowired
    private GiveawayDAO giveawayDAO;

    //이메일 인증
    @RequestMapping(value = "/sign/authemail", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> authEmail(@RequestParam HashMap params){

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String email = (String)params.get("email");
        String memo;
        String subject =  messageSource.getMessage("authSendMailTitle","ko");//
        memo = messageSource.getMessage("atuhSendMailContent","ko");//

        try {

            //이메일 필수 체크
            if(email.isEmpty()){
                resultMap.put("message", messageSource.getMessage("error.required","ko"));
            }else{
                String basePassword = numberGender.numberGen(4,2);

                //이메일 유효성검사
                String regex ="^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
                Boolean emailValidation = email.matches(regex);
                if(emailValidation){
                    //이메일 중복확인
                    params.put("password",null);
                    Map<String, Object> userData= userDAO.getLoginUserList(params);
                    //Spring 4.3 이후부터 import static org.springframework.util.CollectionUtils.isEmpty; 추가로 간단이 Map 의 null체크가 가능하다
                    if(isEmpty(userData) || userData == null){
                        //중복이 아니면 메일전송
                        mailSender.sendSimpleMessage(email, subject, memo+" : "+basePassword);
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
    @RequestMapping(value = "/sign/signupProc", method = RequestMethod.GET, produces = "application/json")

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
                    resultMap.put("redirectUrl", "/sign/signUpDone");
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
    @RequestMapping(value = "/sign/loginProc", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> loginProc(@RequestParam HashMap params,HttpSession session,UserInfo userInfo){
        Map<String, Object> postToken = null;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {

            String email = (String)params.get("email");
            String password =(String)params.get("password");
            params.put("password",null);//패스워드 초기화
            if(email.isEmpty() || password.isEmpty()){
                resultMap.put("message", messageSource.getMessage("error.required","ko"));
            }else{
//                params.put("password",passwordEncoder.encode((String)params.get("password")));

                //Spring Security 5 단방향 암호화 패스워드 일치 확인 을 위해 이메일로 사용자정보를 가져온후 처리
                Map<String,Object> loginUserList = userDAO.getLoginUserList(params);

                if(!isEmpty(loginUserList)){

                    if(passwordEncoder.matches(password,(String)loginUserList.get("password"))){
                        if ( session.getAttribute("login") != null ){
                            // 기존에 login이란 세션 값이 존재한다면
                            session.removeAttribute("login"); // 기존값을 제거해 준다.
                        }
                        if ( userInfo != null ){ // 로그인 성공
                            userInfo.setLogin(true);
                            userInfo.setUserName(email);
                            session.setAttribute("email",email);
                            session.setAttribute("login", true); //
                            session.setAttribute("userInfo",userInfo);
                            resultMap.put("redirectUrl", "/");
                        }
//                        else { // 로그인에 실패한 경우
//                            resultMap.put("redirectUrl", "/login");
//                        }
                        //최초 로그인시 토큰저장(지금은 안써도됨)
//                        postToken = CurlPost.curlPostFn("http://127.0.0.1:8080/oauth/token?client_id=clientapp&grant_type=password&username="+email+"&password="+password,"application/json","application/x-www-form-urlencoded");
//                        params.put("access_token",postToken.get("access_token"));
//                        userDAO.updateToken(params);
//                        resultMap.put("access_token",postToken.get("access_token"));
                    }else{
                        resultMap.put("message", messageSource.getMessage("error.notUsrInfo","ko"));
                    }
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

    //패스워드 초기화 1
    @RequestMapping(value = "/sign/findPassword", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> findPassword(@RequestParam HashMap params,HttpServletRequest request){

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String email;
        String memo;
        String subject =  messageSource.getMessage("sendMail.passwordChangeTitle","ko");//
        memo = messageSource.getMessage("sendMail.passwordChangeContent","ko");//
        String basePassword = numberGender.numberGen(4,2);
        Object siteUrl = request.getRequestURL().toString().replace(request.getRequestURI(),"");
        try {
            email = (String)params.get("email");
            //이메일 필수 체크
            if(email.isEmpty()){
                resultMap.put("message", messageSource.getMessage("error.required","ko"));
            }else{
                //이메일 유효성검사
                String regex ="^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
                Boolean emailValidation = email.matches(regex);
                if(emailValidation){
                    //이메일 중복확인
                    Map<String, Object> userData= userDAO.getLoginUserList(params);
                    //Spring 4.3 이후부터 import static org.springframework.util.CollectionUtils.isEmpty; 추가로 간단이 Map 의 null체크가 가능하다
                    if(!isEmpty(userData)){

                        mailSender.sendSimpleMessage(email, subject, memo+" : "+siteUrl+"/sign/changePassword?password_change_code="+basePassword+"&email="+email);
                        params.put("password_change_code",basePassword);
                        userDAO.updatePasswordChangeCode(params);
                        resultMap.put("message", messageSource.getMessage("error.infoSendEmail","ko"));
                    }else{
                        resultMap.put("message", messageSource.getMessage("error.userNotFound","ko"));
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

    //패스워드 초기화 2

    @RequestMapping(value = "/sign/changePasswordProc", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> changePasswordProc(@RequestParam HashMap params,HttpServletRequest request){

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String email = (String)params.get("email");
        String password = (String)params.get("password");
        String passwordCf =(String)params.get("password_cf");
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {

            if(password==null || password.isEmpty()){
                error.put("Password", messageSource.getMessage("error.required","ko"));
            }
            if(passwordCf==null || passwordCf.isEmpty()){
                error.put("PasswordCf", messageSource.getMessage("error.required","ko"));
            }
            if(password.equals(passwordCf) && !email.isEmpty()){
                params.put("password", passwordEncoder.encode((String)params.get("password")));
                userDAO.updatePasswordChange(params);
                resultMap.put("url","/sign/changePasswordDone");
            }else {
                error.put("PasswordCf", messageSource.getMessage("error.inpPwdCfm", "ko"));
            }
            resultMap.put("validateError",error);
        } catch (Exception e) {
            resultMap.put("status", "fail");
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //로그인 처리 2 $2a$10$H7XwLGO27fJwkZ5KrK6rCONJBIEJP.9WEW1C13rgpnX2InWhwlE6m
//    @RequestMapping(value = "/sign/loginProcAuth", method = RequestMethod.GET, produces = "application/json")
//    public HashMap<String, Object> loginProcAuth(@RequestParam HashMap params, UserInfo userInfo , HttpSession session){
//        HashMap<String, Object> resultMap = new HashMap<String, Object>();
//        try{
//            if ( session.getAttribute("login") != null ){
//                // 기존에 login이란 세션 값이 존재한다면
//                session.removeAttribute("login"); // 기존값을 제거해 준다.
//            }
//            if ( userInfo != null ){ // 로그인 성공
//                session.setAttribute("login", userInfo); // 세션에 login인이란 이름으로 UsersVO 객체를 저장해 놈.
//                resultMap.put("redirectUrl", "/");
//            }else { // 로그인에 실패한 경우
//                resultMap.put("redirectUrl", "/login");
//            }
//
//        }catch (Exception e){
//            resultMap.put("e", e);
//        }
//        return resultMap;
//    }
    //포인트 잔액확인 및 경품참여
    @RequestMapping(value = "/giveaway/PointAmountCheckProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> PointAmountCheckProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, GiveawayVO giveawayVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        Integer usedPoint;
        try {
            if(params.get("point").equals("")){
                usedPoint =0;
            }else{
                usedPoint = Integer.parseInt((String)params.get("point"));
            }

            params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            if(isEmpty(userInfo)){
                //로그인정보
                error.put("Error", messageSource.getMessage("error.noLoginInfo","ko"));
            }else{
                //보유포인트 확인
                params.put("point_paid_user_id",userInfo.get("usr_id"));
                Integer userPoint = pointDAO.getPointAmount(params);
                Map<String,Object> giveaway = giveawayDAO.getGiveawayDetail(params);

                //배송비?
                //입력금액부족
                if(usedPoint < (Integer)giveaway.get("giveaway_payment")){
                    error.put("Error", messageSource.getMessage("error.paymentUsedIsLess","ko"));
                }
                //금액부족
                if(usedPoint > userPoint ){
                    error.put("Error", messageSource.getMessage("error.paymentIsLess","ko"));
                }else{


                    //경품 자동추첨 금액 달성시 당첨차 추첨
                    Integer giveaway_play_winner_point = (Integer)giveaway.get("giveaway_play_winner_point");
                    Integer giveawayPlaySumPoint = giveawayDAO.getGiveawayPlaySumPoint(params);
                    if(giveaway_play_winner_point > giveawayPlaySumPoint){
                        //경품참여정보 저장
                        String giveaway_play_cd = numberGender.numberGen(8,1);
                        giveawayVO.setGiveaway_play_cd("GP"+giveaway_play_cd);
                        giveawayVO.setGiveaway_cd((String)giveaway.get("giveaway_cd"));
                        giveawayVO.setGiveaway_payment_epoint(usedPoint);
                        giveawayVO.setGiveaway_play_user_id((Integer)userInfo.get("usr_id"));
                        giveawayDAO.insertGiveawayPlay(giveawayVO);
                        //포인트 차감
                        params.put("point_amount",userPoint-usedPoint);
                        params.put("point_paid_memo",(String)giveaway.get("giveaway_name"));
                        params.put("point_use",usedPoint);
                        params.put("point_paid_user_id",(Integer)userInfo.get("usr_id"));
                        params.put("point_paid_type","B");
                        params.put("point_paid_product_cd",(String)giveaway.get("giveaway_cd"));
                        pointDAO.insertPoint(params);
                        //자동추첨
                        if(giveaway_play_winner_point <= giveawayDAO.getGiveawayPlaySumPoint(params)){
                            params.put("giveaway_play_status","W");
                            Integer giveawayPlayCount = giveawayDAO.getUserGiveawayPlayListCount(params);
                            //당첨자가 없으면 진행
                            if(giveawayPlayCount <= 0 ){
                                params.put("giveaway_play_id",giveawayDAO.getGiveawayPlayUserRandId(params));
                                giveawayDAO.updateWinnerUser(params);
                                giveawayDAO.insertGiveawayWinner(params);
                            }
                        }
                        resultMap.put("redirectUrl","/MyPage/GiveawayWinningList");

                    }else{
                        error.put("Error", messageSource.getMessage("error.giveawayMaxPoint","ko"));
                    }
                }

            }
            if(usedPoint.equals(null) || usedPoint <= 0 ){
                //필수입력항목
                error.put(messageSource.getMessage("used_point","ko"), messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //배송정보 저장
    @RequestMapping(value = "/SaveDeliveInfo", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> SaveDeliveInfo(@RequestParam HashMap params,HttpServletRequest request,HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            if(deliveryInfoVO.getOrder_user_name().isEmpty()){
                error.put(messageSource.getMessage("order_user_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getOrder_user_email().isEmpty()){
                error.put(messageSource.getMessage("order_user_email","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getOrder_user_phone().isEmpty()){
                error.put(messageSource.getMessage("order_user_phone","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getDelivery_user_name().isEmpty()){
                error.put(messageSource.getMessage("delivery_user_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getDelivery_user_phone().isEmpty()){
                error.put(messageSource.getMessage("delivery_user_phone","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getDelivery_user_tel().isEmpty()){
                error.put(messageSource.getMessage("delivery_user_tel","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getPostcode().isEmpty()){
                error.put(messageSource.getMessage("postcode","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getRoadAddress().isEmpty()){
                error.put(messageSource.getMessage("roadAddress","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getExtraAddress().isEmpty()){
                error.put(messageSource.getMessage("extraAddress","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
}
