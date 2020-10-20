package com.webapp.mall.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CartDAO;
import com.webapp.mall.dao.CommonDAO;
import com.webapp.mall.dao.CouponDAO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.IamPortDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.RefundDAO;
import com.webapp.mall.dao.ReviewDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.mall.vo.CommonVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.OptionVO;
import com.webapp.mall.vo.QnaVO;
import com.webapp.mall.vo.UserVO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.dao.QnaDAO;
import com.webapp.manager.vo.ProductVO;

@RestController
public class restapiController {
	@Autowired
	private BoardSvc boardSvc;
	@Autowired
	private IamPortDAO iamPortDAO;
	@Autowired
	private BoardGroupSvc boardGroupSvc;
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
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private MgSystemDAO mgSystemDAO;
	@Autowired
	private CouponDAO couponDAO;
	IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;
	@Value("${downloadPath}")
	private String downloadPath;
	@Value("${downloadEditorPath}")
	private String downloadEditorPath;

	// 장바구니 선택 결재
	@RequestMapping(value = "/payment/cartorder", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> paymentCartOrder(@RequestParam HashMap params, UserVO userVO) throws Exception {
		HashMap<String, Object> error = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

		} catch (Exception e) {

		}
		return resultMap;
	}

	// 이메일 중복확인
		@RequestMapping(value = "/sign/emailChk", method = RequestMethod.GET, produces = "application/json")

		public HashMap<String, Object> emailChk(@RequestParam HashMap params, UserVO userVO,HttpServletRequest request, HttpSession session) {
			HashMap<String, Object> error = new HashMap<String, Object>();
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			String memo;
			String subject = messageSource.getMessage("authSendMailTitle", "ko");//
			memo = messageSource.getMessage("atuhSendMailContent", "ko");//
			
			try {

				// 이메일 필수 체크
				if (userVO.getEmail().isEmpty()) {
					error.put("email", messageSource.getMessage("error.required", "ko"));
				}

				// 이메일 유효성검사
				String regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
				Boolean emailValidation = userVO.getEmail().matches(regex);
				if (emailValidation) {
					// 이메일 중복확인
//	                params.put("email",userVO.getEmail());
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
	              
					userDAO.insertEmailAuth(params);
	            }
	        } catch (Exception e) {
	            resultMap.put("e", e);
	        }
	        return resultMap;
	    }
	// 이메일 인증번호 전송
	@RequestMapping(value = "/sign/authemail", method = RequestMethod.GET, produces = "application/json")

