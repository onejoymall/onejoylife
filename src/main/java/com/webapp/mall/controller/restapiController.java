package com.webapp.mall.controller;
import static org.springframework.util.CollectionUtils.isEmpty;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CartDAO;
import com.webapp.mall.dao.CommonDAO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.RefundDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.CommonVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.OptionVO;
import com.webapp.mall.vo.UserVO;

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
    @Autowired
    private DeliveryDAO deliveryDAO;
    @Autowired
    private PaymentDAO paymentDAO;
    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private CommonDAO commonDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private RefundDAO refundDAO;
    //장바구니 선택 결재
    @RequestMapping(value = "/payment/cartorder", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> paymentCartOrder(@RequestParam HashMap params,UserVO userVO) throws Exception{
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{

        }catch (Exception e){

        }
        return resultMap;
    }
    //이메일 인증번호 전송
    @RequestMapping(value = "/sign/authemail", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> authemail(@RequestParam HashMap params,UserVO userVO){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        String memo;
        String subject =  messageSource.getMessage("authSendMailTitle","ko");//
        memo = messageSource.getMessage("atuhSendMailContent","ko");//

        try {

            //이메일 필수 체크
            if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }

            //이메일 유효성검사
            String regex ="^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
            Boolean emailValidation = userVO.getEmail().matches(regex);
            if(emailValidation){
                //이메일 중복확인
//                params.put("email",userVO.getEmail());
                params.put("password",null);
                params.put("phone",null);
                Map<String, Object> userData= userDAO.getLoginUserList(params);
                //Spring 4.3 이후부터 import static org.springframework.util.CollectionUtils.isEmpty; 추가로 간단이 Map 의 null체크가 가능하다
                if(!isEmpty(userData)){
                    //이메일 중복 메세지 출력
                    error.put("email", messageSource.getMessage("error.exsnIdExst","ko"));
                }
            }else{
                error.put("email", messageSource.getMessage("error.emailForm","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                String basePassword = numberGender.numberGen(4,2);
                //중복이 아니면 메일전송
                mailSender.sendSimpleMessage(userVO.getEmail(), subject, memo+" : "+basePassword);
                //메일이 정상 적으로 전송되면 회원 이메일과 인증코드를 저장하고 상태를 변경한다.
                params.put("email_auth_code",basePassword);
                userDAO.insertEmailAuth(params);
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //이메일 인증 번호학인
    @RequestMapping(value = "/sign/authEmailProc", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> authEmailProc(@RequestParam HashMap params,UserVO userVO){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getEmail_auth_code()==null){
                error.put("email_auth_code", messageSource.getMessage("error.required","ko"));
            }else{
                Map<String, Object> getAuthCode= userDAO.getEmailAuthCode(userVO);
                //이메일 인증실패
                if(isEmpty(getAuthCode)){
                    error.put("email_auth_code", messageSource.getMessage("error.emailResultFail","ko"));
                }else{
                    Integer resultAuthCode = Integer.parseInt((String)getAuthCode.get("email_auth_code"));
                    if(!resultAuthCode.equals(userVO.getEmail_auth_code())){
                        error.put("email_auth_code", messageSource.getMessage("error.notVldtAthrzCd","ko"));
                    }
                }
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //회원 가입 처리
    @RequestMapping(value = "/sign/signupProc", method = RequestMethod.GET, produces = "application/json")

    public HashMap<String, Object> signupProc(@RequestParam HashMap params, UserVO userVO){

        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getEmail_auth_code()==null){
                error.put("email_auth_code", messageSource.getMessage("error.required","ko"));
            }else{
                Map<String, Object> getAuthCode= userDAO.getEmailAuthCode(userVO);
                //이메일 인증실패
                if(isEmpty(getAuthCode)){
                    error.put("email_auth_code", messageSource.getMessage("error.emailResultFail","ko"));
                }else{
                    Integer resultAuthCode = Integer.parseInt((String)getAuthCode.get("email_auth_code"));
                    if(!resultAuthCode.equals(userVO.getEmail_auth_code())){
                        error.put("email_auth_code", messageSource.getMessage("error.notVldtAthrzCd","ko"));
                    }
                }
            }
            if(userVO.getPassword().isEmpty()){
                error.put("password", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getPassword_cf().isEmpty()){
                error.put("password_cf", messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                params.put("password", passwordEncoder.encode((String)params.get("password")));
                userDAO.insertUser(params);
                userVO.setLog_type("join");
                userDAO.insertUserHistory(userVO);
                resultMap.put("redirectUrl", "/sign/signUpDone");
            }

        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //로그인 처리 1
    @RequestMapping(value = "/sign/loginProc", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> loginProc(@RequestParam HashMap params,HttpSession session,UserInfo userInfo,UserVO userVO){
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
                            //로그인 기록 저장
                            userVO.setLog_type("login");
                            userDAO.insertUserHistory(userVO);
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
        HashMap<String, Object> error = new HashMap<String, Object>();
        String email;
        String memo;
        String phone =  (String)params.get("phone");
        String subject =  messageSource.getMessage("sendMail.passwordChangeTitle","ko");//
        memo = messageSource.getMessage("sendMail.passwordChangeContent","ko");//
        String basePassword = numberGender.numberGen(4,2);
        Object siteUrl = request.getRequestURL().toString().replace(request.getRequestURI(),"");
        try {
            email = (String)params.get("email");
            //이메일 필수 체크
            if(email.isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }else{
                //이메일 유효성검사
                String regex ="^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
                Boolean emailValidation = email.matches(regex);
                if(emailValidation){
                    //이메일 중복확인
                    params.put("password",null);
                    params.put("phone",null);
                    Map<String, Object> userData= userDAO.getLoginUserList(params);
                    //Spring 4.3 이후부터 import static org.springframework.util.CollectionUtils.isEmpty; 추가로 간단이 Map 의 null체크가 가능하다
                    if(isEmpty(userData)){
                        error.put("Error", messageSource.getMessage("error.userNotFound","ko"));
                    }
                }else{
                    error.put("Erro", messageSource.getMessage("error.emailForm","ko"));
                }
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else {
                mailSender.sendSimpleMessage(email, subject, memo+" : "+siteUrl+"/sign/changePassword?password_change_code="+basePassword+"&email="+email);
                params.put("password_change_code",basePassword);
                userDAO.updatePasswordChangeCode(params);
                resultMap.put("success", messageSource.getMessage("error.infoSendEmail","ko"));
                resultMap.put("redirectUrl","/sign/login");
            }

        } catch (Exception e) {
            resultMap.put("status", "fail");
            resultMap.put("e", e);
        }
        return resultMap;
    }

    //아이디찾기
    @RequestMapping(value = "/sign/findId", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> findId(@RequestParam HashMap params,HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        String phone=(String)params.get("phone");
        try{
            if(phone.equals("") || phone.equals(null)){
                error.put(messageSource.getMessage("phone","ko"), messageSource.getMessage("error.required","ko"));
            }
            Map<String, Object> userInfo = userDAO.getFindUser(params);
            if(isEmpty(userInfo)){
                resultMap.put("validateError",error);
                error.put("Error", messageSource.getMessage("error.userNotFound","ko"));
            }else{
                resultMap.put("redirectUrl","/sign/findPassword");
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }
        }catch (Exception e){
            e.printStackTrace();
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


        try {
            Integer userPoint = 0; //사용자 포인트
            Integer usedPoint = giveawayVO.getPoint();  //입력 포인트

            //로그인 확인
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            if(isEmpty(userInfo)){
                //로그인정보 확인
                error.put("Error", messageSource.getMessage("error.noLoginInfo","ko"));
            }else{
                //보유포인트 확인
                params.put("point_paid_user_id",userInfo.get("usr_id"));
                userPoint = pointDAO.getPointAmount(params);
                //보유 포인트 와 금액부족
                if(usedPoint > userPoint ){
                    error.put("Error", messageSource.getMessage("error.paymentIsLess","ko"));
                }
            }

            if(usedPoint==0){
                error.put(messageSource.getMessage("used_point","ko"), messageSource.getMessage("error.required","ko"));
            }



            params.put("giveaway_cd",request.getParameter("giveaway_cd"));
            params.put("giveaway_id",request.getParameter("giveaway_id"));
            Map<String,Object> giveaway = giveawayDAO.getGiveawayDetail(params);
            Integer giveawayUsePoint = (Integer)giveaway.get("giveaway_payment");
            Integer giveaway_play_winner_point=0;

            //자동추첨 기준
            if(giveaway.get("giveaway_play_winner_point")==null) {
                error.put("Error", messageSource.getMessage("error.giveawayPlayWinnerPoint","ko"));
            }else{
                giveaway_play_winner_point = (Integer) giveaway.get("giveaway_play_winner_point");
            }
            //상품응모포인트와 입력한 포인트
            if(giveawayUsePoint > usedPoint){
                error.put("Error", messageSource.getMessage("error.paymentUsedIsLess","ko"));
            }

            //검증
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                //경품 자동추첨 금액 달성시 당첨차 추첨

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
//                    resultMap.put("redirectUrl",request.getHeader("Referer"));
                }
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
            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));

            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                deliveryInfoVO.setOrder_user_id( Integer.parseInt(numberGender.numberGen(6,1)));
            }else{
                deliveryInfoVO.setOrder_user_id((Integer)userInfo.get("usr_id"));
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
                deliveryDAO.insertDelivery(deliveryInfoVO);
//                params.put("giveaway_payment_status","B");
//                params.put("giveaway_play_cd",deliveryInfoVO.getGiveaway_play_cd());
//                deliveryDAO.updateGiveawayDeliveryStatus(params);
                resultMap.put("redirectUrl","/MyPage/giveawaypayment?order_no="+deliveryInfoVO.getOrder_no());
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //결제 정보저장
    @RequestMapping(value = "/SavePayment", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> SavePayment(@RequestParam HashMap params,HttpServletRequest request,HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            //결제번호생성
            params.put("payment_cd","PM"+numberGender.numberGen(6,1));

            params.put("email",session.getAttribute("email"));
            //실제 결제승인이 이뤄졌거나, 가상계좌 발급이 성공된 경우, true
            if(deliveryInfoVO.getSuccess()){
                params.put("payment_status","W");
                //가상계좌결제시 미결제로 상태변경
                if(deliveryInfoVO.getPay_method().equals("vbank")){
                    params.put("payment_status","M");
                }
            }
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                //비회원 주문시 사용자아이디 임시 저장
                params.put("payment_user_id",numberGender.numberGen(6,1));
                resultMap.put("redirectUrl", "/MyPage/OrderDetailGuest?order_no="+deliveryInfoVO.getOrder_no());
            }else{
                params.put("payment_user_id",userInfo.get("usr_id"));
                params.put("point_paid_user_id",userInfo.get("usr_id"));
                //회원인 경우 보유포인트 확인


                Map<String,Object> productInfo =productDAO.getProductViewDetail(params);
                String getPointAmountString = Integer.toString(pointDAO.getPointAmount(params));
                String getPaymentString = Integer.toString((Integer)productInfo.get("product_payment"));
                //상품결제 시 포인트 배율 확인 및 지급
                //상품결제시 에만 포인트 지급 입력된 값이 있을떼만
                if(deliveryInfoVO.getPayment_class().equals("PRODUCT")){
                    BigDecimal userPoint = new BigDecimal(getPointAmountString);//보유포인트
                    BigDecimal payment = new BigDecimal(getPaymentString);//구매금액
                    BigDecimal productPointRate = new BigDecimal((String)productInfo.get("product_point_rate"));//포인트배율
                    BigDecimal hPersent = new BigDecimal("100");//백분율
                    if(productPointRate.compareTo(BigDecimal.ZERO) == 1){

                        BigDecimal pointMultiply = productPointRate.multiply(payment).divide(hPersent);
                        params.put("point_amount",userPoint.add(pointMultiply));
                        params.put("point_paid_memo",productInfo.get("product_name"));
                        params.put("point_add",pointMultiply);
                        params.put("point_paid_user_id",userInfo.get("usr_id"));
                        params.put("point_paid_type","P");
                        params.put("point_paid_product_cd",productInfo.get("product_cd"));
                        params.put("order_no",deliveryInfoVO.getOrder_no());
                        pointDAO.insertPoint(params);
                    }
                }
                resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
            }


            paymentDAO.insertPayment(params);

            //경품 응모시 결제 상태 변경
            if(deliveryInfoVO.getPayment_class().equals("GIVEAWAY")){
                if(params.get("success").equals("false")){
                    params.put("giveaway_payment_status","A");
                }else{
                    params.put("giveaway_payment_status","B");
                }

                paymentDAO.updateGiveawayDeliveryStatus(params);
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //교환
    @RequestMapping(value = "/SaveOrderChange", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> SaveOrderChange(@RequestParam HashMap params,HttpServletRequest request,HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(deliveryInfoVO.getReason().isEmpty()){
                error.put(messageSource.getMessage("reason","ko"), messageSource.getMessage("error.required","ko"));
            }

            params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                //비회원
            }else{

            }


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                //결제상태 업데이트
                deliveryInfoVO.setPayment_status("F");
                deliveryInfoVO.setDelivery_status("F");
                deliveryInfoVO.setMerchant_uid(deliveryInfoVO.getOrder_no());
                deliveryDAO.updateDelivery(deliveryInfoVO);
                paymentDAO.updatePayment(deliveryInfoVO);
                refundDAO.insertDeliveryRefund(deliveryInfoVO);
                //교환정보 저장

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //반품
    @RequestMapping(value = "/SaveOrderRollback", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> SaveOrderRollback(@RequestParam HashMap params,HttpServletRequest request,HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(deliveryInfoVO.getReason().isEmpty()){
                error.put(messageSource.getMessage("reason","ko"), messageSource.getMessage("error.required","ko"));
            }

            params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                //비회원
            }else{

            }


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                //환불을위한 토큰발급
                IamportClient client;
                String test_api_key = "7152058542143411";
                String test_api_secret = "mVKoCqCox7EBEya9KmB8RLeEzFwZBhpYd9mPAZe76SILqTVbgxj7jyLSdhSPzhNMraC19Q9gJS2aLXl1";
                client = new IamportClient(test_api_key, test_api_secret);
                String test_already_cancelled_merchant_uid = deliveryInfoVO.getMerchant_uid();
                CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
                //cancel_data.setEscrowConfirmed(true); //에스크로 구매확정 후 취소인 경우 true설정

                IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
                //결제상태 업데이트
                deliveryInfoVO.setPayment_status("H");
                deliveryInfoVO.setDelivery_status("H");
                deliveryInfoVO.setMerchant_uid(deliveryInfoVO.getOrder_no());
                deliveryDAO.updateDelivery(deliveryInfoVO);
                paymentDAO.updatePayment(deliveryInfoVO);
                refundDAO.insertDeliveryRefund(deliveryInfoVO);
                //교환정보 저장

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //결제 취소요청
    @RequestMapping(value = "/SavePaymentCancel", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> SavePaymentCancel(@RequestParam HashMap params,HttpServletRequest request,HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                //비회원 주문
                resultMap.put("redirectUrl", "/");
            }else{
                params.put("payment_user_id",userInfo.get("usr_id"));
                //회원인 경우 보유포인트 확인
                resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
            }

//            //환불을위한 토큰발급
            IamportClient client;
            String test_api_key = "7152058542143411";
            String test_api_secret = "mVKoCqCox7EBEya9KmB8RLeEzFwZBhpYd9mPAZe76SILqTVbgxj7jyLSdhSPzhNMraC19Q9gJS2aLXl1";
            client = new IamportClient(test_api_key, test_api_secret);
//            IamportResponse<AccessToken> auth_response = client.getAuth();
            String test_already_cancelled_merchant_uid = deliveryInfoVO.getMerchant_uid();
            CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
            //cancel_data.setEscrowConfirmed(true); //에스크로 구매확정 후 취소인 경우 true설정

            IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);

            if(payment_response.getResponse()==null){
                error.put("Error", payment_response.getMessage());
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                deliveryInfoVO.setDelivery_status("C");
                deliveryInfoVO.setPayment_status("C");
                deliveryDAO.updateDelivery(deliveryInfoVO);
                paymentDAO.updatePayment(deliveryInfoVO);
                paymentDAO.insertPaymentRefund(deliveryInfoVO);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //찜
    @RequestMapping(value = "/cart/addFavorites", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> addaddFavorites(@RequestParam HashMap params,HttpSession session,HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            //session.setAttribute("email",email);
            //카트번호
            params.put("product_favorites_cd","FV"+numberGender.numberGen(6,1));
            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            if(isEmpty(userInfo)){
                String cart_user_id = numberGender.numberGen(6,1);
                params.put("member_yn","N");

                if ( session.getAttribute("nonMembersUserId") == null ){
                    session.setAttribute("nonMembersUserId",cart_user_id);
                    params.put("user_id",cart_user_id);
                }else{
                    params.put("user_id",session.getAttribute("nonMembersUserId"));
                }
            }else{
                params.put("member_yn","Y");
                params.put("user_id",userInfo.get("usr_id"));
            }
            //카트 중복조회
            if(cartDAO.getFavoritesListCount(params) > 0){
                error.put("Error", messageSource.getMessage("error.duplicateFavorites","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                cartDAO.insertFavorites(params);
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

    //장바구니 등록
    @RequestMapping(value = "/cart/addcart", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> addCart(HttpSession session, HttpServletRequest request,OptionVO optionVO,@RequestParam HashMap params){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            String  cart_cd = "CR"+numberGender.numberGen(6,1);
            //카트번호
            params.put("cart_cd",cart_cd);
            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            if(isEmpty(userInfo)){
                String cart_user_id = numberGender.numberGen(6,1);
                params.put("member_yn","N");

                if ( session.getAttribute("nonMembersUserId") == null ){
                    session.setAttribute("nonMembersUserId",cart_user_id);
                    params.put("cart_user_id",cart_user_id);
                }else{
                    params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
                }
            }else{
                params.put("member_yn","Y");
                params.put("cart_user_id",userInfo.get("usr_id"));
            }
            //카트 중복조회
            if(cartDAO.getCartListCount(params) > 0){
                error.put("Error", messageSource.getMessage("error.duplicateCart","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
//                List<OptionVO> optionList = new ArrayList<OptionVO>();
//                optionVO.setCart_cd(cart_cd);
//                optionList.add(optionVO);
//                optionVO.setOptionVOList(optionList);
//                cartDAO.insertCartOption(optionVO);
                cartDAO.insertCart(params);
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //장바구니 삭제
    @RequestMapping(value = "/cart/deletecart", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> deleteCart(@RequestParam HashMap params,HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{
            cartDAO.deleteCart(params);
            resultMap.put("redirectUrl","/MyPage/ShoppingBasket");
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

    //장바구니 변경
    @RequestMapping(value = "/cart/updateCart", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> updateCart(@RequestParam HashMap params,HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{
            cartDAO.updateCart(params);
            resultMap.put("redirectUrl","/MyPage/ShoppingBasket");
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }


    // 상품 결제
    @RequestMapping(value = "/product/paymentProc")
    public  HashMap<String, Object> productPaymentProc(@RequestParam HashMap params,HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{
//            cartDAO.deleteCart(params);
            resultMap.put("redirectUrl","/MyPage/OrderAndDelivery");
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    // 매인 상품 진열
    @RequestMapping(value="/product/mainList")
    public HashMap<String, Object> productMainList(@RequestParam HashMap params, HttpSession session, SearchVO searchVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{
            if(searchVO.getOrderByValue()==null || searchVO.getOrderByKey()==null){
                searchVO.setOrderByKey("product_id");
                searchVO.setOrderByValue("DESC");
            }
            searchVO.setDisplayRowCount(8);
            searchVO.setStaticRowEnd(8);
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            searchVO.setProduct_sale_yn("Y");
            List<Map<String,Object>> list = productDAO.getProductList(searchVO);
            resultMap.put("mdSlideCategorySelect",list);
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //공통 리스트삭제
    @RequestMapping(value = "/MyPage/commonListDelete", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> mypageListDelete(@RequestParam HashMap params, CommonVO commonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            //테이블명 table
            //pk 필드명 pk
            //삭제할 배열 chk

            if(commonVO.getPk().equals(null) || commonVO.getPk().equals("")){
                error.put("Pk name", messageSource.getMessage("error.required","ko"));
            }
            if(commonVO.getTable_name().equals(null) || commonVO.getTable_name().equals("")){
                error.put("Table", messageSource.getMessage("error.required","ko"));
            }
//            if(mgCommonVO.getChk().size() <= 0){
//                error.put("check box selector", messageSource.getMessage("error.required","ko"));
//            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                commonDAO.commonListDelete(commonVO);
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    
  //배송지 삭제
    @Transactional
    @RequestMapping(value = "/MyPage/DeliveryAddressDelete", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> mypageDeliveryAddressDelete(@RequestParam HashMap params, CommonVO commonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
        	if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                deliveryDAO.deleteDelivery(params);
                resultMap.put("redirectUrl","/MyPage/DeliveryAddress");
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
}