	public HashMap<String, Object> authemail(@RequestParam HashMap params, UserVO userVO) {
		HashMap<String, Object> error = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		String memo;
		String subject = messageSource.getMessage("authSendMailTitle", "ko");//
		memo = messageSource.getMessage("atuhSendMailContent", "ko");//

		try {

			// 이메일 필수 체크
			if (userVO.getEmail().isEmpty()) {
				error.put("email", messageSource.getMessage("error.required", "ko"));
			}

			// 이메일 유효성검사
			String regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
			Boolean emailValidation = userVO.getEmail().matches(regex);
			if (emailValidation) {
				// 이메일 중복확인
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
                String basePassword = numberGender.numberGen(4,1);
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

    public HashMap<String, Object> signupProc(@RequestParam HashMap params,ModelMap model, UserVO userVO,HttpServletRequest request,HttpSession session){

        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        Device device = DeviceUtils.getCurrentDevice(request);
       
        try {
        
        
       		 Object siteUrl = session.getAttribute("RefererUrl");

       		 if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }
            /* 이메일 인증 필요없다하여 주석처리20200923
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
            */
            
            if(userVO.getPassword().isEmpty()){
                error.put("password", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getPassword_cf().isEmpty()){
                error.put("password_cf", messageSource.getMessage("error.required","ko"));
            }
            if(userVO.getPhone().isEmpty()){
            	error.put("phone", messageSource.getMessage("error.required","ko"));
            }
            

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	session.setAttribute("RefererUrl",request.getHeader("Referer"));
            	//Object RefererUrl = session.getAttribute("RefererUrl");
                params.put("password", passwordEncoder.encode((String)params.get("password")));
                userDAO.insertUser(params);
                userVO.setLog_type("join");
                userDAO.insertUserHistory(userVO);
                resultMap.put("redirectUrl", "/sign/signUpDone");
                
                params.put("coupon_condition","J");
                params.put("login_alert_yn","");
                params.put("email_alert_yn","Y");
                params.put("sms_alert_yn","");
                List<Map<String,Object>> joinCoupon = couponDAO.getCouponList(params);
                for(Map<String,Object> coupon:joinCoupon) {
                	mailSender.sendSimpleMessage(userVO.getEmail(), "쿠폰이 발급되었습니다", "["+coupon.get("coupon_name")+"] 쿠폰을 마이페이지에서 확인하세요.");
                }
           
            }
	
			
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //회원 탈퇴
    @RequestMapping(value = "/sign/withdrawProc", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> withdrawProc(@RequestParam HashMap params, UserVO userVO, HttpSession session){
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	try {
    		params.put("email", session.getAttribute("email"));
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			
			if(!isEmpty(userInfo)){
				userDAO.deleteUser(userInfo);
				resultMap.put("redirectUrl", "/sign/logout");
			}
    	} catch (Exception e) {
    		e.printStackTrace();
    		resultMap.put("e", e);
    	}
    	return resultMap;
    }
    //로그인 처리 1
    @RequestMapping(value = "/sign/loginProc", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> loginProc(@RequestParam HashMap params,HttpSession session,UserInfo userInfo,HttpServletRequest request,UserVO userVO){
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
                Object RefererUrl = session.getAttribute("RefererUrl");

                String product_cd=null;
                if (!isEmpty((List<String>)session.getAttribute("today"))){
                    List<String> list = (List<String>)session.getAttribute("today");
                    product_cd = list.get(list.size()-1);
                }

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
//                            if(product_cd!= null){
//                                resultMap.put("redirectUrl", "/product/productDetail?product_cd="+product_cd);
//                            } else 
                        	if(RefererUrl!=null) {
                                resultMap.put("redirectUrl",RefererUrl);
                            } else {
                                resultMap.put("redirectUrl", "/");
                            }

                        }


                        if(session.getAttribute("nonMembersUserId") != null){
                            Map<String,Object> userInfo2 = userDAO.getLoginUserList(params);
                            params.put("cart_user_id",userInfo2.get("usr_id"));
                            params.put("nonMembersUserId",session.getAttribute("nonMembersUserId"));
                            cartDAO.updateCartUser(params);
                        }
//                        else { // 로그인에 실패한 경우
//                            resultMap.put("redirectUrl", "/login");
//                        }
						// 최초 로그인시 토큰저장(지금은 안써도됨)
//                        postToken = CurlPost.curlPostFn("http://127.0.0.1:8080/oauth/token?client_id=clientapp&grant_type=password&username="+email+"&password="+password,"application/json","application/x-www-form-urlencoded");
//                        params.put("access_token",postToken.get("access_token"));
//                        userDAO.updateToken(params);
//                        resultMap.put("access_token",postToken.get("access_token"));
					} else {
						resultMap.put("message", messageSource.getMessage("error.notUsrInfo", "ko"));
					}
				} else {
					resultMap.put("message", messageSource.getMessage("error.notUsrInfo", "ko"));
				}

			}
//
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 패스워드 초기화 1
	@RequestMapping(value = "/sign/findPassword", method = RequestMethod.GET, produces = "application/json")

	public HashMap<String, Object> findPassword(@RequestParam HashMap params, HttpServletRequest request) {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		String email;
		String memo;
		String phone = (String) params.get("phone");
		String subject = messageSource.getMessage("sendMail.passwordChangeTitle", "ko");//
		memo = messageSource.getMessage("sendMail.passwordChangeContent", "ko");//
		String basePassword = numberGender.numberGen(4, 1);
		Object siteUrl = request.getRequestURL().toString().replace(request.getRequestURI(), "");
		try {
			email = (String) params.get("email");
			// 이메일 필수 체크
			if (email.isEmpty()) {
				error.put("email", messageSource.getMessage("error.required", "ko"));
			} else {
				// 이메일 유효성검사
				String regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
				Boolean emailValidation = email.matches(regex);
				if (emailValidation) {
					// 이메일 중복확인
					params.put("password", null);
					params.put("phone", null);
					Map<String, Object> userData = userDAO.getLoginUserList(params);
					// Spring 4.3 이후부터 import static
					// org.springframework.util.CollectionUtils.isEmpty; 추가로 간단이 Map 의 null체크가 가능하다
					if (isEmpty(userData)) {
						error.put("Error", messageSource.getMessage("error.userNotFound", "ko"));
					}
				} else {
					error.put("Erro", messageSource.getMessage("error.emailForm", "ko"));
				}
			}
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				mailSender.sendSimpleMessage(email, subject, memo + " : " + siteUrl
						+ "/sign/changePassword?password_change_code=" + basePassword + "&email=" + email);
				params.put("password_change_code", basePassword);
				userDAO.updatePasswordChangeCode(params);
				resultMap.put("success", messageSource.getMessage("error.infoSendEmail", "ko"));
				resultMap.put("redirectUrl", "/sign/login");
			}

		} catch (Exception e) {
			resultMap.put("status", "fail");
			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 아이디찾기
	@RequestMapping(value = "/sign/findId", method = RequestMethod.GET, produces = "application/json")
	public HashMap<String, Object> findId(@RequestParam HashMap params, HttpServletRequest request) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		String phone = (String) params.get("phone");
		try {
			if (phone.equals("") || phone.equals(null)) {
				error.put(messageSource.getMessage("phone", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			Map<String, Object> userInfo = userDAO.getFindUser(params);
			if (isEmpty(userInfo)) {
				resultMap.put("validateError", error);
				error.put("Error", messageSource.getMessage("error.userNotFound", "ko"));
			} else {
				resultMap.put("email", userInfo.get("email"));
			}
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	// 패스워드 초기화 2

	@RequestMapping(value = "/sign/changePasswordProc", method = RequestMethod.GET, produces = "application/json")
	public HashMap<String, Object> changePasswordProc(@RequestParam HashMap params, HttpServletRequest request) {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String email = (String) params.get("email");
		String password = (String) params.get("password");
		String passwordCf = (String) params.get("password_cf");
		String basePassword = numberGender.numberGen(4, 2);
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {

			if(password==null || password.isEmpty()){
                error.put("Error", messageSource.getMessage("error.required","ko"));
            }
            if(passwordCf==null || passwordCf.isEmpty()){
                error.put("Error", messageSource.getMessage("error.required","ko"));
            }
            if(!password.equals(passwordCf)){
                error.put("Error", messageSource.getMessage("error.inpPwdCfm", "ko"));
            }
            if(email.isEmpty() || email==null){
                error.put("Error", messageSource.getMessage("수신된 이메일을 다시 확인하세요", "ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                params.put("password", passwordEncoder.encode((String)params.get("password")));
                params.put("password_change_code", basePassword);
                userDAO.updatePasswordChange(params);
                userDAO.updatePasswordChangeCode(params);
                resultMap.put("url","/sign/changePasswordDone");
            }
			resultMap.put("validateError", error);

		} catch (Exception e) {
			resultMap.put("status", "fail");
			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 로그인 처리 2 $2a$10$H7XwLGO27fJwkZ5KrK6rCONJBIEJP.9WEW1C13rgpnX2InWhwlE6m
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
	// 포인트 잔액확인 및 경품참여
	@RequestMapping(value = "/giveaway/PointAmountCheckProc", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> PointAmountCheckProc(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			Integer userPoint = 0; // 사용자 포인트
			Integer usedPoint = giveawayVO.getPoint(); // 입력 포인트

			// 로그인 확인
			params.put("email", session.getAttribute("email"));
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);

			if (isEmpty(userInfo)) {
				// 로그인정보 확인
				error.put("Error", messageSource.getMessage("error.noLoginInfo", "ko"));
			} else {
				// 보유포인트 확인
				params.put("point_paid_user_id", userInfo.get("usr_id"));
				userPoint = pointDAO.getPointAmount(params);
				// 보유 포인트 와 금액부족
				if (usedPoint > userPoint) {
					error.put("Error", messageSource.getMessage("error.paymentIsLess", "ko"));
				}
			}

			if (usedPoint == 0) {
				error.put(messageSource.getMessage("used_point", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}

			params.put("giveaway_cd", request.getParameter("giveaway_cd"));
			params.put("giveaway_id", request.getParameter("giveaway_id"));
			Map<String, Object> giveaway = giveawayDAO.getGiveawayDetail(params);
			Integer giveawayUsePoint = (Integer) giveaway.get("giveaway_payment");
			Integer giveaway_play_winner_point = 0;

			// 자동추첨 기준
			if (giveaway.get("giveaway_play_winner_point") == null) {
				error.put("Error", messageSource.getMessage("error.giveawayPlayWinnerPoint", "ko"));
			} else {
				giveaway_play_winner_point = (Integer) giveaway.get("giveaway_play_winner_point");
			}
			// 상품응모포인트와 입력한 포인트
			/*
			 * if(giveawayUsePoint > usedPoint){ error.put("Error",
			 * messageSource.getMessage("error.paymentUsedIsLess","ko")); }
			 */

			Integer giveaMinPoint = (Integer) giveaway.get("giveaway_play_min_point");
			Integer giveaMaxPoint = (Integer) giveaway.get("giveaway_play_max_point");
			Integer giveaWinnerPoint = (Integer) giveaway.get("giveaway_play_winner_point");
			Integer sum_play_point = giveawayDAO.getGiveawayPlaySumPoint(params);
			Integer rest = giveaWinnerPoint - sum_play_point;
			if (giveaMinPoint != null && giveaMinPoint != 0) {
				if (giveaMinPoint > usedPoint) {
					error.put("Error", "경품 응모 최소 포인트 보다 응모하신 금액이 작습니다.");
				}
			}
			if (giveaMaxPoint != null && giveaMaxPoint != 0) {
				if (giveaMaxPoint < usedPoint) {
					error.put("Error", "경품 응모 최대 포인트를 초과하였습니다.");
				}
			}
			if(giveaWinnerPoint < usedPoint){
				error.put("Error", "경품 추첨 포인트를 초과하였습니다.");
			}
			if(rest < usedPoint){
				error.put("Error", "남은 경품 포인트를 초과하였습니다.");
			}


			// 검증
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				// 경품 자동추첨 금액 달성시 당첨차 추첨

				Integer giveawayPlaySumPoint = giveawayDAO.getGiveawayPlaySumPoint(params);
				if (giveaway_play_winner_point > giveawayPlaySumPoint) {
					// 경품참여정보 저장
					String giveaway_play_cd = numberGender.numberGen(8, 1);
					giveawayVO.setGiveaway_play_cd("GP" + giveaway_play_cd);
					giveawayVO.setGiveaway_cd((String) giveaway.get("giveaway_cd"));
					giveawayVO.setGiveaway_payment_epoint(usedPoint);
					giveawayVO.setGiveaway_play_user_id((Integer) userInfo.get("usr_id"));
					giveawayDAO.insertGiveawayPlay(giveawayVO);
					// 포인트 차감
					params.put("point_amount", userPoint - usedPoint);
					params.put("point_paid_memo", (String) giveaway.get("giveaway_name"));
					params.put("point_use", usedPoint);
					params.put("point_paid_user_id", (Integer) userInfo.get("usr_id"));
					params.put("point_paid_type", "B");
					params.put("point_paid_product_cd", (String) giveaway.get("giveaway_cd"));
					pointDAO.insertPoint(params);
					// 자동추첨
					if (giveaway_play_winner_point <= giveawayDAO.getGiveawayPlaySumPoint(params)) {
						params.put("giveaway_play_status", "W");
						Integer giveawayPlayCount = giveawayDAO.getUserGiveawayPlayListCount(params);
						// 당첨자가 없으면 진행
						if (giveawayPlayCount <= 0) {
							Integer winnerUserId = (Integer) giveawayDAO.getGiveawayPlayUserRandId(params);
							params.put("giveaway_play_id", winnerUserId);
							params.put("giveaway_winner_user_id", userInfo.get("usr_id"));
							giveawayDAO.updateWinnerUser(params);
							giveawayDAO.insertGiveawayWinner(params);
						}
					}
					resultMap.put("redirectUrl", "/MyPage/GiveawayWinningList");

				} else {
					error.put("Error", messageSource.getMessage("error.giveawayMaxPoint", "ko"));
//                    resultMap.put("redirectUrl",request.getHeader("Referer"));
				}
			}
		} catch (Exception e) {
			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 배송정보 저장
	@RequestMapping(value = "/SaveDeliveInfo", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> SaveDeliveInfo(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			// 사용자 아이디 확인 후 전달
			params.put("email", session.getAttribute("email"));

			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (isEmpty(userInfo)) {
				deliveryInfoVO.setOrder_user_id(Integer.parseInt(numberGender.numberGen(6, 1)));
			} else {
				deliveryInfoVO.setOrder_user_id((Integer) userInfo.get("usr_id"));
			}

			if (deliveryInfoVO.getOrder_user_name().isEmpty()) {
				error.put(messageSource.getMessage("order_user_name", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getOrder_user_email().isEmpty()) {
				error.put(messageSource.getMessage("order_user_email", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getOrder_user_phone().isEmpty()) {
				error.put(messageSource.getMessage("order_user_phone", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getDelivery_user_name().isEmpty()) {
				error.put(messageSource.getMessage("delivery_user_name", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getDelivery_user_phone().isEmpty()) {
				error.put(messageSource.getMessage("delivery_user_phone", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getDelivery_user_tel().isEmpty()) {
				error.put(messageSource.getMessage("delivery_user_tel", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getPostcode().isEmpty()) {
				error.put(messageSource.getMessage("postcode", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getRoadAddress().isEmpty()) {
				error.put(messageSource.getMessage("roadAddress", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getExtraAddress().isEmpty()) {
				error.put(messageSource.getMessage("extraAddress", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				deliveryDAO.insertDelivery(deliveryInfoVO);
//                params.put("giveaway_payment_status","B");
//                params.put("giveaway_play_cd",deliveryInfoVO.getGiveaway_play_cd());
//                deliveryDAO.updateGiveawayDeliveryStatus(params);
				resultMap.put("redirectUrl", "/MyPage/giveawaypayment?order_no=" + deliveryInfoVO.getOrder_no());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 결제 정보저장
	@RequestMapping(value = "/SavePayment", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> SavePayment(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			if (deliveryInfoVO.getPayment_class().equals("PRODUCT")) {
				deliveryDAO.insertDelivery(deliveryInfoVO);
			}
			// 결제번호생성
			params.put("payment_cd", "PM" + numberGender.numberGen(7, 1));

			params.put("email", session.getAttribute("email"));

			//주문시 결제실패상태 -> 웹훅으로 결제,미결제처리
			params.put("payment_status", "N");

			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (isEmpty(userInfo)) {
				// 비회원 주문시 사용자아이디 임시 저장
				params.put("payment_user_id", numberGender.numberGen(6, 1));
				resultMap.put("redirectUrl", "/MyPage/OrderDetailGuest?order_no=" + deliveryInfoVO.getOrder_no());
			} else {
				if (deliveryInfoVO.getPayment_class().equals("PRODUCT")) {
					params.put("payment_user_id", userInfo.get("usr_id"));
					resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
				} else if (deliveryInfoVO.getPayment_class().equals("GIVEAWAY")) {
					params.put("reg_no", params.get("reg_no1") + "-" + params.get("reg_no2"));
					// 경품 응모시 결제 상태 변경
					params.put("giveaway_payment_status", "B");
					paymentDAO.updateGiveawayDeliveryStatus(params);
					resultMap.put("redirectUrl", "/MyPage/GiveawayWinningList");
				}
			}
			
			paymentDAO.insertPayment(params);
			if (deliveryInfoVO.getPayment_class().equals("PRODUCT")) {
				paymentDAO.insertBundle(params);
				deliveryDAO.insertDelivery(deliveryInfoVO);
			}
		} catch (Exception e) {
			error.put("Error",e.getMessage());
			resultMap.put("validateError", error);
			e.printStackTrace();
		}
		return resultMap;
	}

	// 장바구니 결제 처리
	@RequestMapping(value = "/Save/PaymentOrders", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> PaymentOrders(@RequestParam HashMap params, CartPaymentVO cartPaymentVO,
			ModelMap model, HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			deliveryDAO.insertDelivery(deliveryInfoVO);
			// 결제번호생성
			params.put("payment_cd", "PO" + numberGender.numberGen(7, 1));

			params.put("email", session.getAttribute("email"));
			
			//주문시 결제실패상태 -> 웹훅으로 결제,미결제처리
			params.put("payment_status", "N");
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (isEmpty(userInfo)) {
				// 비회원 주문시 사용자아이디 임시 저장
				params.put("payment_user_id", numberGender.numberGen(6, 1));
				resultMap.put("redirectUrl", "/MyPage/OrderDetailGuest?order_no=" + deliveryInfoVO.getOrder_no());
			} else {
				params.put("payment_user_id", userInfo.get("usr_id"));
				resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
			}

			params.put("payment_order_quantity", params.get("quantity_total"));
			paymentDAO.insertPayment(params);

			cartPaymentVO.setPayment_cd((String) params.get("payment_cd"));
			cartPaymentVO.setCart_user_id(String.valueOf(params.get("payment_user_id")));
			cartPaymentVO.setPayment_status((String) params.get("payment_status"));
			paymentDAO.insertCartBundle(cartPaymentVO);
		} catch (Exception e) {
			error.put("Error",e.getMessage());
			resultMap.put("validateError", error);
			e.printStackTrace();
		}
		return resultMap;
	}
	// 장바구니 결제성공시 장바구니에서 상품삭제
	@RequestMapping(value = "/Save/PaymentOrderSuccess", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> PaymentOrderSuccess(@RequestParam HashMap params, CartPaymentVO cartPaymentVO,
			ModelMap model, HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		try {
			client = new IamportClient(apiKey, apiSecret);
			Payment impPayment = client.paymentByImpUid(cartPaymentVO.getImp_uid()).getResponse();
			
			if(impPayment != null) {
				iamPortDAO.updateIamportWebHook(impPayment);
				cartDAO.CartPaymentListDelete(cartPaymentVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//상품상세 결제성공시 상태값 2중체크
	@RequestMapping(value = "/Save/PaymentSuccess", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> PaymentSuccess(@RequestParam HashMap params, CartPaymentVO cartPaymentVO,
			ModelMap model, HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		try {
			client = new IamportClient(apiKey, apiSecret);
			Payment impPayment = client.paymentByImpUid(cartPaymentVO.getImp_uid()).getResponse();
			
			if(impPayment != null) {
				iamPortDAO.updateIamportWebHook(impPayment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 교환
	@RequestMapping(value = "/SaveOrderChange", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> SaveOrderChange(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (deliveryInfoVO.getJibunAddress().isEmpty()) {
				error.put(messageSource.getMessage("jibunAddress", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getExtraAddress().isEmpty()) {
				error.put(messageSource.getMessage("extraAddress", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getRefund_jibunAddress().isEmpty()) {
				error.put(messageSource.getMessage("refundjibunAddress", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getRefund_extraAddress().isEmpty()) {
				error.put(messageSource.getMessage("refundextraAddress", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getReason().isEmpty()) {
				error.put(messageSource.getMessage("reason", "ko"), messageSource.getMessage("error.required", "ko"));
			}	

			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (isEmpty(userInfo)) {
				// 비회원
			} else {

			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				Map<String,Object> payment = paymentDAO.getMgPaymentBundleDetail(params);
				// 결제상태 업데이트
				deliveryInfoVO.setPayment_status("F");
				deliveryInfoVO.setDelivery_status("F");
				deliveryInfoVO.setMerchant_uid((String)payment.get("order_no"));
				deliveryDAO.updateDelivery(deliveryInfoVO);
				deliveryInfoVO.setMerchant_uid(String.valueOf(payment.get("no")));
				paymentDAO.updatePaymentBundle(deliveryInfoVO);
				refundDAO.insertDeliveryRefund(deliveryInfoVO);
				// 교환정보 저장
				resultMap.put("success", "success");
				resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 반품
	@RequestMapping(value = "/SaveOrderRollback", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> SaveOrderRollback(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (deliveryInfoVO.getReason().isEmpty()) {
				error.put(messageSource.getMessage("reason", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getRefund_send_date().isEmpty()) {
				error.put(messageSource.getMessage("refund_send_date", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getRefund_delivery_t_code().isEmpty()) {
				error.put(messageSource.getMessage("refund_delivery_t_code", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (deliveryInfoVO.getRefund_delivery_t_invoice().isEmpty()) {
				error.put(messageSource.getMessage("refund_delivery_t_invoice", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}

			if (!params.get("pay_method").equals("card")) {
				if (deliveryInfoVO.getRefund_bank() == null || deliveryInfoVO.getRefund_bank().isEmpty()) {
					error.put(messageSource.getMessage("refund_bank", "ko"),
							messageSource.getMessage("error.required", "ko"));
				}
				if (deliveryInfoVO.getRefund_account() == null || deliveryInfoVO.getRefund_account().isEmpty()) {
					error.put(messageSource.getMessage("refund_account", "ko"),
							messageSource.getMessage("error.required", "ko"));
				}
				if (deliveryInfoVO.getRefund_holder() == null || deliveryInfoVO.getRefund_holder().isEmpty()) {
					error.put(messageSource.getMessage("refund_holder", "ko"),
							messageSource.getMessage("error.required", "ko"));
				}
			}

			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (isEmpty(userInfo)) {
				// 비회원
			} else {

			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				Map<String,Object> payment = paymentDAO.getMgPaymentBundleDetail(params);
				// 결제상태 업데이트
				deliveryInfoVO.setPayment_status("H");
				deliveryInfoVO.setDelivery_status("H");
				deliveryInfoVO.setMerchant_uid((String)payment.get("order_no"));
				deliveryDAO.updateDelivery(deliveryInfoVO);
				deliveryInfoVO.setMerchant_uid(String.valueOf(payment.get("no")));
				paymentDAO.updatePaymentBundle(deliveryInfoVO);
				refundDAO.insertDeliveryRefund(deliveryInfoVO);
				
				// 교환정보 저장
				resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 결제 취소요청
	@RequestMapping(value = "/SavePaymentCancel", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> SavePaymentCancel(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (isEmpty(userInfo)) {
				// 비회원 주문
				resultMap.put("redirectUrl", "/");
			} else {
				params.put("payment_user_id", userInfo.get("usr_id"));
				resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
			}

//            //환불을위한 토큰발급
			IamportClient client;
			String test_api_key = "7152058542143411";
			String test_api_secret = "mVKoCqCox7EBEya9KmB8RLeEzFwZBhpYd9mPAZe76SILqTVbgxj7jyLSdhSPzhNMraC19Q9gJS2aLXl1";
			client = new IamportClient(test_api_key, test_api_secret);
//            IamportResponse<AccessToken> auth_response = client.getAuth();
			
			String test_already_cancelled_merchant_uid = deliveryInfoVO.getMerchant_uid();
			CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); // merchant_uid를 통한

			cancel_data.setReason(deliveryInfoVO.getReason());//취소사유
			cancel_data.setRefund_account(deliveryInfoVO.getRefund_account());//계좌번호
			cancel_data.setRefund_bank(deliveryInfoVO.getRefund_bank());//kcp 은행코드
			cancel_data.setRefund_holder(deliveryInfoVO.getRefund_holder());// 수취인명 *수취인명과 은행코드 안맞으면 오류

			// 전액취소
			Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            Payment impPayment = client.paymentByImpUid((String)paymentDetail.get("imp_uid")).getResponse();
            if(!impPayment.getPayMethod().equals("card") && impPayment.isEscrow()) cancel_data.setEscrowConfirmed(true);
            
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);//요청 결과 확인

			if (payment_response.getResponse() == null) {
				error.put("Error", payment_response.getMessage());
			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				deliveryInfoVO.setDelivery_status("C");
				deliveryInfoVO.setPayment_status("C");
				deliveryInfoVO.setOrder_no(deliveryInfoVO.getMerchant_uid());
				deliveryDAO.updateDelivery(deliveryInfoVO);
				paymentDAO.updatePayment(deliveryInfoVO);
				paymentDAO.updatePaymentBundleCancel(deliveryInfoVO);
//				paymentDAO.insertPaymentRefund(deliveryInfoVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	// 결제 취소요청
	@RequestMapping(value = "/SavePaymentCancelNC", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> SavePaymentCancelNC(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, DeliveryInfoVO deliveryInfoVO, GiveawayVO giveawayVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (isEmpty(userInfo)) {
				// 비회원 주문
				resultMap.put("redirectUrl", "/");
			} else {
				params.put("payment_user_id", userInfo.get("usr_id"));
				resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
			}
/*
//            //환불을위한 토큰발급
			IamportClient client;
			String test_api_key = "7152058542143411";
			String test_api_secret = "mVKoCqCox7EBEya9KmB8RLeEzFwZBhpYd9mPAZe76SILqTVbgxj7jyLSdhSPzhNMraC19Q9gJS2aLXl1";
			client = new IamportClient(test_api_key, test_api_secret);
//            IamportResponse<AccessToken> auth_response = client.getAuth();
			
			String test_already_cancelled_merchant_uid = deliveryInfoVO.getMerchant_uid();
			CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); // merchant_uid를 통한

			cancel_data.setReason(deliveryInfoVO.getReason());//취소사유
			cancel_data.setRefund_account(deliveryInfoVO.getRefund_account());//계좌번호
			cancel_data.setRefund_bank(deliveryInfoVO.getRefund_bank());//kcp 은행코드
			cancel_data.setRefund_holder(deliveryInfoVO.getRefund_holder());// 수취인명 *수취인명과 은행코드 안맞으면 오류

			// 전액취소
			Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            Payment impPayment = client.paymentByImpUid((String)paymentDetail.get("imp_uid")).getResponse();
            if(!impPayment.getPayMethod().equals("card") && impPayment.isEscrow()) cancel_data.setEscrowConfirmed(true);
            
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);//요청 결과 확인

			if (payment_response.getResponse() == null) {
				error.put("Error", payment_response.getMessage());
			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				*/			
				deliveryInfoVO.setDelivery_status("C");
				deliveryInfoVO.setPayment_status("C");
				deliveryInfoVO.setOrder_no(deliveryInfoVO.getMerchant_uid());
				deliveryDAO.updateDelivery(deliveryInfoVO);
				paymentDAO.updatePayment(deliveryInfoVO);
				paymentDAO.updatePaymentBundleCancel(deliveryInfoVO);
//				paymentDAO.insertPaymentRefund(deliveryInfoVO);
		
		//	}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 찜
	@RequestMapping(value = "/cart/addFavorites", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> addaddFavorites(@RequestParam HashMap params, HttpSession session,
			HttpServletRequest request) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			// session.setAttribute("email",email);
			// 카트번호
			params.put("product_favorites_cd", "FV" + numberGender.numberGen(6, 1));
			// 사용자 아이디 확인 후 전달
			params.put("email", session.getAttribute("email"));
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);

			if (isEmpty(userInfo)) {
				String cart_user_id = numberGender.numberGen(6, 1);
				params.put("member_yn", "N");

				if (session.getAttribute("nonMembersUserId") == null) {
					session.setAttribute("nonMembersUserId", cart_user_id);
					params.put("user_id", cart_user_id);
				} else {
					params.put("user_id", session.getAttribute("nonMembersUserId"));
				}
			} else {
				params.put("member_yn", "Y");
				params.put("user_id", userInfo.get("usr_id"));
			}
			// 카트 중복조회
			if (cartDAO.getFavoritesListCount(params) > 0) {
				error.put("Error", messageSource.getMessage("error.duplicateFavorites", "ko"));
			}
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				cartDAO.insertFavorites(params);
				resultMap.put("redirectUrl", request.getHeader("Referer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 찜목록 삭제
	@RequestMapping(value = "/cart/deleteFavorite", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> deleteFavorite(@RequestParam HashMap params) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartDAO.deleteFavorite(params);
			resultMap.put("redirectUrl", "/MyPage/ShoppingAddList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 장바구니 등록
	@RequestMapping(value = "/cart/addcart", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> addCart(HttpSession session, HttpServletRequest request, OptionVO optionVO,
			@RequestParam HashMap params) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {

			String cart_cd = "CR" + numberGender.numberGen(6, 1);
			// 카트번호
			params.put("cart_cd", cart_cd);
			// 사용자 아이디 확인 후 전달
			params.put("email", session.getAttribute("email"));
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);

			if (isEmpty(userInfo)) {
				String cart_user_id = numberGender.numberGen(6, 1);
				params.put("member_yn", "N");

				if (session.getAttribute("nonMembersUserId") == null) {
					session.setAttribute("nonMembersUserId", cart_user_id);
					params.put("cart_user_id", cart_user_id);
				} else {
					params.put("cart_user_id", session.getAttribute("nonMembersUserId"));
				}
			} else {
				params.put("member_yn", "Y");
				params.put("cart_user_id", userInfo.get("usr_id"));
			}
			// 카트 중복조회
			if (cartDAO.getCartListCount(params) > 0) {
				error.put("Error", messageSource.getMessage("error.duplicateCart", "ko"));
			}
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
//                List<OptionVO> optionList = new ArrayList<OptionVO>();
//                optionVO.setCart_cd(cart_cd);
//                optionList.add(optionVO);
//                optionVO.setOptionVOList(optionList);
//                cartDAO.insertCartOption(optionVO);
				if (params.get("payment_order_quantity") == null || params.get("payment_order_quantity").equals("")) {
					params.put("payment_order_quantity", "1");
				}
				cartDAO.insertCart(params);
				resultMap.put("redirectUrl", request.getHeader("Referer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 장바구니 삭제
	@RequestMapping(value = "/cart/deletecart", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> deleteCart(@RequestParam HashMap params,
			HttpSession session) {
		
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartDAO.deleteCart(params);
			resultMap.put("redirectUrl", "/MyPage/ShoppingBasket");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 장바구니 변경
	@RequestMapping(value = "/cart/updateCart", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> updateCart(@RequestParam HashMap params, HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cartDAO.updateCart(params);
			resultMap.put("redirectUrl", "/MyPage/ShoppingBasket");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 상품 결제
	@RequestMapping(value = "/product/paymentProc")
	public HashMap<String, Object> productPaymentProc(@RequestParam HashMap params, HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
//            cartDAO.deleteCart(params);
			resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 매인 상품 진열
	@RequestMapping(value = "/product/mainList")
	public HashMap<String, Object> productMainList(@RequestParam HashMap params, HttpSession session,
			SearchVO searchVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			if (searchVO.getMainViewType() != null) {
				if (searchVO.getMainViewType().equals("product_popular_class")) {
					searchVO.setOrderByKey("sales_count");
					searchVO.setOrderByValue("DESC");
					searchVO.setMainViewType(null);
				}
			}
			if (searchVO.getOrderByValue() == null || searchVO.getOrderByKey() == null) {
				searchVO.setOrderByKey("product_id");
				searchVO.setOrderByValue("DESC");
			}
			// 회원전용상품 노출
			Object isLogin = session.getAttribute("login");
			if (isLogin != null) {
				if ((Boolean) isLogin) {
					searchVO.setProduct_use_member_yn(null);
				}
			} else {
				searchVO.setProduct_use_member_yn("N");
			}
			searchVO.setDisplayRowCount(8);
			searchVO.setStaticRowEnd(8);
			searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
			searchVO.setProduct_sale_yn("Y");
			searchVO.setProduct_approval_yn("Y");
			List<Map<String, Object>> list = productDAO.getProductList(searchVO);
			if (list.size() < 8 && searchVO.getOrderByKey().equals("sales_count")) {
				searchVO.setOrderByKey("product_id");
				searchVO.setOrderByValue("DESC");
				List<Map<String, Object>> addList = productDAO.getProductList(searchVO);
				for (Map<String, Object> addMap : addList) {
					list.add(addMap);
					if (list.size() >= 8) {
						break;
					}
				}
			}
			resultMap.put("mdSlideCategorySelect", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 공통 리스트삭제
	@RequestMapping(value = "/cart/commonListDelete", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> mypageListDelete(@RequestParam HashMap params, CommonVO commonVO, 
			HttpServletRequest request,HttpSession session) { 

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			// 테이블명 table
			// pk 필드명 pk
			// 삭제할 배열 chk

	
			if (commonVO.getPk().equals(null) || commonVO.getPk().equals("")) {
				error.put("Pk name", messageSource.getMessage("error.required", "ko"));
			}
			if (commonVO.getTable_name().equals(null) || commonVO.getTable_name().equals("")) {
				error.put("Table", messageSource.getMessage("error.required", "ko"));
			}
//            if(mgCommonVO.getChk().size() <= 0){
//                error.put("check box selector", messageSource.getMessage("error.required","ko"));
//            }
			
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				commonDAO.commonListDelete(commonVO);
				/*resultMap.put("redirectUrl", request.getHeader("Referer"));*/
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 배송지 삭제
	@Transactional
	@RequestMapping(value = "/MyPage/DeliveryAddressDelete", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageDeliveryAddressDelete(@RequestParam HashMap params, CommonVO commonVO,
			HttpServletRequest request) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				deliveryDAO.deleteDelivery(params);
				String redirect = params.get("product_delivery_International_type").equals("A")
						? "/MyPage/DeliveryAddress"
						: "/MyPage/DeliveryAddressForeign";
				resultMap.put("redirectUrl", redirect);
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 기본배송지 설정
	@Transactional
	@RequestMapping(value = "/MyPage/DefaultDeliveryAddressUpdate", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageDefaultDeliveryAddressUpdate(@RequestParam HashMap params, CommonVO commonVO,
			HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				HashMap<String, Object> defaultN = new HashMap<String, Object>();
				defaultN.put("defaultYn", "N");
				defaultN.put("email", session.getAttribute("email"));
				deliveryDAO.disabledDefaultDelivery(defaultN);
				params.put("email", session.getAttribute("email"));
				params.put("defaultYn", "Y");
				deliveryDAO.enabledDefaultDelivery(params);
				String redirect = params.get("product_delivery_International_type").equals("A")
						? "/MyPage/DeliveryAddress"
						: "/MyPage/DeliveryAddressForeign";
				resultMap.put("redirectUrl", redirect);
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 배송지정보
	@Transactional
	@RequestMapping(value = "/MyPage/getDeliveryDetail", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageGetDeliveryDetail(@RequestParam HashMap params, CommonVO commonVO,
			HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				resultMap.put("deliveryInfo", deliveryDAO.getUserDeliveryDetail(params));
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 배송지 수정
	@Transactional
	@RequestMapping(value = "/MyPage/updateDeliveryAddress", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageUpdateDeliveryAddress(@RequestParam HashMap params, CommonVO commonVO,
			HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			if (params.get("delivery_alias").equals(null) || params.get("delivery_alias").equals("")) {
				error.put("배송지 별명", messageSource.getMessage("error.required", "ko"));
			}
			if (params.get("delivery_user_name").equals(null) || params.get("delivery_user_name").equals("")) {
				error.put("받으시는분", messageSource.getMessage("error.required", "ko"));
			}
			if (params.get("postcode").equals(null) || params.get("postcode").equals("")) {
				error.put("주소", messageSource.getMessage("error.required", "ko"));
			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				String phone = params.get("delivery_user_phone_a") + "-" + params.get("delivery_user_phone_b") + "-"
						+ params.get("delivery_user_phone_c");
				String tel = params.get("delivery_user_tel_a") + "-" + params.get("delivery_user_tel_b") + "-"
						+ params.get("delivery_user_tel_c");
				params.put("delivery_user_phone", phone);
				params.put("delivery_user_tel", tel);
				deliveryDAO.updateDeliveryAddress(params);
				if (params.containsKey("defaultYn") && params.get("defaultYn").equals("Y")) {
					HashMap<String, Object> defaultN = new HashMap<String, Object>();
					defaultN.put("defaultYn", "N");
					defaultN.put("email", session.getAttribute("email"));
					deliveryDAO.disabledDefaultDelivery(defaultN);
					params.put("defaultYn", "Y");
					params.put("orderNo", params.get("order_no"));
					params.put("email", session.getAttribute("email"));
					deliveryDAO.enabledDefaultDelivery(params);
				}
				String redirect = params.get("product_delivery_International_type").equals("A")
						? "/MyPage/DeliveryAddress"
						: "/MyPage/DeliveryAddressForeign";
				resultMap.put("redirectUrl", redirect);
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 배송지 등록
	@Transactional
	@RequestMapping(value = "/MyPage/insertDeliveryAddress", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageInsertDeliveryAddress(@RequestParam HashMap params, CommonVO commonVO,
			HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			if (params.get("delivery_alias").equals(null) || params.get("delivery_alias").equals("")) {
				error.put("배송지 별명", messageSource.getMessage("error.required", "ko"));
			}
			if (params.get("delivery_user_name").equals(null) || params.get("delivery_user_name").equals("")) {
				error.put("받으시는분", messageSource.getMessage("error.required", "ko"));
			}
			if (params.get("postcode").equals(null) || params.get("postcode").equals("")) {
				error.put("주소", messageSource.getMessage("error.required", "ko"));
			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				String phone = params.get("delivery_user_phone_a") + "-" + params.get("delivery_user_phone_b") + "-"
						+ params.get("delivery_user_phone_c");
				String tel = params.get("delivery_user_tel_a") + "-" + params.get("delivery_user_tel_b") + "-"
						+ params.get("delivery_user_tel_c");
				params.put("delivery_user_phone", phone);
				params.put("order_user_phone", phone);
				params.put("delivery_user_tel", tel);
				params.put("order_no", "PD-MYPAGE-" + numberGender.numberGen(6, 1));
				params.put("order_user_name", params.get("delivery_user_name"));
				params.put("order_user_email", session.getAttribute("email"));
				deliveryDAO.insertDeliveryAddress(params);

				if (params.get("defaultYn") != null && params.get("defaultYn").equals("Y")) {
					HashMap<String, Object> defaultN = new HashMap<String, Object>();
					defaultN.put("defaultYn", "N");
					defaultN.put("email", session.getAttribute("email"));
					deliveryDAO.disabledDefaultDelivery(defaultN);
					params.put("defaultYn", "Y");
					params.put("orderNo", params.get("order_no"));
					params.put("email", session.getAttribute("email"));
					deliveryDAO.enabledDefaultDelivery(params);
				}
				String redirect = params.get("product_delivery_International_type").equals("A")
						? "/MyPage/DeliveryAddress"
						: "/MyPage/DeliveryAddressForeign";
				resultMap.put("redirectUrl", redirect);
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	/**
	 * 글 읽기 패스워드 확인
	 */
	@RequestMapping(value = "/Board/PasswordCheck", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> boardPasswordCheck(@RequestParam HashMap params, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		String brdno = (String) params.get("brdno");
		String password = (String) params.get("password");
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
			if (boardInfo.getBgtype() == null) {
				resultMap.put("memo", boardInfo.getBrdmemo());
			} else if (boardInfo.getBgtype().equals("1:1")) {
				if (boardInfo.getPassword() == null) {
					resultMap.put("memo", "글을 읽을 수 없습니다. 관리자에게 문의하세요");
					resultMap.put("status", "false");
				} else {
					if (boardInfo.getPassword().equals(password)) {
						resultMap.put("memo", boardInfo.getBrdmemo());
						resultMap.put("rememo", boardInfo.getRememo());
						resultMap.put("redate", boardInfo.getRedate());
						resultMap.put("rewriter", boardInfo.getRewriter());
					} else {
						resultMap.put("memo", "비밀번호를 확인하세요");
						resultMap.put("status", "false");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 상품평 등록
	@Transactional
	@RequestMapping(value = "/MyPage/insertReview", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageInsertReview(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, ProductVO productVO, BoardVO boardInfo, FileVO fileVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			FileUtil fs = new FileUtil();
			List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(), downloadPath + "review");
			List<FileVO> filelist6 = fs.saveAllFiles(boardInfo.getUploadfile6(),downloadPath+"product");
			SimpleDateFormat ft = new SimpleDateFormat("yyyy");
			//fileVO.setFilepath("/fileupload/review/" + ft.format(new Date()) + "/");

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				params.put("email", session.getAttribute("email"));
				// 로그인 확인
				Map<String, Object> userInfo = userDAO.getLoginUserList(params);
				if (!isEmpty(userInfo)) {
					params.put("usr_id", userInfo.get("usr_id"));
				}
				reviewDAO.insertReview(params);

				fileVO.setParentPK(params.get("pk") + "");
				if (!isEmpty(filelist)) {
					fileVO.setFileorder(1);
					fileVO.setFilepath("/fileupload/review/" + ft.format(new Date()) + "/");
					reviewDAO.deleteReviewFile(filelist, fileVO);
					reviewDAO.insertReviewFile(filelist, fileVO);
				}
				if(!isEmpty(filelist6)){
                	fileVO.setFileorder(6);
                	fileVO.setFilepath("/fileupload/product/" + ft.format(new Date()) + "/");
                	reviewDAO.deleteReviewFile(filelist6,fileVO);
                	reviewDAO.insertReviewFile(filelist6,fileVO);
                }
				resultMap.put("success", "success");
				resultMap.put("redirectUrl", "/MyPage/OrderAndDelivery");
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 상품평 수정
	@Transactional
	@RequestMapping(value = "/MyPage/updateReview", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageUpdateReview(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, ProductVO productVO, BoardVO boardInfo, FileVO fileVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			FileUtil fs = new FileUtil();
			List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(), downloadPath + "review");
			List<FileVO> filelist6 = fs.saveAllFiles(boardInfo.getUploadfile6(),downloadPath+"product");
			SimpleDateFormat ft = new SimpleDateFormat("yyyy");
			fileVO.setFilepath("/fileupload/review/" + ft.format(new Date()) + "/");

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				params.put("email", session.getAttribute("email"));
				// 로그인 확인
				Map<String, Object> userInfo = userDAO.getLoginUserList(params);
				if (!isEmpty(userInfo)) {
					params.put("usr_id", userInfo.get("usr_id"));
				}
				reviewDAO.updateReview(params);

				fileVO.setParentPK(params.get("review_id") + "");
				if (!isEmpty(filelist)) {
					fileVO.setFileorder(1);
					fileVO.setFilepath("/fileupload/review/" + ft.format(new Date()) + "/");
					reviewDAO.deleteReviewFile(filelist, fileVO);
					reviewDAO.insertReviewFile(filelist, fileVO);
				}
				if(!isEmpty(filelist6)){
                	fileVO.setFileorder(6);
                	fileVO.setFilepath("/fileupload/product/" + ft.format(new Date()) + "/");
                	reviewDAO.deleteReviewFile(filelist6,fileVO);
                	reviewDAO.insertReviewFile(filelist6,fileVO);
                }		
                resultMap.put("success", "success");
				resultMap.put("redirectUrl", "/MyPage/Reviews");
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}
	// 상품평 파일 하나 삭제
	@Transactional
	@RequestMapping(value = "/MyPage/deleteOneFile", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> deleteOneFile(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, ProductVO productVO, BoardVO boardInfo, FileVO fileVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

			try {
				if (!isEmpty(error)) {
					resultMap.put("validateError", error);
				} else {
					params.put("email", session.getAttribute("email"));
					// 로그인 확인
					Map<String, Object> userInfo = userDAO.getLoginUserList(params);
					if (!isEmpty(userInfo)) {
						params.put("usr_id", userInfo.get("usr_id"));
					}
					
					reviewDAO.deleteReviewFileOneByName(params);
					resultMap.put("success", "success");
					resultMap.put("redirectUrl", "/MyPage/Reviews");
				}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}
	// 상품평 삭제
	@Transactional
	@RequestMapping(value = "/MyPage/deleteReview", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> mypageDeleteReview(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, ProductVO productVO, BoardVO boardInfo, FileVO fileVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

			try {
				if (!isEmpty(error)) {
					resultMap.put("validateError", error);
				} else {
					params.put("email", session.getAttribute("email"));
					// 로그인 확인
					Map<String, Object> userInfo = userDAO.getLoginUserList(params);
					if (!isEmpty(userInfo)) {
						params.put("usr_id", userInfo.get("usr_id"));
					}
					reviewDAO.deleteReview(params);
					reviewDAO.deleteReviewAllFile(params);
					resultMap.put("success", "success");
					resultMap.put("redirectUrl", "/MyPage/Reviews");
				}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 결제화면 배송지정보불러오기
	@Transactional
	@RequestMapping(value = "/payment/getDeliveryAddress", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> getDeliveryAddress(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, ProductVO productVO, BoardVO boardInfo, FileVO fileVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				params.put("email", session.getAttribute("email"));
				// 로그인 확인
				Map<String, Object> userInfo = userDAO.getLoginUserList(params);
				if (!isEmpty(userInfo)) {
					params.put("usr_id", userInfo.get("usr_id"));
				}
				if (params.get("deliveryType").equals("default")) {
					resultMap.put("delivery", deliveryDAO.getDefaultDelivery(params));
				} else if (params.get("deliveryType").equals("last")) {
					resultMap.put("delivery", deliveryDAO.getLastDelivery(params));
				}
				
					
				
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 내가 선택한 배송지 불러오기 /
	@Transactional
	@RequestMapping(value = "/payment/getDeliveryAddress2", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> getDeliveryAddress2(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				params.put("email", session.getAttribute("email"));
				// 로그인 확인
				Map<String, Object> userInfo = userDAO.getLoginUserList(params);
				if (!isEmpty(userInfo)) {
					params.put("usr_id", userInfo.get("usr_id"));
				}

				resultMap.put("deliveryChoose", deliveryDAO.getMyListDelivery2(params));
					
					
				
			} 
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}
	
	// 결제화면 배송지리스트 불러오기
	@Transactional
	@RequestMapping(value = "/payment/getMyListDelivery", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> getMyListDelivery(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				params.put("email", session.getAttribute("email"));
				// 로그인 확인
				Map<String, Object> userInfo = userDAO.getLoginUserList(params);
				if (!isEmpty(userInfo)) {
					params.put("usr_id", userInfo.get("usr_id"));
				}
				List<Map<String, Object>>  list = deliveryDAO.getMyListDelivery(params);
				resultMap.put("deliveryList", list);
					
					
				
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}
	//myPage Q&A 저장
	@RequestMapping(value = "/Save/writeQna", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> writeQna(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, QnaVO qnaVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (!isEmpty(userInfo)) {
				params.put("usr_id", userInfo.get("usr_id"));
				qnaVO.setQna_writer_id((Integer) userInfo.get("usr_id"));
			} else {
				resultMap.put("isLogin", false);
				error.put("Info", messageSource.getMessage("error.noLoginInfo", "ko"));
			}
			if (qnaVO.getQna_title().isEmpty() || qnaVO.getQna_title().equals("")) {
				error.put(messageSource.getMessage("qna_title", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (qnaVO.getQna_memo().isEmpty() || qnaVO.getQna_memo().equals("")) {
				error.put(messageSource.getMessage("qna_memo", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				qnaDAO.insertQna(qnaVO);
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}
	
	//myPage Q&A 수정저장
	@RequestMapping(value = "/modify/updateQna", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> updateQna(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, QnaVO qnaVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (!isEmpty(userInfo)) {
				params.put("usr_id", userInfo.get("usr_id"));
				qnaVO.setQna_writer_id((Integer) userInfo.get("usr_id"));
			} else {
				resultMap.put("isLogin", false);
				error.put("Info", messageSource.getMessage("error.noLoginInfo", "ko"));
			}
			if (qnaVO.getQna_title().isEmpty() || qnaVO.getQna_title().equals("")) {
				error.put(messageSource.getMessage("qna_title", "ko"),
						messageSource.getMessage("error.required", "ko"));
			}
			if (qnaVO.getQna_memo().isEmpty() || qnaVO.getQna_memo().equals("")) {
				error.put(messageSource.getMessage("qna_memo", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				qnaDAO.updateMypageQna(qnaVO);
				resultMap.put("success", "success");
				resultMap.put("redirectUrl", "/MyPage/Qna");
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}
	// myPage Q&A 삭제 
	@RequestMapping(value = "/delete/deleteQna", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> deleteQna(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, QnaVO qnaVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (!isEmpty(userInfo)) {
				params.put("usr_id", userInfo.get("usr_id"));
				qnaVO.setQna_writer_id((Integer) userInfo.get("usr_id"));
			} else {
				resultMap.put("isLogin", false);
				error.put("Info", messageSource.getMessage("error.noLoginInfo", "ko"));
			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				qnaDAO.deleteMypageQna(qnaVO);
				resultMap.put("success", "success");
				resultMap.put("redirectUrl", "/MyPage/Qna");
			}
		} catch (Exception e) {
			resultMap.put("e", e);
		}
		return resultMap;
	}

	// Q&A 목록
	@RequestMapping(value = "/product/listQna", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> listQna(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, QnaVO qnaVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			params.put("email", session.getAttribute("email"));
			// 로그인 확인
			Map<String, Object> userInfo = userDAO.getLoginUserList(params);
			if (!isEmpty(userInfo)) {
				resultMap.put("usr_id", userInfo.get("usr_id"));
			}
			Integer listCnt = qnaDAO.getQnaListCount(qnaVO);
			qnaVO.setDisplayRowCount(10);
			qnaVO.pageCalculate(listCnt);
			List<Map<String, Object>> list = qnaDAO.getQnaList(qnaVO);

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				resultMap.put("list", list);
				resultMap.put("listCnt", listCnt);
				resultMap.put("pageVO", qnaVO);
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 우편번호변경시 지역별배송비 체크
	@RequestMapping(value = "/additionalDeliveryPayment", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> additionalDeliveryPayment(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, QnaVO qnaVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				Integer additionalDeliveryPayment = mgSystemDAO.getAdditionalDeliveryPayment(params);
				resultMap.put("additionalDeliveryPayment",
						additionalDeliveryPayment == null ? 0 : additionalDeliveryPayment);
			}
		} catch (Exception e) {
			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 마이페이지 자동발급쿠폰 다운버튼
	@RequestMapping(value = "/MyPage/downloadCoupon", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> downloadCoupon(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session, QnaVO qnaVO) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				// 로그인 확인
				params.put("email", session.getAttribute("email"));
				Map<String, Object> userInfo = userDAO.getLoginUserList(params);
				params.put("coupon_paid_user_id", userInfo.get("usr_id"));

				couponDAO.insertCoupon(params);
				resultMap.put("success", "success");
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}
	
	//경품 가상계좌 확인
	@RequestMapping(value = "/api/vbankNoCheck", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> vbankNoCheck(@RequestParam HashMap params, HttpServletRequest request,
			HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		
		try {
			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				// 로그인 확인
				params.put("email", session.getAttribute("email"));
				Map<String, Object> userInfo = userDAO.getLoginUserList(params);
				params.put("usr_id", userInfo.get("usr_id"));
				
				client = new IamportClient(apiKey, apiSecret);
	            Payment impPayment = client.paymentByImpUid((String)params.get("imp_uid")).getResponse();
	            resultMap.put("vbank_name",impPayment.getVbankName());
	            resultMap.put("vbank_num",impPayment.getVbankNum());
				
				resultMap.put("success", "success");
			}
		} catch (Exception e) {
			resultMap.put("e", e);
		}
		return resultMap;
	}

	// 네이버페이 주문키받아오기
	@RequestMapping(value = "/api/naverPayOrderKey", method = RequestMethod.POST, produces = "application/json")
    public String naverPayOrderKey(@RequestParam HashMap params, HttpServletRequest request, HttpSession session,QnaVO qnaVO,
    		@RequestParam(value = "ITEM_ID[]", required = false) String[] itemIds,
    		@RequestParam(value = "ITEM_NAME[]", required = false) String[] itemNmaes,
    		@RequestParam(value = "ITEM_COUNT[]", required = false) String[] itemCounts,
    		@RequestParam(value = "ITEM_UPRICE[]", required = false) String[] itemUPrices,
    		@RequestParam(value = "ITEM_TPRICE[]", required = false) String[] itemTPrices,
    		@RequestParam(value = "ITEM_OPTION[]", required = false) String[] itemOptions){
		params.put("ITEM_ID",itemIds);
		params.put("ITEM_NAME",itemNmaes);
		params.put("ITEM_COUNT",itemCounts);
		params.put("ITEM_UPRICE",itemUPrices);
		params.put("ITEM_TPRICE",itemTPrices);
		params.put("ITEM_OPTION",itemOptions);
		
		if(params.containsKey("ITEM_ID[]")){
			params.remove("ITEM_ID[]");
			params.remove("ITEM_NAME[]");
			params.remove("ITEM_COUNT[]");
			params.remove("ITEM_UPRICE[]");
			params.remove("ITEM_TPRICE[]");
			params.remove("ITEM_OPTION[]");
		}
    	String orderKey = "";
	    try {
    		//네이버쿠키전달
    		String naverInflowCode = "";
    		if(request.getCookies() != null) {
	    		for(Cookie co:request.getCookies()) {
	    			if(co.getName().equals("NA_CO")) {
	    				naverInflowCode = co.getValue();
	    			}
	    		}
    		}
    		params.put("NAVER_INFLOW_CODE", naverInflowCode);
    		URL url = new URL("https://pay.naver.com/customer/api/order.nhn");
    		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
    		conn.setDoInput(true);
    		conn.setDoOutput(true);
    		conn.setUseCaches(false);
    		conn.setRequestMethod("POST");
    		conn.addRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    		
    		StringBuffer buffer = new StringBuffer();

            //HashMap으로 전달받은 파라미터가 null이 아닌경우 버퍼에 넣어준다
            if (params != null) {

                Set<String> keys = params.keySet();

                for (String key:keys) {
                    if(params.get(key).getClass().isArray()) {
                    	for(String value:(String[])params.get(key)) {
                    		buffer.append(key).append("=").append(value).append("&");
                    	}
                    }else {
                    	buffer.append(key).append("=").append(params.get(key)).append("&");
                    }
                }
            }
    		Writer writer = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
		    writer.write(buffer.toString());
            writer.flush();
            
            int respCode = conn.getResponseCode();
            if (respCode != 200) {
            	throw new RuntimeException(String.format("NC Response fail : %d %s", respCode, conn.getResponseMessage()));
        	}
        	BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        	orderKey = reader.readLine();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return orderKey;
	}
	
	// 네이버페이 찜키받아오기
	@RequestMapping(value = "/api/naverPayWishKey", method = RequestMethod.POST, produces = "application/json")
	public String[] naverPayWishKey(@RequestParam HashMap params, HttpServletRequest request, HttpSession session,QnaVO qnaVO,
			@RequestParam(value = "ITEM_ID[]", required = false) String[] itemIds,
			@RequestParam(value = "ITEM_NAME[]", required = false) String[] itemNmaes,
			@RequestParam(value = "ITEM_DESC[]", required = false) String[] itemCounts,
			@RequestParam(value = "ITEM_UPRICE[]", required = false) String[] itemUPrices,
			@RequestParam(value = "ITEM_IMAGE[]", required = false) String[] itemTPrices,
			@RequestParam(value = "ITEM_THUMB[]", required = false) String[] itemOptions,
			@RequestParam(value = "ITEM_URL[]", required = false) String[] itemUrls){
		params.put("ITEM_ID",itemIds);
		params.put("ITEM_NAME",itemNmaes);
		params.put("ITEM_COUNT",itemCounts);
		params.put("ITEM_UPRICE",itemUPrices);
		params.put("ITEM_IMAGE",itemTPrices);
		params.put("ITEM_THUMB",itemOptions);
		params.put("ITEM_URL",itemUrls);
		
		if(params.containsKey("ITEM_ID[]")){
			params.remove("ITEM_ID[]");
			params.remove("ITEM_NAME[]");
			params.remove("ITEM_COUNT[]");
			params.remove("ITEM_UPRICE[]");
			params.remove("ITEM_IMAGE[]");
			params.remove("ITEM_THUMB[]");
			params.remove("ITEM_URL[]");
		}
		String wishKey = "";
		try {
			//네이버쿠키전달
    		String naverInflowCode = "";
    		if(request.getCookies() != null) {
	    		for(Cookie co:request.getCookies()) {
	    			if(co.getName().equals("NA_CO")) {
	    				naverInflowCode = co.getValue();
	    			}
	    		}
    		}
    		params.put("NAVER_INFLOW_CODE", naverInflowCode);
			URL url = new URL("https://pay.naver.com/customer/api/wishlist.nhn");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setRequestMethod("POST");
			conn.addRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			
			StringBuffer buffer = new StringBuffer();
			
			//HashMap으로 전달받은 파라미터가 null이 아닌경우 버퍼에 넣어준다
			if (params != null) {
				
				Set<String> keys = params.keySet();
				
				for (String key:keys) {
					if(params.get(key).getClass().isArray()) {
						for(String value:(String[])params.get(key)) {
							buffer.append(key).append("=").append(value).append("&");
						}
					}else {
						buffer.append(key).append("=").append(params.get(key)).append("&");
					}
				}
			}
			Writer writer = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			writer.write(buffer.toString());
			writer.flush();
			
			int respCode = conn.getResponseCode();
			if (respCode != 200) {
				throw new RuntimeException(String.format("NC Response fail : %d %s", respCode, conn.getResponseMessage()));
			}
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			wishKey = reader.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return wishKey.split(",");
	}
	
	// 네이버페이 상품정보 업데이트 XML
		@RequestMapping(value = "/api/naverPayProductXML", produces = "application/json")
	    public void naverPayProductXML(@RequestParam HashMap params, @RequestParam(value = "ITEM_ID", required = false) String[] itemIds, HttpServletRequest request,HttpServletResponse response, HttpSession session,QnaVO qnaVO) throws ServletException, IOException{
			response.setContentType("application/xml;charset=UTF-8");
			Writer writer = response.getWriter();
			writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n");
			writer.write("<response>\r\n");
			
			params.put("itemIds", itemIds);
			List<Map<String,Object>> productList = productDAO.getNaverProductList(params);
			for(Map<String,Object> product:productList) {
				writer.write(String.format("<item id=\"%s\">\r\n", product.get("product_cd")));
				writer.write(String.format("<name><![CDATA[%s]]></name>\r\n", product.get("product_name")));
				writer.write(String.format("<url><![CDATA[%s]]></url>\r\n", "http://onejoy-life.com/product/productDetail?product_cd="+product.get("product_cd")));
				writer.write(String.format("<description><![CDATA[%s]]></description>\r\n", ""));
				writer.write(String.format("<image><![CDATA[%s]]></image>\r\n", "http://onejoy-life.com/"+product.get("file_1")));
				writer.write(String.format("<thumb><![CDATA[%s]]></thumb>\r\n", "http://onejoy-life.com/"+product.get("file_1")));
				if (product.get("product_option_yn") != null && product.get("product_option_yn").equals("Y")) {
					String splitString = (String) params.get("product_option_input");
		            String[] splitArray =splitString.split("\\/\\/");
		            
					writer.write("<options>\r\n");
					for (int i=0;i<splitArray.length;++i) {
						String[] splitNextArray =splitArray[i].split("\\{");
		                String[] splitThirdArray = splitNextArray[1].replaceAll("\\}", "").split("\\|");
		                
						writer.write(String.format("<option name=\"%s\">\r\n", splitNextArray[0]));
						
						for (int j=0;j<splitThirdArray.length;++j) {
							writer.write(String.format("<select><![CDATA[%s]]></select>\r\n", splitThirdArray[j]));
						}
						
						writer.write("</option>\r\n");
					}
					writer.write("</options>\r\n");
				}
				writer.write(String.format("<price>%d</price>\r\n", product.get("product_payment")));
				if(product.get("product_stock_use_yn") != null && product.get("product_stock_use_yn").equals("Y")) {
					writer.write(String.format("<quantity>%d</quantity>\r\n", product.get("product_stock_quantity")));
				}else {
					writer.write(String.format("<quantity>%d</quantity>\r\n", 999999));
				}
				writer.write("<category>\r\n");
				writer.write(String.format("<first id=\"%s\"><![CDATA[%s]]></first>\r\n", product.get("product_category_id"), product.get("product_category_name")));
				writer.write("</category>\r\n");
				writer.write("</item>\r\n");
			}
			writer.write("</response>");
			writer.flush();
			writer.close();
	    }
		
		//아임포트 현금영수증발행
		@RequestMapping(value = "/api/receipts", method = RequestMethod.POST, produces = "application/json")
		public HashMap<String, Object> receipts(@RequestParam HashMap params, HttpServletRequest request,
				HttpSession session) {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			HashMap<String, Object> error = new HashMap<String, Object>();
			
			if (params.get("identifier") == null || params.get("identifier").equals("")) {
				error.put(messageSource.getMessage("identifier", "ko"), messageSource.getMessage("error.required", "ko"));
			}
			
			try {
				if (!isEmpty(error)) {
					resultMap.put("validateError", error);
				} else {
					client = new IamportClient(apiKey, apiSecret);
					String token = client.getAuth().getResponse().getToken();
					
					HttpClient client = HttpClientBuilder.create().build();
					HttpPost post = new HttpPost("https://api.iamport.kr/receipts/"+params.get("imp_uid"));
					post.addHeader("Authorization",token);
					
					// 로그인 확인
					params.put("email", session.getAttribute("email"));
					Map<String, Object> userInfo = userDAO.getLoginUserList(params);
					
					ArrayList<NameValuePair> entity = new ArrayList<>();
					if (params != null) {
						Set<String> keys = params.keySet();
						for (String key:keys) {
							if(key.equals("imp_uid") || key.equals("email")) continue;
							
							entity.add(new BasicNameValuePair(key, (String)params.get(key)));
						}
					}
					
					post.setEntity(new UrlEncodedFormEntity(entity, "UTF-8"));
					HttpResponse restResponse = client.execute(post);
					
					String content = EntityUtils.toString(restResponse.getEntity());
					
					if(restResponse.getStatusLine().getStatusCode() != 200) {
						error.put("Error",new JSONObject(content).toMap().get("message"));
						resultMap.put("validateError", error);
					}else {
						resultMap.put("data",new JSONObject(content).toMap());
						resultMap.put("success","success");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				resultMap.put("e", e);
			}
			return resultMap;
		}
		
		//메세지소스
		@RequestMapping(value = "/getMessage", method = RequestMethod.POST, produces = "application/json")
		public Map<String, Object> getMessage(@RequestParam HashMap params, HttpServletRequest request,
				HttpSession session) {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			if(params.get("key") == null || params.get("key").equals("")) {
				return resultMap;
			}
			if(params.get("locale") == null || params.get("locale").equals("")) {
				params.put("locale","ko");
			}
			resultMap.put("message",messageSource.getMessage((String)params.get("key"), (String)params.get("locale")));
			return resultMap;
		}
		
		//국가선택
		@RequestMapping(value = "/setLocale", method = RequestMethod.POST, produces = "application/json")
		public Map<String, Object> setLocale(@RequestParam HashMap params, HttpServletRequest request,
				HttpSession session) {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			session.setAttribute("locale", params.get("locale"));
			resultMap.put("locale", params.get("locale"));
			return resultMap;
		}
}
