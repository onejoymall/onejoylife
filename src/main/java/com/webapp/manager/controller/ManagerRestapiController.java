package com.webapp.manager.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webapp.common.support.CurlPost;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.baroservice.api.BarobillApiProfile;
import com.baroservice.api.BarobillApiService;
import com.baroservice.ws.ArrayOfTaxInvoiceTradeLineItem;
import com.baroservice.ws.InvoiceParty;
import com.baroservice.ws.TaxInvoice;
import com.baroservice.ws.TaxInvoiceTradeLineItem;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CouponDAO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.RefundDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.CommonVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.QnaVO;
import com.webapp.mall.vo.UserVO;
import com.webapp.manager.dao.BannerDAO;
import com.webapp.manager.dao.CalculateCompanyDAO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.CompanyInfoDAO;
import com.webapp.manager.dao.ConfigDAO;
import com.webapp.manager.dao.DefinitionDAO;
import com.webapp.manager.dao.MgBrandDAO;
import com.webapp.manager.dao.MgCommonDAO;
import com.webapp.manager.dao.MgCouponDAO;
import com.webapp.manager.dao.MgGiveawayDAO;
import com.webapp.manager.dao.MgOptionDAO;
import com.webapp.manager.dao.MgPointDAO;
import com.webapp.manager.dao.MgProductDAO;
import com.webapp.manager.dao.MgReviewDAO;
import com.webapp.manager.dao.MgStoreDAO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.dao.MgUserDAO;
import com.webapp.manager.dao.MgUserGrantDAO;
import com.webapp.manager.dao.QnaDAO;
import com.webapp.manager.dao.StoreInfoDAO;
import com.webapp.manager.vo.CalculateCompanyVO;
import com.webapp.manager.vo.CompanyInfoVO;
import com.webapp.manager.vo.CouponVO;
import com.webapp.manager.vo.ExcelSettingVO;
import com.webapp.manager.vo.MgBrandVO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.MgOptionVO;
import com.webapp.manager.vo.MgPointVO;
import com.webapp.manager.vo.MgUserVO;
import com.webapp.manager.vo.ProductVO;
import com.webapp.manager.vo.StoreVO;
import com.webapp.manager.vo.TaxVO;

@RestController
public class ManagerRestapiController {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private DefinitionDAO definitionDAO;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    @Autowired
    MessageSource messageSource;
    @Autowired
    QnaDAO qnaDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private PointDAO pointDAO;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private MgCommonDAO mgCommonDAO;
    @Autowired
    private MgProductDAO mgProductDAO;
    @Autowired
    private MgGiveawayDAO mgGiveawayDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private ConfigDAO configDAO;
    @Autowired
    private BannerDAO bannerDAO;
    @Autowired
    private MgStoreDAO mgStoreDAO;
    @Autowired
    private DeliveryDAO deliveryDAO;
    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    RefundDAO refundDAO;
    @Autowired
    private MgUserDAO mgUserDAO;
    @Autowired
    private MgPointDAO mgPointDAO;
    @Autowired
    private MgUserGrantDAO mgUserGrantDAO;
    @Autowired
    MgBrandDAO mgBrandDAO;
    @Autowired
    private MgOptionDAO mgOptionDAO;
    @Autowired
    private MgReviewDAO mgReviewDAO;
    @Autowired
    private MgCouponDAO mgCouponDAO;
    @Autowired
    private MgSystemDAO mgSystemDAO;
    @Autowired
    private CouponDAO couponDAO;
    @Autowired
    private SelectorDAO selectorDAO;
    @Autowired
    private CompanyInfoDAO companyInfoDAO;    
    @Autowired
    private StoreInfoDAO storeInfoDAO;
    @Autowired
    private CalculateCompanyDAO calculateCompanyDAO;

    
    
    
    
    IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;
    @Value("${downloadPath}")
    private String downloadPath;
    @Value("${downloadEditorPath}")
    private String downloadEditorPath;
    @Value("${barobill_key}")
    private String barobillKey;
    @Value("${barobill_corp_num}")
    private String barobillCorpNum;
    @Value("${barobill_corp_name}")
    private String barobillCorpName;
    @Value("${barobill_ceo_name}")
    private String barobillCeoName;
    @Value("${barobill_addr}")
    private String barobillAddr;
    @Value("${barobill_biz_type}")
    private String barobillBizType;
    @Value("${barobill_biz_class}")
    private String barobillBizClass;
    @Value("${barobill_contact_id}")
    private String barobillContactId;
    @Value("${barobill_contact_name}")
    private String barobillContactName;
    @Value("${barobill_tel}")
    private String barobillTel;
    @Value("${barobill_hp}")
    private String barobillHp;
    @Value("${barobill_email}")
    private String barobillEmail;
    @Autowired
    private MailSender mailSender;
    @Value("${t_key}")
    private String t_key;
    @Value("${t_url}")
    private String t_url;

    // 포인트 관리 포인트 추가 및 환수
    @RequestMapping(value = "/Manager/MgPointAdd", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> MgPointAdd(@RequestParam HashMap params, MgUserVO mgUserVO, MgPointVO mgPointVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
//            if(mgPointVO.getPoint_add()
//            if(mgPointVO.getPoint_add()==null){
//                error.put(messageSource.getMessage("point_add","ko"),messageSource.getMessage("error.required","ko"));
//            }
            Integer getPointAmount = mgPointDAO.getMgPointAmount(mgPointVO);

            //지급과 환수를 동시에 할수 없습니다.

            //환수할 포인트가 없습니다.

            if(mgPointVO.getPoint_paid_memo().isEmpty()){
                error.put(messageSource.getMessage("point_paid_memo","ko"),messageSource.getMessage("error.required","ko"));
            }
            if(mgPointVO.getPoint_use()!=null){
                if(getPointAmount <= 0 ){
                    error.put("Error",messageSource.getMessage("error.pointExchangeFail","ko"));
                }
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{

                if(mgPointVO.getPoint_use()==null){
                    mgPointVO.setPoint_amount(getPointAmount+ mgPointVO.getPoint_add());
                }
                if(mgPointVO.getPoint_add()==null){
                    mgPointVO.setPoint_amount(getPointAmount - mgPointVO.getPoint_use());
                }
                mgPointVO.setPoint_paid_type("A");
                mgPointDAO.insertMgPoint(mgPointVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/member-management");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원등급설정 사용자,매니저,관리자
    @Transactional
    @RequestMapping(value = "/Manager/MgUserLevelUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> MgUserLevelUpdate(@RequestParam HashMap params, MgUserVO mgUserVO, MgPointVO mgPointVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
        	mgUserDAO.userLevelUpdate(params);
    		resultMap.put("success",true);
            resultMap.put("redirectUrl","/Manager/member-management");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
  //매니저,관리자 사용메뉴설정
    @Transactional
    @RequestMapping(value = "/Manager/MgUserEnableMenuUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> MgUserEnableMenuUpdate(@RequestParam HashMap params, MgUserVO mgUserVO, MgPointVO mgPointVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        System.out.println(params);
        if(params.get("enable_menu") == null || ((String)params.get("enable_menu")).equals("")) {
        	error.put(messageSource.getMessage("mg_enable_menu","ko"),messageSource.getMessage("error.required","ko"));
        }
        try {
        	 if(!isEmpty(error)){
                 resultMap.put("validateError",error);
             }else{
	        	mgUserDAO.userEnableMenuUpdate(params);
	    		resultMap.put("success",true);
	            resultMap.put("redirectUrl","/Manager/member-management");
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원 상세보기
    @RequestMapping(value = "/Manager/memberViewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerMeberViewDetail(@RequestParam HashMap params, MgUserVO mgUserVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgUserDAO.getUserDetail(mgUserVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
        return resultMap;
    }
    //로그인 처리 1
    @RequestMapping(value = "/Manager/ManagerSign/ManagerLoginProc", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> ManagerLoginProc(@RequestParam HashMap params, HttpSession session, UserVO userVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            String email = (String)params.get("email");
            String password = (String)params.get("password");
            params.put("password",null);//패스워드 초기화
            //관리자레벨
//            params.put("level",10);
            //Spring Security 5 단방향 암호화 패스워드 일치 확인 을 위해 이메일로 사용자정보를 가져온후 처리
            Map<String,Object> loginUserList = userDAO.getUserStoreList(params);
            //기본 Valitaion
            if(email==null || email.isEmpty()){
                error.put("Email", messageSource.getMessage("error.required","ko"));
            }
            if(password==null || password.isEmpty()){
                error.put("Password", messageSource.getMessage("error.required","ko"));
            }else{
                if(!isEmpty(loginUserList)){
                    if(passwordEncoder.matches(password,(String)loginUserList.get("password"))){
                        if ( session.getAttribute("adminLogin") != null ){
                            // 기존에 login이란 세션 값이 존재한다면
                            session.removeAttribute("adminLogin"); // 기존값을 제거해 준다.
                        }
                        session.setAttribute("email",email);
                        if((Integer)loginUserList.get("level") == 10) {
                            session.setAttribute("adminLogin", "admin");
                        }else {
                            if(loginUserList.get("status").equals("W")){
                                error.put("Error", messageSource.getMessage("error.loginFail","ko"));
                            }
                            session.setAttribute("adminLogin", "manager");
                        }
                        session.setAttribute("menuList", Arrays.asList(((String)loginUserList.get("enable_mg_menu_id")).split("\\|")));
                        session.setAttribute("level", loginUserList.get("level"));
                        session.setAttribute("mgCategoryList", selectorDAO.getMgCategoryList());
                        //로그인 기록 저장
                        userVO.setLog_type("adminlogin");
                        userDAO.insertUserHistory(userVO);
                        resultMap.put("redirectUrl", "/Manager/ManagerMain");
                    } else {
                        error.put("Error", messageSource.getMessage("error.notUsrInfo","ko"));
                    }
                }else{
                    error.put("Error", messageSource.getMessage("error.notUsrInfo","ko"));
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
    //공통 리스트삭제
    @RequestMapping(value = "/Manager/ListDelete", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> ListUpdate(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        String getChkArrValue="";
        try {
            //테이블명 table
            //pk 필드명 pk
            //삭제할 배열 chk

            if(mgCommonVO.getPk().equals(null) || mgCommonVO.getPk().equals("")){
                error.put("Pk name", messageSource.getMessage("error.required","ko"));
            }
            if(mgCommonVO.getTable_name().equals(null) || mgCommonVO.getTable_name().equals("")){
                error.put("Table", messageSource.getMessage("error.required","ko"));
            }
//            if(mgCommonVO.getChk().size() <= 0){
//                error.put("check box selector", messageSource.getMessage("error.required","ko"));
//            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                if(mgCommonVO.getTable_name().equals("product")){
                    mgSystemDAO.insertSystemDeleteHistory(mgCommonVO);
                }
                mgCommonDAO.ListDelete(mgCommonVO);
                params.put("email",session.getAttribute("email"));
                params.put("user_ip",req.getRemoteAddr());

                for(String pkArr : mgCommonVO.getChk()){
                    getChkArrValue += pkArr + "/";
                }
                params.put("work_history","관리자 > 선택삭제 > 관련테이블 : "+mgCommonVO.getTable_name() + "  삭제키 : "+ getChkArrValue);
                mgSystemDAO.insertSystemHistory(params);
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {
        	e.printStackTrace();
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //교환 환불 취소
    @RequestMapping(value = "/Manager/refundCancel", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> refundCancel(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
        	Map<String, Object> detail = paymentDAO.getMgPaymentBundleDetail(params);
        	//반품완료 결제취소
        	if(deliveryInfoVO.getPayment_status() != null && deliveryInfoVO.getPayment_status().equals("G")) {
        		client = new IamportClient(apiKey, apiSecret);
        		String merchant_uid = (String)detail.get("order_no");
        		int product_payment = Integer.parseInt(String.valueOf(detail.get("product_payment")));
				int payment_order_quantity = Integer.parseInt(String.valueOf(detail.get("payment_order_quantity")));
				int coupon_discount = Integer.parseInt(String.valueOf(detail.get("coupon_discount")));
				int return_amount = product_payment * payment_order_quantity - coupon_discount;

				BigDecimal return_amount_bd = new BigDecimal(return_amount);
        		CancelData cancel_data = new CancelData(merchant_uid, false, return_amount_bd); // merchant_uid를 통한
        		
        		cancel_data.setReason(deliveryInfoVO.getReason());//취소사유
        		if(deliveryInfoVO.getRefund_account() != null && !deliveryInfoVO.getRefund_account().equals("")) {
        			cancel_data.setRefund_account(deliveryInfoVO.getRefund_account());//계좌번호
        		}
        		if(deliveryInfoVO.getRefund_bank() != null && !deliveryInfoVO.getRefund_bank().equals("")) {
        			cancel_data.setRefund_bank(deliveryInfoVO.getRefund_bank());//kcp 은행코드
        		}
        		if(deliveryInfoVO.getRefund_holder() != null && !deliveryInfoVO.getRefund_holder().equals("")) {
        			cancel_data.setRefund_holder(deliveryInfoVO.getRefund_holder());// 수취인명 *수취인명과 은행코드 안맞으면 오류
        		}
        		
        		Map<String,Object> paymentDetail = paymentDAO.getMgPaymentBundleDetail(params);
                Payment impPayment = client.paymentByImpUid((String)paymentDetail.get("imp_uid")).getResponse();
                if(!impPayment.getPayMethod().equals("card") && impPayment.isEscrow()) cancel_data.setEscrowConfirmed(true);
                
        		IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);//요청 결과 확인
        		if (payment_response.getResponse() == null) {
    				error.put("Error", payment_response.getMessage());
    			}
        	}
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	//반품시 포인트 환수
            	if(deliveryInfoVO.getPayment_status() != null && deliveryInfoVO.getPayment_status().equals("G")) {
            		params.put("order_no",detail.get("order_no"));
            		params.put("product_cd",detail.get("product_cd"));
            		Map<String,Object> pointMap = pointDAO.getPointOrderNo(params);
            		
            		if(pointMap != null) {
	            		params.put("point_paid_user_id",pointMap.get("point_paid_user_id"));
	            		Map<String, Object> pointParam = new HashMap<>();
	            		String getPointAmountString = Integer.toString(pointDAO.getPointAmount(params));
	            		BigDecimal userPoint = new BigDecimal(getPointAmountString);
	            		BigDecimal pointMultiply = new BigDecimal(String.valueOf(pointMap.get("point_add"))); // 구매포인트
	            		pointParam.put("point_amount", userPoint.subtract(pointMultiply));
	            		pointParam.put("point_paid_memo", pointMap.get("point_paid_memo")+"(반품 환수)");
	            		pointParam.put("point_use", pointMultiply);
	            		pointParam.put("point_paid_user_id", pointMap.get("point_paid_user_id"));
	            		pointParam.put("point_paid_type", pointMap.get("point_paid_type"));
	            		pointParam.put("order_no", pointMap.get("order_no"));
	            		pointParam.put("point_paid_product_cd", pointMap.get("point_paid_product_cd"));
	            		pointDAO.insertPoint(pointParam);
            		}
            	}
                deliveryInfoVO.setOrder_no((String)detail.get("order_no"));
                deliveryDAO.updateDeliveryManager(deliveryInfoVO);
            	deliveryInfoVO.setOrder_no(String.valueOf(detail.get("no")));
                paymentDAO.updatePaymentBundleManger(deliveryInfoVO);
                resultMap.put("success",messageSource.getMessage("success.done","ko"));
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {
        	e.printStackTrace();
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //교환신청 선택
    @RequestMapping(value = "/Manager/selectDeliveryRefund", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectDeliveryRefund(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            Map<String,Object> list = refundDAO.getDeliveryRefundDetail(deliveryInfoVO);
            list.put("refund_account",list.get("refund_account_number"));
            list.put("refund_bank",list.get("refund_bank_name"));
            list.put("refund_holder",list.get("refund_account_holder"));
            params.put("code","kcp_bank_code");
            List<Map<String,Object>> getSelectorList = selectorDAO.getSelectorList(params);
            List<Map<String, Object>> bankCode = getSelectorList.stream().filter(item -> item.get("code_value").equals(list.get("refund_bank_name"))).collect(Collectors.toList());
            if(bankCode != null && !bankCode.isEmpty()) {
            	list.put("refund_bank_name",bankCode.get(0).get("code_name"));
			}
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("deliveryInfoVO",deliveryInfoVO);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //주문내역 선택
    @RequestMapping(value = "/Manager/selectPayment", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerSelectPayment(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            Map<String,Object> list = paymentDAO.getMgPaymentBundleDetail(params);
            client = new IamportClient(apiKey, apiSecret);
            Payment impPayment = client.paymentByImpUid((String)list.get("imp_uid")).getResponse();
            resultMap.put("impPayment", impPayment);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("paymentBundleList",paymentBundleList);
//                resultMap.put("deliveryInfoVO",deliveryInfoVO);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {
        	e.printStackTrace();
            resultMap.put("e", e);
        }
        return resultMap;
    }
    
  //업체 별 정산(상세내역)
    @RequestMapping(value = "/Manager/calculate-companyDetail")
    public Map<String,Object> managerCalculateCompanyDetail(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,HttpSession session,CalculateCompanyVO calculateCompanyVO) throws Exception {
    	 HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	 HashMap<String, Object> error = new HashMap<String, Object>();
    	try {
        	Map<String,Object> detail = calculateCompanyDAO.getCalculateCompanyListDetail(params);
            client = new IamportClient(apiKey, apiSecret);
            Payment impPayment = client.paymentByImpUid((String)detail.get("imp_uid")).getResponse();
            resultMap.put("impPayment", impPayment);
            if(!isEmpty(error)){
            	  resultMap.put("validateError",error);
            }else{
	              resultMap.put("detail",detail);
	          	  resultMap.put("email", session.getAttribute("email"));
	        	  resultMap.put("level", session.getAttribute("level"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
    
    //경품주문내역 선택
    @RequestMapping(value = "/Manager/selectPaymentG", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerSelectPaymentG(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	
    	try {
    		Map<String,Object> list = paymentDAO.getPaymentDetail(params);
    		resultMap.put("list",list);
    	} catch (Exception e) {
    		e.printStackTrace();
    		resultMap.put("e", e);
    	}
    	return resultMap;
    }
    //주문상태 일괄 처리
    @RequestMapping(value = "/Manager/paymentStatusUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> paymentStatusUpdate(@RequestParam HashMap params, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            mgCommonVO.setTable_name("payment_bundle");
            mgCommonVO.setColumn("payment_status");
            mgCommonVO.setPk("no");
            mgCommonVO.setUpdate_value((String)params.get("payment_status"));
            if(mgCommonVO.getChk() ==null){
                error.put("Error", messageSource.getMessage("error.selectModify","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCommonDAO.listUpdate(mgCommonVO);
                resultMap.put("redirectUrl","/Manager/order");
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //배송처리
    @RequestMapping(value = "/Manager/SaveDelivery", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerSaveDelivery(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            if(deliveryInfoVO.getDelivery_t_code() != "00"){
                if(deliveryInfoVO.getDelivery_status()!=null && deliveryInfoVO.getDelivery_status().equals("O")) {
                    if(deliveryInfoVO.getDelivery_t_invoice() == null || deliveryInfoVO.getDelivery_t_invoice().isEmpty()){
                        error.put(messageSource.getMessage("delivery_t_invoice","ko"), messageSource.getMessage("error.required","ko"));
                    }
                    if(deliveryInfoVO.getDelivery_t_code() == null || deliveryInfoVO.getDelivery_t_code().isEmpty()){
                        error.put(messageSource.getMessage("delivery_t_code","ko"), messageSource.getMessage("error.required","ko"));
                    }
                }
            }
            if(deliveryInfoVO.getDelivery_status()!=null && deliveryInfoVO.getDelivery_status().equals("C")){
                //환불을위한 토큰발급
                client = new IamportClient(apiKey,apiSecret);
                String merchant_uid = deliveryInfoVO.getOrder_no();
                CancelData cancel_data = new CancelData(merchant_uid, false); //merchant_uid를 통한 전액취소

                Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
                Payment impPayment = client.paymentByImpUid((String)paymentDetail.get("imp_uid")).getResponse();
                if(!impPayment.getPayMethod().equals("card") && impPayment.isEscrow()) cancel_data.setEscrowConfirmed(true);
                
                IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
                if(payment_response.getResponse()==null){
                    error.put("Error", payment_response.getMessage());
                }
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	Map<String, Object> detail = paymentDAO.getMgPaymentBundleDetail(params);
            	//배송완료시 포인트지급
            	if(deliveryInfoVO.getDelivery_status()!=null && deliveryInfoVO.getDelivery_status().equals("O")) {
            		params.put("point_paid_user_id",detail.get("payment_user_id"));
            		
            		//결제확인
            		client = new IamportClient(apiKey, apiSecret);
    	            Payment impPayment = client.paymentByImpUid((String)detail.get("imp_uid")).getResponse();
    	            if(impPayment.getStatus().equals("paid")) {
	            		long sumAddPoint = 0;
            			if(detail.get("product_point_class").equals("P")) { //적립율기준
            				int product_payment = Integer.parseInt(String.valueOf(detail.get("product_payment")));
            				int payment_order_quantity = Integer.parseInt(String.valueOf(detail.get("payment_order_quantity")));
            				int coupon_discount = Integer.parseInt(String.valueOf(detail.get("coupon_discount")));
            				double product_point_rate = Double.parseDouble(String.valueOf(detail.get("product_point_rate")));
            				
            				long addPoint = Math.round(((product_payment * payment_order_quantity - coupon_discount) * product_point_rate / 100));
            				sumAddPoint += addPoint;
            			}else {
            				//포인트 고정형 미개발
            			}
	            		
	            		Map<String, Object> pointParam = new HashMap<>();
	            		String getPointAmountString = Integer.toString(pointDAO.getPointAmount(params));
	            		BigDecimal userPoint = new BigDecimal(getPointAmountString);
	            		BigDecimal pointMultiply = new BigDecimal(sumAddPoint); // 구매포인트
	            		pointParam.put("point_amount", userPoint.add(pointMultiply));
	            		pointParam.put("point_paid_memo", detail.get("product_name"));
	            		pointParam.put("point_add", pointMultiply);
	            		pointParam.put("point_paid_user_id", detail.get("payment_user_id"));
	            		pointParam.put("point_paid_type", ((String)detail.get("order_no")).substring(0, 2).equals("PO") ? "O" : "P");
	            		pointParam.put("order_no", detail.get("order_no"));
	            		pointParam.put("point_paid_product_cd", detail.get("product_cd"));
	            		pointDAO.insertPoint(pointParam);
    	            }
            	}
            	deliveryInfoVO.setOrder_no((String)detail.get("order_no"));
                deliveryDAO.updateDeliveryManager(deliveryInfoVO);
            	if(deliveryInfoVO.getDelivery_status()!=null && deliveryInfoVO.getDelivery_status().equals("C")){
	                paymentDAO.updatePaymentBundleCancel(deliveryInfoVO);
            	}else {
	            	deliveryInfoVO.setOrder_no(String.valueOf(detail.get("no")));
	                paymentDAO.updatePaymentBundleManger(deliveryInfoVO);
            	}
                resultMap.put("success",messageSource.getMessage("success.done","ko"));
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {
        	e.printStackTrace();
            resultMap.put("e", e);
        }
        return resultMap;
    }
    
    //경품배송처리
    @RequestMapping(value = "/Manager/SaveDeliveryG", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerSaveDeliveryG(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            if(deliveryInfoVO.getDelivery_t_code() != "00"){
                if(deliveryInfoVO.getDelivery_status()!=null && deliveryInfoVO.getDelivery_status().equals("O")) {
                    if(deliveryInfoVO.getDelivery_t_invoice() == null || deliveryInfoVO.getDelivery_t_invoice().isEmpty()){
                        error.put(messageSource.getMessage("delivery_t_invoice","ko"), messageSource.getMessage("error.required","ko"));
                    }
                    if(deliveryInfoVO.getDelivery_t_code() == null || deliveryInfoVO.getDelivery_t_code().isEmpty()){
                        error.put(messageSource.getMessage("delivery_t_code","ko"), messageSource.getMessage("error.required","ko"));
                    }
                }
            }
            if(deliveryInfoVO.getDelivery_status()!=null && (deliveryInfoVO.getDelivery_status().equals("G") || deliveryInfoVO.getDelivery_status().equals("C"))){
                //환불을위한 토큰발급
                IamportClient client;
                String test_api_key = "7152058542143411";
                String test_api_secret = "mVKoCqCox7EBEya9KmB8RLeEzFwZBhpYd9mPAZe76SILqTVbgxj7jyLSdhSPzhNMraC19Q9gJS2aLXl1";
                client = new IamportClient(test_api_key, test_api_secret);
                String test_already_cancelled_merchant_uid = deliveryInfoVO.getOrder_no();
                CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소

                Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
                Payment impPayment = client.paymentByImpUid((String)paymentDetail.get("imp_uid")).getResponse();
                if(impPayment.isEscrow()) cancel_data.setEscrowConfirmed(true);
                
                IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
                if(payment_response.getResponse()==null){
                    error.put("Error", payment_response.getMessage());
                }
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                deliveryDAO.updateDeliveryManager(deliveryInfoVO);
                paymentDAO.updatePaymentManger(deliveryInfoVO);
                resultMap.put("success",messageSource.getMessage("success.done","ko"));
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {
        	e.printStackTrace();
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //주문 상세보기 - 배송지 수정
    @Transactional
	@RequestMapping(value = "/Manager/Addrmodi", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> managerAddrmodi(@RequestParam HashMap params, CommonVO commonVO, HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
		try {
			if (params.get("postcode").equals(null) || params.get("postcode").equals("")) {
				error.put("주소", messageSource.getMessage("error.required", "ko"));
			}

			if (!isEmpty(error)) {
				resultMap.put("validateError", error);
			} else {
				deliveryDAO.managerAddrmodi(params);
			}
		} catch (Exception e) {

			resultMap.put("e", e);
		}
		return resultMap;
	}

    //상품상세보기
    @RequestMapping(value = "/Manager/viewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerViewDetail(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
        	params.put("product_live_type","on");
            Map<String,Object> list = mgProductDAO.getProductViewDetail(params);

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //상품상세보기 출력시 기존 카테고리 정보 불러오기
    @RequestMapping(value = "/Manager/viewCategoryDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> viewCatetoryDetail(@RequestParam HashMap params){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> getCatetoryView = categoryDAO.getCategoryView(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("getCatetoryView",getCatetoryView);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //경품상세보기
    @RequestMapping(value = "/Manager/giveawayViewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerGiveawayViewDetail(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgGiveawayDAO.getGiveawayViewDetail(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    
    //경품등록
    @RequestMapping(value = "/Manager/GiveawayAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerGiveawayAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, GiveawayVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"giveaway");
            List<FileVO> filelist2 = fs.saveAllFiles(boardInfo.getUploadfile2(),downloadPath+"giveaway");
            List<FileVO> filelist3 = fs.saveAllFiles(boardInfo.getUploadfile3(),downloadPath+"giveaway");
            List<FileVO> filelist4 = fs.saveAllFiles(boardInfo.getUploadfile4(),downloadPath+"giveaway");
            List<FileVO> filelist5 = fs.saveAllFiles(boardInfo.getUploadfile5(),downloadPath+"giveaway");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/giveaway/"+ft.format(new Date())+"/");
            //
            String product_cd = "G"+numberGender.numberGen(7,1);
            productVO.setGiveaway_cd(product_cd);

            if(productVO.getGiveaway_name().isEmpty()){
                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(productVO.getGiveaway_play_winner_point() == null || productVO.getGiveaway_play_winner_point() == 0){
                error.put(messageSource.getMessage("giveaway_play_winner_point","ko"), messageSource.getMessage("error.required","ko"));
            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
            // if(productVO.getGiveaway_company_payment() == null){
            //     error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
            // }
            // if(productVO.getGiveaway_payment() == null){
            //     error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
            // }
            // if(productVO.getGiveaway_user_payment() == null){
            // 	error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
            // }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getGiveaway_cd());
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist3)){
                    fileVO.setFileorder(3);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist4)){
                    fileVO.setFileorder(4);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist5)){
                    fileVO.setFileorder(5);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                mgGiveawayDAO.insertGiveaway(productVO);
                resultMap.put("redirectUrl","/Manager/Giveaway");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //경품 업데이트
    @RequestMapping(value = "/Manager/GiveawayUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerGiveawayUpdateProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, GiveawayVO giveawayVO,ProductVO productVO,BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
        	if(giveawayVO.getGiveaway_name().isEmpty()){
                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(giveawayVO.getGiveaway_play_winner_point() == null || giveawayVO.getGiveaway_play_winner_point() == 0){
                error.put(messageSource.getMessage("giveaway_play_winner_point","ko"), messageSource.getMessage("error.required","ko"));
            }

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"giveaway");
            List<FileVO> filelist2 = fs.saveAllFiles(boardInfo.getUploadfile2(),downloadPath+"giveaway");
            List<FileVO> filelist3 = fs.saveAllFiles(boardInfo.getUploadfile3(),downloadPath+"giveaway");
            List<FileVO> filelist4 = fs.saveAllFiles(boardInfo.getUploadfile4(),downloadPath+"giveaway");
            List<FileVO> filelist5 = fs.saveAllFiles(boardInfo.getUploadfile5(),downloadPath+"giveaway");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/giveaway/"+ft.format(new Date())+"/");
            //
//            String product_cd = "P"+numberGender.numberGen(7,2);
//            productVO.setProduct_cd(product_cd);


//            if(productVO.getProduct_name().isEmpty()){
//                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_company_payment() == null){
//                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_payment() == null){
//                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(giveawayVO.getGiveaway_cd());
//                fileVO.setParentPK(productVO.getProduct_cd());
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist3)){
                    fileVO.setFileorder(3);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist4)){
                    fileVO.setFileorder(4);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist5)){
                    fileVO.setFileorder(5);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }

//                mgProductDAO.insertProduct(productVO);
//                mgProductDAO.updateProduct();
                mgGiveawayDAO.updateGiveaway(giveawayVO);
//                mgProductDAO.updasteProduct(productVO);
                resultMap.put("redirectUrl","/Manager/Giveaway");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상푼분류
    @RequestMapping(value = "/Manager/productCategoryList", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productCategoryList(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            params.put("pd_category_use_yn","Y");
            List<Map<String,Object>> list = categoryDAO.getCategoryList(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //상푼분류 업데이트
    @RequestMapping(value = "/Manager/productCategoryUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryUpdateProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"category");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/category/"+ft.format(new Date())+"/");

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getProduct_cd());
                if(!isEmpty(filelist)){
//                    mgProductDAO.deleteProductFile(productVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }

//                mgProductDAO.insertProduct(productVO);
//                mgProductDAO.updateProduct();
                mgProductDAO.updateProduct(productVO);
//                mgProductDAO.updasteProduct(productVO);
                resultMap.put("redirectUrl","/Manager/Category");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품분류 추가
    @RequestMapping(value = "/Manager/productCategoryAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            if(params.get("pd_category_name")==null||params.get("pd_category_name").equals("")){
                error.put("카테고리 명", messageSource.getMessage("error.required","ko"));
            }
            if(isEmpty(error)){
            	Object adminLogin = session.getAttribute("adminLogin");
                String email = (String)session.getAttribute("email");
            	if(adminLogin.equals("admin")){
            		params.put("store_id", "admin");
        		}else {
        			params.put("store_id", email);
        		}
                categoryDAO.insertCategory(params);
                resultMap.put("redirectUrl","/Manager/Category");

            }else{
                resultMap.put("validateError",error);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    
    //카테고리 승인
    @RequestMapping(value = "/Manager/eventApprovalUpdate",method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> eventApprovalUpdate(@RequestParam HashMap params, HttpServletRequest request, MgCommonVO mgCommonVO){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	
    	try{
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			categoryDAO.eventApprovalUpdate(mgCommonVO);
    		}
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	return resultMap;
    }
    //상품분류 삭제
    @RequestMapping(value = "/Manager/productCategoryDeleteProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryDeleteProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            if(params.get("pd_category_id")==""){
                error.put("카테로리 선택", messageSource.getMessage("error.required","ko"));
            }
            if(isEmpty(error)){
                categoryDAO.deleteCategory(params);
                resultMap.put("redirectUrl","/Manager/Category");

            }else{
                resultMap.put("validateError",error);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 분류 선택
    @RequestMapping(value = "/Manager/productCategorySelect", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productCategorySelect(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request, SearchVO searchVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> categorySelect = categoryDAO.getCategoryDetail(searchVO);
            resultMap.put("categorySelect",categorySelect);
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //상품분류 디스플레이 관리
    @RequestMapping(value = "/Manager/productCategoryDisplayProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryDisplayProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"category");
            List<FileVO> filelist2 = fs.saveAllFiles(boardInfo.getUploadfile2(),downloadPath+"category");
            List<FileVO> filelist3 = fs.saveAllFiles(boardInfo.getUploadfile3(),downloadPath+"category");
            List<FileVO> filelist4 = fs.saveAllFiles(boardInfo.getUploadfile4(),downloadPath+"category");
            List<FileVO> filelist5 = fs.saveAllFiles(boardInfo.getUploadfile5(),downloadPath+"category");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/category/"+ft.format(new Date())+"/");

            if(params.get("pd_category_id")==""){
                error.put("카테고리 선택", messageSource.getMessage("error.required","ko"));
            }
            if(isEmpty(error)){
                fileVO.setParentPK((String)params.get("pd_category_id"));
                Object adminLogin = session.getAttribute("adminLogin");
                String email = (String)session.getAttribute("email");
                if(adminLogin.equals("admin")){
            		params.put("store_id", "admin");
            		params.put("event_approval_yn", "Y");
            		categoryDAO.updateCategory(params);
        		}else {
        			params.put("store_id", email);
        			params.put("event_approval_yn", "N");
        		}
                
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    categoryDAO.deleteCategoryFile(filelist,fileVO);
                    categoryDAO.insertCategoryFile(filelist,fileVO);
                }
                //기획전 상단
                if(!isEmpty(filelist3)){
                    fileVO.setFileorder(3);
                    categoryDAO.deleteCategoryFile(filelist3,fileVO);
                    categoryDAO.insertCategoryFile(filelist3,fileVO);
                }
                //매인베너
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    categoryDAO.deleteCategoryFile(filelist2,fileVO);
                    categoryDAO.insertCategoryFile(filelist2,fileVO);
                }
                //이벤트 목록
                if(!isEmpty(filelist4)){
                    fileVO.setFileorder(4);
                    categoryDAO.deleteCategoryFile(filelist4,fileVO);
                    categoryDAO.insertCategoryFile(filelist4,fileVO);
                }
                //이벤트 상단
                if(!isEmpty(filelist5)){
                    fileVO.setFileorder(5);
                    categoryDAO.deleteCategoryFile(filelist5,fileVO);
                    categoryDAO.insertCategoryFile(filelist5,fileVO);
                }
                if(params.get("pd_category_event_start").equals("")){
                    params.put("pd_category_event_start",null);
                }
                if(params.get("pd_category_event_end").equals("")){
                    params.put("pd_category_event_end",null);
                }
                if(params.get("banner_start_date").equals("")){
                    params.put("banner_start_date",null);
                }
                if(params.get("banner_end_date").equals("")){
                    params.put("banner_end_date",null);
                }
                if(params.get("event_start_date").equals("")){
                    params.put("event_start_date",null);
                }
                if(params.get("event_end_date").equals("")){
                    params.put("event_end_date",null);
                }

                categoryDAO.insertCategoryEvent(params);
                resultMap.put("redirectUrl","/Manager/Category");

            }else{
                resultMap.put("validateError",error);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 업데이트
    @RequestMapping(value = "/Manager/productUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductUpdateProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
        	if(productVO.getProduct_live_type().equals("")) {
        		productVO.setProduct_live_type(null);
        	}
        	if(productVO.getProduct_validity_start().equals("")) {
        		productVO.setProduct_validity_start(null);
        	}
        	if(productVO.getProduct_validity_end().equals("")) {
        		productVO.setProduct_validity_end(null);
        	}
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
            List<FileVO> filelist2 = fs.saveAllFiles(boardInfo.getUploadfile2(),downloadPath+"product");
            List<FileVO> filelist3 = fs.saveAllFiles(boardInfo.getUploadfile3(),downloadPath+"product");
            List<FileVO> filelist4 = fs.saveAllFiles(boardInfo.getUploadfile4(),downloadPath+"product");
            List<FileVO> filelist5 = fs.saveAllFiles(boardInfo.getUploadfile5(),downloadPath+"product");
            List<FileVO> filelist6 = fs.saveAllFiles(boardInfo.getUploadfile6(),downloadPath+"product");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");
            //
//            String product_cd = "P"+numberGender.numberGen(7,2);
//            productVO.setProduct_cd(product_cd);


//            if(productVO.getProduct_name().isEmpty()){
//                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_company_payment() == null){
//                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_payment() == null){
//                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }

            if(params.get("product_delivery_class").equals("T")) {
                if (!params.get("product_delivery_type").equals("A")) {
                    productVO.setDelivery_t_code(null);
                }
            } else {
                productVO.setDelivery_t_code(null);
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getProduct_cd());
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    mgProductDAO.deleteProductFile(filelist2,fileVO);
                    mgProductDAO.insertProductFile(filelist2,fileVO);
                }
                if(!isEmpty(filelist3)){
                    fileVO.setFileorder(3);
                    mgProductDAO.deleteProductFile(filelist3,fileVO);
                    mgProductDAO.insertProductFile(filelist3,fileVO);
                }
                if(!isEmpty(filelist4)){
                    fileVO.setFileorder(4);
                    mgProductDAO.deleteProductFile(filelist4,fileVO);
                    mgProductDAO.insertProductFile(filelist5,fileVO);
                }
                if(!isEmpty(filelist5)){
                    fileVO.setFileorder(5);
                    mgProductDAO.deleteProductFile(filelist5,fileVO);
                    mgProductDAO.insertProductFile(filelist5,fileVO);
                }
                if(!isEmpty(filelist6)){
                	fileVO.setFileorder(6);
                	mgProductDAO.deleteProductFile(filelist6,fileVO);
                	mgProductDAO.insertProductFile(filelist6,fileVO);
                }

//                mgProductDAO.insertProduct(productVO);
//                mgProductDAO.updateProduct();
                Object adminLogin = session.getAttribute("adminLogin");
                String email = (String)session.getAttribute("email");
                params.put("store_id", email);
                Map<String,Object> storeDetail =  mgSystemDAO.getStoreForId(params);
            	if(adminLogin.equals("admin")){
            		productVO.setProduct_approval_yn("Y");
        		}else {
        			productVO.setProduct_approval_yn("N");
        			productVO.setStore_id(email);
        			productVO.setProduct_supplier((String)storeDetail.get("supplier_cd"));
        		}
                mgProductDAO.updateProduct(productVO);
//                mgProductDAO.updasteProduct(productVO);
                String Referer =request.getHeader("Referer");
                resultMap.put("redirectUrl",Referer);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품등록 에디터 이미지 업로드
    @RequestMapping(value="/Manager/uploadSummernoteImageFile", method = RequestMethod.POST, produces = "application/json")
//    @ResponseBody
    public HashMap<String, Object> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        JsonObject jsonObject = new JsonObject();

        String fileRoot = downloadEditorPath;	//저장될 외부 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

        String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

        File targetFile = new File(fileRoot + savedFileName);
        Object siteUrl = request.getRequestURL().toString().replace(request.getRequestURI(),"");
        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
            resultMap.put("url", siteUrl+"/product/editorUploads/"+savedFileName);
            resultMap.put("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
            resultMap.put("responseCode", "error");
            e.printStackTrace();
        }

        return resultMap;
    }


    @RequestMapping(value = "/Manager/companyInfoModi", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerCompanyInfoModi(CompanyInfoVO companyInfoVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
    //    HashMap<String, Object> error = new HashMap<String, Object>();
        try{
        	    companyInfoDAO.insertCompanyInfo(companyInfoVO);
                resultMap.put("redirectUrl","/Manager/companyInfo");
            }
        catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품등록
    @RequestMapping(value = "/Manager/productAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductAddProc(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
        	if(productVO.getProduct_live_type().equals("")) {
        		productVO.setProduct_live_type(null);
        	}
        	if(productVO.getProduct_validity_start().equals("")) {
        		productVO.setProduct_validity_start(null);
        	}
        	if(productVO.getProduct_validity_end().equals("")) {
        		productVO.setProduct_validity_end(null);
        	}
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
            List<FileVO> filelist2 = fs.saveAllFiles(boardInfo.getUploadfile2(),downloadPath+"product");
            List<FileVO> filelist3 = fs.saveAllFiles(boardInfo.getUploadfile3(),downloadPath+"product");
            List<FileVO> filelist4 = fs.saveAllFiles(boardInfo.getUploadfile4(),downloadPath+"product");
            List<FileVO> filelist5 = fs.saveAllFiles(boardInfo.getUploadfile5(),downloadPath+"product");
            List<FileVO> filelist6 = fs.saveAllFiles(boardInfo.getUploadfile6(),downloadPath+"product");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");
            //
            String product_cd = "P"+numberGender.numberGen(7,1);
            productVO.setProduct_cd(product_cd);

            deliveryInfoVO.setDelivery_t_key(t_key);
            deliveryInfoVO.setDelivery_t_url(t_url);
            //택배사목록
            Map<String, Object> companylist = CurlPost.curlPostFn(
                    deliveryInfoVO.getDelivery_t_url()
                            +"/api/v1/companylist?t_key="+deliveryInfoVO.getDelivery_t_key(),
                    "",
                    "",
                    "get"
            );
            List<Map<String,Object>> company = (List)companylist.get("Company");

            if(params.get("product_delivery_class").equals("T")) {
                if (!params.get("product_delivery_type").equals("A")) {
                    productVO.setDelivery_t_code(null);
                }
            } else {
                productVO.setDelivery_t_code(null);
            }


            if(productVO.getProduct_name().isEmpty()){
                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().idefaultModals){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
            if(productVO.getProduct_company_payment() == null){
                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(productVO.getProduct_payment() == null){
                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
            }
            /*if(productVO.getProduct_user_payment() == null){
            	error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
            }*/

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getProduct_cd());
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    mgProductDAO.deleteProductFile(filelist,fileVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    mgProductDAO.deleteProductFile(filelist2,fileVO);
                    mgProductDAO.insertProductFile(filelist2,fileVO);
                }
                if(!isEmpty(filelist3)){
                    fileVO.setFileorder(3);
                    mgProductDAO.deleteProductFile(filelist3,fileVO);
                    mgProductDAO.insertProductFile(filelist3,fileVO);
                }
                if(!isEmpty(filelist4)){
                    fileVO.setFileorder(4);
                    mgProductDAO.deleteProductFile(filelist4,fileVO);
                    mgProductDAO.insertProductFile(filelist4,fileVO);
                }
                if(!isEmpty(filelist5)){
                    fileVO.setFileorder(5);
                    mgProductDAO.deleteProductFile(filelist5,fileVO);
                    mgProductDAO.insertProductFile(filelist5,fileVO);
                }
                if(!isEmpty(filelist6)){
                    fileVO.setFileorder(6);
                    mgProductDAO.deleteProductFile(filelist6,fileVO);
                    mgProductDAO.insertProductFile(filelist6,fileVO);
                }
                
                Object adminLogin = session.getAttribute("adminLogin");
                String email = (String)session.getAttribute("email");
                params.put("store_id", email);
                Map<String,Object> storeDetail =  mgSystemDAO.getStoreForId(params);
            	if(adminLogin.equals("admin")){
            		productVO.setProduct_approval_yn("Y");
        		}else {
        			productVO.setProduct_approval_yn("N");
        			productVO.setStore_id(email);
        			productVO.setProduct_supplier((String)storeDetail.get("supplier_cd"));
        		}
                mgProductDAO.insertProduct(productVO);
                resultMap.put("redirectUrl","/Manager/Product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 복사 등록
    @RequestMapping(value = "/Manager/productCopyProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCopyProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            String product_cd = "P"+numberGender.numberGen(7,1);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	Object adminLogin = session.getAttribute("adminLogin");
            	if(adminLogin.equals("admin")){
        			params.put("product_approval_yn","Y");
        		}
                //등록될 키는 다시 만들어준다
                params.put("product_cd",product_cd);
                mgProductDAO.insertProductCopy(params);
                mgProductDAO.insertProductFileCopy(params);
                resultMap.put("redirectUrl","/Manager/Product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //경품 복사 등록
    @RequestMapping(value = "/Manager/giveawayCopyProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerGiveawayCopyProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            String giveaway_cd = "G"+numberGender.numberGen(7,1);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                //등록될 키는 다시 만들어준다
                params.put("giveaway_cd",giveaway_cd);
                mgGiveawayDAO.insertGiveawayCopy(params);
                mgGiveawayDAO.insertGiveawayFileCopy(params);
                resultMap.put("redirectUrl","/Manager/Giveaway");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //입점업체 등록
    @RequestMapping(value = "/Manager/storeAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, StoreVO storeVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        if(params.get("enable_menu") == null || ((String)params.get("enable_menu")).equals("")) {
            error.put(messageSource.getMessage("mg_enable_menu","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(params.get("storIdDupCheck") == null || params.get("storIdDupCheck").equals("")){
            error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.overlapCheck", "ko"));
        }
        if(params.get("storRegDupCheck") == null || params.get("storRegDupCheck").equals("")){
            error.put(messageSource.getMessage("store_reg","ko"), messageSource.getMessage("error.overlapCheck", "ko"));
        }
        try{
        	storeVO.setSupplier_cd("S"+numberGender.numberGen(6, 1));
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"store");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/store/"+ft.format(new Date())+"/");
            //

            if(storeVO.getStore_id().isEmpty()){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.required","ko"));
            }
            Map<String,Object> soterInfo = mgStoreDAO.getStoreDetail(storeVO);

            if(!isEmpty(soterInfo)){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.chkDplcId","ko"));
            }
            if(storeVO.getStore_password()==null || storeVO.getStore_password().isEmpty()){
                error.put(messageSource.getMessage("pswd","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(storeVO.getStore_passwordCf()==null || storeVO.getStore_passwordCf().isEmpty()){
                error.put(messageSource.getMessage("pswdCfm","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!storeVO.getStore_password().equals(storeVO.getStore_passwordCf())){
                error.put(messageSource.getMessage("pswd","ko"), messageSource.getMessage("error.inpPwdCfm", "ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                storeVO.setStore_approval_status("W");
                storeVO.setLevel(9);
                fileVO.setParentPK(storeVO.getStore_id());
                fileVO.setFileorder(1);
                mgProductDAO.insertProductFile(filelist,fileVO);
                storeVO.setStore_password(passwordEncoder.encode((String)params.get("store_password")));
                storeVO.setStore_creator_yn((String) params.get("store_creator_yn"));
                storeVO.setEnable_mg_menu_id((String) params.get("enable_menu"));
                storeVO.setStore_pur_com((String) params.get("store_pur_com"));
                mgStoreDAO.insertStore(storeVO);
                Object obj = session.getAttribute("adminLogin");
                if ( obj == null ){
                    resultMap.put("redirectUrl","/");
                }else{
                    resultMap.put("redirectUrl","/Manager/company-app");
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //입점업체 선택
    @RequestMapping(value = "/Manager/storeViewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerStoreViewDetail(@RequestParam HashMap params,StoreVO storeVO, HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgStoreDAO.getStoreDetail(storeVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //입점업체 승인
    @RequestMapping(value = "/Manager/storeApproval", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerStoreApproval(@RequestParam HashMap params,StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                storeVO.setStore_approval_status("T");
                mgStoreDAO.updateStoreApproval(storeVO);
                resultMap.put("redirectUrl","/Manager/company-app");
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //입점업체 업데이트
    @RequestMapping(value = "/Manager/storeUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreUpdateProc(@RequestParam HashMap params, BoardVO boardInfo,FileVO fileVO,StoreVO storeVO,ProductVO productVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        if(params.get("enable_menu") == null || ((String)params.get("enable_menu")).equals("")) {
        	error.put(messageSource.getMessage("mg_enable_menu","ko"),messageSource.getMessage("error.required","ko"));
        }
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(storeVO.getStore_id());
                fileVO.setFileorder(1);
                if(!isEmpty(filelist)){
                    productVO.setProduct_cd(storeVO.getStore_id());
                    mgStoreDAO.deleteProductFile(productVO);
                   // mgProductDAO.insertProductFile(filelist,fileVO);
                    
                    Integer count =storeInfoDAO.selectfileInfo(storeVO);
	            	  storeVO.getFileName();
	            	  
	                // productVO.setProduct_cd(storeVO.getStore_id());
	                // mgStoreDAO.deleteProductFile(productVO);
	            	  
	            	  if(count==0) {
	            		  storeInfoDAO.insertProductFile1(filelist,fileVO);
	            	  }else {
	            		  storeInfoDAO.updateStoreFile(filelist,fileVO);
	            	  }
	            	  resultMap.put("redirectUrl","/Manager/company-app");
                    
                }

//                storeVO.setStore_password(passwordEncoder.encode((String)params.get("store_password")));
                storeVO.setStore_creator_yn((String) params.get("store_creator_yn"));
                storeVO.setEnable_mg_menu_id((String) params.get("enable_menu"));
                mgStoreDAO.updateStore(storeVO);
                resultMap.put("redirectUrl","/Manager/company-app");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

    //입점업체 아이디 중복체크
    @RequestMapping(value = "/Manager/storeIdDupCheck", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreIdDupCheck(StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            Map<String,Object> soterInfo = mgStoreDAO.getMgUserList(storeVO);

            if(storeVO.getStore_id().isEmpty()){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(soterInfo)){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.chkDplcId","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("status",true);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //사업자 중복체크
    @RequestMapping(value = "/Manager/storeRegDupCheck", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreRegDupCheck(StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            Map<String,Object> soterInfo = mgStoreDAO.getStoreRegDetail(storeVO);

            if(storeVO.getStore_reg().isEmpty()){
                error.put(messageSource.getMessage("store_reg","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(soterInfo)){
                error.put(messageSource.getMessage("store_reg","ko"), messageSource.getMessage("error.chkDplcBsReg","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("status",true);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //환경설정 저장
    @RequestMapping(value = "/Manager/config-proc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerConfigProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            params.put("market_config_id", "systemText");
        	params.put("store_id", "admin");//임시
            configDAO.insertConfig(params);
            resultMap.put("redirectUrl",request.getHeader("Referer"));
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원 등급 선택
    @RequestMapping(value = "/Manager/selectUserGrant", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectUserGrant(@RequestParam HashMap params,MgUserVO mgUserVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgUserGrantDAO.getUserGrant(mgUserVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //회원 등급 추가
    @RequestMapping(value = "/Manager/userGrantAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerConfigProc(@RequestParam HashMap params,MgUserVO mgUserVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgUserVO.getPayment_limit()==null){
                error.put(messageSource.getMessage("payment_limit","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getPayment_event_amount()==null){
                error.put(messageSource.getMessage("payment_event_amount","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getPayment_point_limit()==null){
                error.put(messageSource.getMessage("payment_point_limit","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getEvent_point()==null){
                error.put(messageSource.getMessage("event_point","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getUser_grant_name().isEmpty()){
                error.put(messageSource.getMessage("user_grant_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgUserGrantDAO.insertUserGrant(mgUserVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/member-management");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원 등급 변경
    @RequestMapping(value = "/Manager/userGrantListUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> userGrantListUpdate(@RequestParam HashMap params, HttpSession session,MgUserVO mgUserVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgUserGrantDAO.userGrantListUpdate(mgUserVO);
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }

    //회원관리 - 이메일 전송
    @RequestMapping(value = "/Manager/authemail", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> Managerauthemail(@RequestParam HashMap params,HttpServletRequest request, UserVO userVO){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            if(params.get("user_grant") != null){
                String[] usergrant = request.getParameterValues("user_grant");
                int[] user_grant = Arrays.stream(usergrant).mapToInt(Integer::parseInt).toArray();
                String s_usergrant = "";
                for(int i=0; i < usergrant.length; i++){
                    s_usergrant += usergrant[i];
                    if(i < usergrant.length -1) {
                        s_usergrant += "|";
                    }
                }
                params.put("user_grant", user_grant);
                params.put("s_usergrant", s_usergrant);
            }
            if(params.get("age_class") != null){
                String[] ageclass = request.getParameterValues("age_class");
                int[] age_class = Arrays.stream(ageclass).mapToInt(Integer::parseInt).toArray();
                String s_ageclass = "";
                for(int i=0; i < ageclass.length; i++){
                    s_ageclass += ageclass[i];
                    if(i < ageclass.length -1) {
                        s_ageclass += "|";
                    }
                }
                params.put("age_class", age_class);
                params.put("s_ageclass", s_ageclass);
            }
            if(params.get("sex") != null){
                String[] sex = request.getParameterValues("sex");
                String s_sex = "";
                for(int i=0; i < sex.length; i++){
                    s_sex += sex[i];
                    if(i < sex.length -1) {
                        s_sex += "|";
                    }
                }
                params.put("sex", sex);
                params.put("s_sex", s_sex);
            }

            if(params.get("goods-cate") != null && params.get("goods-cate") != ""){
                String product = (String) params.get("goods-cate");
                String[] product_ct = product.split("\\|");
                params.put("product_ct", product_ct);
            }

            String memo;
            String subject = (String) params.get("mail_title");
            memo = (String)params.get("mem-text");

            if(params.get("mail_title") == null || params.get("mail_title") == ""){
                    error.put("Error", "메일 제목을 입력해주세요.");
            }

            List<Map<String,Object>> sendmaillist = userDAO.getMailUserList(params);


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                for(Map<String,Object> list:sendmaillist) {
                    mailSender.sendSimpleMessage((String) list.get("email"), subject, memo);
                    params.put("usr_id", list.get("usr_id"));
                    params.put("email", list.get("email"));
                    params.put("subject", subject);
                    userDAO.insertMarketingLog(params);
                }
                resultMap.put("success","success");
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }

    //회원관리 - SMS 보내기
    @RequestMapping(value = "/Manager/sendsms", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json")
    public HashMap<String, Object> ManagerSendSms(@RequestParam HashMap params,ModelMap model,HttpServletRequest request, UserVO userVO){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            if(params.get("user_grant") != null){
                String[] usergrant = request.getParameterValues("user_grant");
                int[] user_grant = Arrays.stream(usergrant).mapToInt(Integer::parseInt).toArray();
                String s_usergrant = "";
                for(int i=0; i < usergrant.length; i++){
                    s_usergrant += usergrant[i];
                    if(i < usergrant.length -1) {
                        s_usergrant += "|";
                    }
                }
                params.put("user_grant", user_grant);
                params.put("s_usergrant", s_usergrant);
            }
            if(params.get("age_class") != null){
                String[] ageclass = request.getParameterValues("age_class");
                int[] age_class = Arrays.stream(ageclass).mapToInt(Integer::parseInt).toArray();
                String s_ageclass = "";
                for(int i=0; i < ageclass.length; i++){
                    s_ageclass += ageclass[i];
                    if(i < ageclass.length -1) {
                        s_ageclass += "|";
                    }
                }
                params.put("age_class", age_class);
                params.put("s_ageclass", s_ageclass);
            }
            if(params.get("sex") != null){
                String[] sex = request.getParameterValues("sex");
                String s_sex = "";
                for(int i=0; i < sex.length; i++){
                    s_sex += sex[i];
                    if(i < sex.length -1) {
                        s_sex += "|";
                    }
                }
                params.put("sex", sex);
                params.put("s_sex", s_sex);
            }
            if(params.get("goods-cate") != null && params.get("goods-cate") != ""){
                String product = (String) params.get("goods-cate");
                String[] product_ct = product.split("\\|");
                params.put("product_ct", product_ct);
            }
            String memo;
            String subject = (String) params.get("sms_title");
            memo = (String)params.get("mem-text");
            String profile_key = "0f46edf22b245b284f0b3bc6c6868bf1b7734c59";

            if(params.get("sms_kind").equals("S")){
                if(params.get("sms_title") != ""){
                    error.put("Error", "SMS 제목은 LMS일 경우만 이용 가능합니다.");
               }
            }
            if(params.get("sms_kind").equals("L")){
                if(params.get("sms_title") == null || params.get("sms_title") == ""){
                    error.put("Error", "SMS 제목을 입력해주세요.");
                }
            }

            List<Map<String,Object>> sendsmslist = userDAO.getMailUserList(params);

            HttpClient client = HttpClientBuilder.create().build();
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{

                if(subject != null && subject != ""){
                    for(Map<String,Object> list:sendsmslist) {//+list.get("phone")
                        String msgid = "SWT-"+numberGender.numberGen(7,1);
					    HttpPost post =  new HttpPost ("https://alimtalk-api.sweettracker.net//v2/"+profile_key+"/sendMessage");

                        StringEntity jsonparams = new StringEntity("[{\"reserved_time\":\"00000000000000\",\"receiver_num\":\""+list.get("phone")+"\",\"sms_title\":\""+subject+"\",\"sms_kind\":\"L\",\"profile_key\":\"+profile_key+\",\"sender_num\":\"1811-9590\",\"sms_message\":\""+memo+"\",\"sms_only\":\"Y\",\"msgid\":\""+msgid+"\",\"message\":\"\"}]", "UTF-8");
					    jsonparams.setContentType(new BasicHeader(HTTP.CONTENT_TYPE, "application/json; charset=UTF-8"));
                        post.addHeader("userid", "onejoycorp");
					    post.addHeader("Content-Type", "application/json;charset=UTF-8");
                        post.setEntity(jsonparams);


					    HttpResponse response = client.execute(post);

					    if (response.getStatusLine().getStatusCode() != 200) {
                            resultMap.put("validateError", error);
                        }else {
					        params.put("msg_id", msgid);
					        params.put("usr_id", list.get("usr_id"));
                            params.put("email", list.get("phone"));
                            params.put("subject", subject);
                            userDAO.insertMarketingLog(params);
					        resultMap.put("success","success");
                        }
                    }
                } else{
                    for(Map<String,Object> list:sendsmslist) {
                        String msgid = "SWT-"+numberGender.numberGen(7,1);
					    HttpPost post =  new HttpPost ("https://alimtalk-api.sweettracker.net//v2/"+profile_key+"/sendMessage");

                        StringEntity jsonparams = new StringEntity("[{\"reserved_time\":\"00000000000000\",\"receiver_num\":\""+list.get("phone")+"\",\"sms_kind\":\"S\",\"profile_key\":\"+profile_key+\",\"sender_num\":\"1811-9590\",\"sms_message\":\""+memo+"\",\"sms_only\":\"Y\",\"msgid\":\""+msgid+"\",\"message\":\"\"}]", "UTF-8");
					    jsonparams.setContentType(new BasicHeader(HTTP.CONTENT_TYPE, "application/json; charset=UTF-8"));
                        post.addHeader("userid", "onejoycorp");
					    post.addHeader("Content-Type", "application/json;charset=UTF-8");
                        post.setEntity(jsonparams);


					    HttpResponse response = client.execute(post);

					    if (response.getStatusLine().getStatusCode() != 200) {
                            resultMap.put("validateError", error);
                        } else {
					        params.put("msg_id", msgid);
					        params.put("usr_id", list.get("usr_id"));
                            params.put("phone", list.get("phone"));
                            userDAO.insertMarketingLog(params);
					        resultMap.put("success","success");
                        }

                    }
                }
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }


    //브랜드 등록
    @RequestMapping(value = "/Manager/brandAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> brandAddProc(@RequestParam HashMap params,MgBrandVO mgBrandVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgBrandVO.getProduct_brand().isEmpty()) {
                mgBrandVO.setProduct_brand("B"+numberGender.numberGen(7,1));
            }
            if(mgBrandVO.getProduct_brand_name().isEmpty()){
                error.put(messageSource.getMessage("product_brand_name","ko"), messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgBrandDAO.insertBrand(mgBrandVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/option-brand");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //브랜드 선택
    @RequestMapping(value = "/Manager/selectBrand", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectBrand(@RequestParam HashMap params,MgBrandVO mgBrandVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgBrandDAO.getBrand(mgBrandVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //옵션 등록
    @RequestMapping(value = "/Manager/optionAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> optionAddProc(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgOptionVO.getProduct_option_code().isEmpty()){
                mgOptionVO.setProduct_option_code("PD-OPTION-"+numberGender.numberGen(6,1));
            }
            if(mgOptionVO.getProduct_option_input().isEmpty()){
                error.put(messageSource.getMessage("product_option_input","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgOptionVO.getProduct_option_color().isEmpty()){
                error.put(messageSource.getMessage("product_option_color","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgOptionVO.getProduct_option_set_name().isEmpty()){
                error.put(messageSource.getMessage("product_option_set_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgOptionVO.getProduct_option_style().isEmpty()){
                error.put(messageSource.getMessage("product_option_style","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgOptionDAO.insertOption(mgOptionVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/option-product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //옵션 선택
    @RequestMapping(value = "/Manager/selectOption", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectOption(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgOptionDAO.getOption(mgOptionVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //옵션 목록
    @RequestMapping(value = "/Manager/listOption", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> listOption(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            mgOptionVO.setDisplayRowCount(10);
            mgOptionVO.pageCalculate(mgOptionDAO.getOptionListCount(mgOptionVO));
            List<Map<String, Object>> optionList = mgOptionDAO.getOptionList(mgOptionVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",optionList);
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    
    //상품평 디테일
    @RequestMapping(value = "/Manager/reviewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> reviewDetail(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        
        try {
        	resultMap.put("review", mgReviewDAO.getReviewDetail(params));
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    
  //상품평 답변
    @RequestMapping(value = "/Manager/reviewAnswer", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> reviewAnswer(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        
        try {
        	mgReviewDAO.updateAnswer(params);
        	resultMap.put("success", "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
    
    //엑셀다운설정
    @RequestMapping(value = "/Manager/excel-setting-proc", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> insertExcelSetting(@RequestParam HashMap params, ExcelSettingVO excelSettingVO, HttpSession session){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	
    	try {
    		Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    		}
    		params.put("column_value",StringUtils.join(excelSettingVO.getColumn_value(),"`"));
    		params.put("column_name",StringUtils.join(excelSettingVO.getColumn_name(),"`"));
    		mgSystemDAO.insertExcelSetting(params);
    		resultMap.put("success", "success");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return resultMap;
    }
    
  //쿠폰등록
    @Transactional
    @RequestMapping(value = "/Manager/insertCoupon", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> insertCoupon(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, CouponVO couponVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        if(couponVO.getCoupon_name() == null || couponVO.getCoupon_name().equals("")){
            error.put(messageSource.getMessage("coupon_name","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getCoupon_ct() == null || couponVO.getCoupon_ct().equals("")){
            error.put(messageSource.getMessage("product_category","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getCoupon_sale_payment() == null &&
        		(couponVO.getCoupon_sale_rate() == null || couponVO.getCoupon_sale_rate().equals(""))){
                error.put(messageSource.getMessage("coupon_sale","ko"),messageSource.getMessage("error.required","ko"));
            }
        if(couponVO.getCoupon_valid_date_end() == null || couponVO.getCoupon_valid_date_end().equals("") ||
    		couponVO.getCoupon_valid_date_start() == null || couponVO.getCoupon_valid_date_start().equals("")){
            error.put(messageSource.getMessage("coupon_valid","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getCoupon_condition1().equals("T") && couponVO.getCoupon_issued_target_id() == null) {
        	error.put(messageSource.getMessage("coupon_target_id","ko"),messageSource.getMessage("error.required","ko"));
        }
        
        try {
        	if(couponVO.getCoupon_condition1().equals("next2")) {
        		couponVO.setCoupon_condition(couponVO.getCoupon_condition2());
        	}else if(couponVO.getCoupon_condition1().equals("next3")) {
        		couponVO.setCoupon_condition(couponVO.getCoupon_condition3());
        	}else {
        		couponVO.setCoupon_condition(couponVO.getCoupon_condition1());
        	}
        	couponVO.setCoupon_condition1(null);
        	couponVO.setCoupon_condition2(null);
        	couponVO.setCoupon_condition3(null);

        	if(couponVO.getCountry_supply() != null && !couponVO.getCountry_supply().equals("")) {
        		couponVO.setCountry_supply(couponVO.getCountry_supply().replace(",", "|"));
        	}
        	couponVO.setCoupon_cd(NumberGender.alphabetNumberGen(15, 1));
        	while(mgCouponDAO.checkDupCouponCD(couponVO.getCoupon_cd())){
        		couponVO.setCoupon_cd(NumberGender.alphabetNumberGen(15, 1));
        	}
        	
        	FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"coupon");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/coupon/"+ft.format(new Date())+"/");
            
            
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	fileVO.setParentPK(couponVO.getCoupon_cd()+"");
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    mgCouponDAO.deleteCouponFile(filelist,fileVO);
                    mgCouponDAO.insertCouponFile(filelist,fileVO);
                }
                if(params.get("fileName") == null || params.get("fileName").equals("")) {
                	fileVO.setFileorder(1);
                	mgCouponDAO.deleteCouponFile(fileVO);
                }
                mgCouponDAO.insertCoupon(couponVO);
                if(couponVO.getCoupon_condition().equals("T")) {
                	params.put("coupon_cd",couponVO.getCoupon_cd());
                	params.put("coupon_paid_user_id",couponVO.getCoupon_issued_target_id());
                	couponDAO.insertCoupon(params);
                }
                resultMap.put("success", "success");
                resultMap.put("redirectUrl", "/MyPage/Reviews");
            } 
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    
    //쿠폰수정
    @Transactional
    @RequestMapping(value = "/Manager/updateCoupon", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> updateCoupon(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, CouponVO couponVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        if(couponVO.getCoupon_name() == null || couponVO.getCoupon_name().equals("")){
            error.put(messageSource.getMessage("coupon_name","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getCoupon_sale_payment() == null &&
    		(couponVO.getCoupon_sale_rate() == null || couponVO.getCoupon_sale_rate().equals(""))){
            error.put(messageSource.getMessage("coupon_sale","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getCoupon_valid_date_end() == null || couponVO.getCoupon_valid_date_end().equals("") ||
    		couponVO.getCoupon_valid_date_start() == null || couponVO.getCoupon_valid_date_start().equals("")){
            error.put(messageSource.getMessage("coupon_valid","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getCoupon_ct() == null || couponVO.getCoupon_ct().equals("")){
            error.put(messageSource.getMessage("product_category","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getCoupon_condition1().equals("T") && couponVO.getCoupon_issued_target_id() == null) {
        	error.put(messageSource.getMessage("coupon_target_id","ko"),messageSource.getMessage("error.required","ko"));
        }
        
        try {
        	if(couponVO.getCoupon_condition1().equals("next2")) {
        		couponVO.setCoupon_condition(couponVO.getCoupon_condition2());
        	}else if(couponVO.getCoupon_condition1().equals("next3")) {
        		couponVO.setCoupon_condition(couponVO.getCoupon_condition3());
        	}else {
        		couponVO.setCoupon_condition(couponVO.getCoupon_condition1());
        	}
        	couponVO.setCoupon_condition1(null);
        	couponVO.setCoupon_condition2(null);
        	couponVO.setCoupon_condition3(null);

        	if(couponVO.getCountry_supply() != null && !couponVO.getCountry_supply().equals("")) {
        		couponVO.setCountry_supply(couponVO.getCountry_supply().replace(",", "|"));
        	}
        	
        	FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"coupon");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/coupon/"+ft.format(new Date())+"/");
            
            
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	fileVO.setParentPK(couponVO.getCoupon_cd()+"");
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    mgCouponDAO.deleteCouponFile(filelist,fileVO);
                    mgCouponDAO.insertCouponFile(filelist,fileVO);
                }
                if(params.get("fileName") == null || params.get("fileName").equals("")) {
                	fileVO.setFileorder(1);
                	mgCouponDAO.deleteCouponFile(fileVO);
                }
                mgCouponDAO.updateCoupon(couponVO);
                if(couponVO.getCoupon_condition().equals("T")) {
                	params.put("coupon_cd",couponVO.getCoupon_cd());
                	params.put("coupon_paid_user_id",couponVO.getCoupon_issued_target_id());
                	couponDAO.insertCoupon(params);
                }
                resultMap.put("success", "success");
                resultMap.put("redirectUrl", "/MyPage/Reviews");
            } 
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    
  //쿠폰일괄수정
    @Transactional
    @RequestMapping(value = "/Manager/updateCouponBatch", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> updateCouponBatch(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, CouponVO couponVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        if(couponVO.getBatch_coupon_valid_date_end() == null || couponVO.getBatch_coupon_valid_date_end().equals("") ||
    		couponVO.getBatch_coupon_valid_date_start() == null || couponVO.getBatch_coupon_valid_date_start().equals("")){
            error.put(messageSource.getMessage("coupon_valid","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(couponVO.getBatch_coupon_ct() == null || couponVO.getBatch_coupon_ct().equals("")){
            error.put(messageSource.getMessage("product_category","ko"),messageSource.getMessage("error.required","ko"));
        }
        
        try {
        	if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCouponDAO.updateCouponBatch(couponVO);
                resultMap.put("success", "success");
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }

    //qna detail
    @RequestMapping(value = "Manager/qnaDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> qnaDetail(@RequestParam HashMap params,QnaVO qnaVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            Map<String,Object>detail =qnaDAO.getQnaDetail(qnaVO);
            resultMap.put("detail", detail);
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //qna 답변
    @RequestMapping(value = "/Manager/qnaRewrite", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> qnaRewrite(@RequestParam HashMap params,QnaVO qnaVO,HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        Object adminLogin = session.getAttribute("adminLogin");
        try {
            if(qnaVO.getQna_rewrite_memo().isEmpty()){
                error.put(messageSource.getMessage("rewrite_memo","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(adminLogin == "admin"){
                qnaVO.setQna_rewrite_id("admin");
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                qnaDAO.updateQna(qnaVO);
                resultMap.put("redirectUrl", "/Manager/listQna");
            }

        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }

    //1:1 문의글 답변 메일전송
    @RequestMapping(value = "/Board/authemail", method = RequestMethod.GET, produces = "application/json")
    public HashMap<String, Object> Boardauthemail(@RequestParam HashMap params,UserVO userVO){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        String memo;
        String subject =  messageSource.getMessage("BoardauthemailTitle","ko");
        memo = (String)params.get("rememo");
        try {

            //이메일 필수 체크
            if(userVO.getEmail().isEmpty()){
                error.put("email", messageSource.getMessage("error.required","ko"));
            }
            

            //이메일 유효성검사
            String regex ="^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
            Boolean emailValidation = userVO.getEmail().matches(regex);


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                //중복이 아니면 메일전송
                mailSender.sendSimpleMessage(userVO.getEmail(), subject, memo);
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }

    //FAQ 상세보기
    @RequestMapping(value = "/Manager/BoardSelect" ,method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> boardSelect (SearchVO searchVO, ModelMap modelMap, HttpServletRequest request) throws Exception{
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{

            String brdno = request.getParameter("brdno");

            boardSvc.updateBoard8Read(brdno);
            BoardVO boardInfo = boardSvc.selectBoardOne(brdno);

            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(boardInfo.getBgno());
            if (bgInfo == null) {
                error.put("Error", "Error");
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("bgInfo",bgInfo);
                resultMap.put("boardInfo",boardInfo);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return resultMap;
    }
    //쿠폰상세
    @RequestMapping(value = "/Manager/getCouponDetail" ,method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> getCouponDetail (@RequestParam HashMap params,SearchVO searchVO, ModelMap modelMap, HttpServletRequest request) throws Exception{
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	try{
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			Map<String,Object> data = mgCouponDAO.getCouponDetail(params);
    			resultMap.put("coupon",data);
    		}
    		
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	
    	return resultMap;
    }
    //배너상세
    @RequestMapping(value = "/Manager/getBannerDetail" ,method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> getBannerDetail (@RequestParam HashMap params,SearchVO searchVO, ModelMap modelMap, HttpServletRequest request) throws Exception{
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	try{
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			Map<String,Object> data = bannerDAO.getBannerDetail(params);
    			resultMap.put("banner",data);
    		}
    		
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	
    	return resultMap;
    }
    
    //배너수정
    @Transactional
    @RequestMapping(value = "/Manager/updateBanner", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> updateBanner(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, CouponVO couponVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
        	
        	FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"banner");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/banner/"+ft.format(new Date())+"/");
            
            
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	fileVO.setParentPK(params.get("banner_id")+"");
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    bannerDAO.deleteBannerFile(filelist,fileVO);
                    bannerDAO.insertBannerFile(filelist,fileVO);
                }
                bannerDAO.updateBanner(params);
                resultMap.put("success", "success");
                resultMap.put("redirectUrl", "/Manager/banner");
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    //상품정보고시 등록
    @RequestMapping(value = "/Manager/insertDefinition", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> insertDefinition(@RequestParam HashMap params, HttpServletRequest request, HttpServletResponse response, HttpSession session, ProductVO productVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
        	//임시
        	params.put("store_id","admin");
        	
        	if(params.get("category1") == null || params.get("category1").equals("")){
                error.put(messageSource.getMessage("product_ct", "ko"), messageSource.getMessage("error.required","ko"));
            }
        	
        	if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
	        	if(params.get("category3") != null && !params.get("category3").equals("")) {
	        		params.put("product_ct",params.get("category3"));
	        	}else if(params.get("category2") != null && !params.get("category2").equals("")) {
	        		params.put("product_ct",params.get("category2"));
	        	}else {
	        		params.put("product_ct",params.get("category1"));
	        	}
	        	
	        	params.put("product_definition_key",productVO.getProduct_definition_key());
	        	params.put("product_definition_value",productVO.getProduct_definition_value());
	        	definitionDAO.insertDefinition(params);
            }
        } catch (Exception e) {
        	e.printStackTrace();
            resultMap.put("validateError",e);
        }
        return resultMap;
    }
  //상품정보고시 수정
    @RequestMapping(value = "/Manager/updateDefinition", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> updateDefinition(@RequestParam HashMap params, HttpServletRequest request, HttpServletResponse response, HttpSession session,ProductVO productVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
        	//임시
        	params.put("store_id","admin");
        	
        	if(params.get("category1") == null || params.get("category1").equals("")){
                error.put(messageSource.getMessage("product_ct", "ko"), messageSource.getMessage("error.required","ko"));
            }
        	
        	if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
	        	if(params.get("category3") != null && !params.get("category3").equals("")) {
	        		params.put("product_ct",params.get("category3"));
	        	}else if(params.get("category2") != null && !params.get("category2").equals("")) {
	        		params.put("product_ct",params.get("category2"));
	        	}else {
	        		params.put("product_ct",params.get("category1"));
	        	}
        	
	        	params.put("product_definition_key",productVO.getProduct_definition_key());
	        	params.put("product_definition_value",productVO.getProduct_definition_value());
            	definitionDAO.updateDefinition(params);
            }
        } catch (Exception e) {
        	e.printStackTrace();
            resultMap.put("validateError",e);
        }
        return resultMap;
    }
    //상품정보고시 선택
    @RequestMapping(value = "/Manager/definitionDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> definitionDetail(@RequestParam HashMap params, HttpServletRequest request, HttpServletResponse response, HttpSession session){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	try {
    		Map<String,Object> list = definitionDAO.getDefinitionDetail(params);
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			resultMap.put("list",list);
    		}
    	} catch (Exception e) {
    		resultMap.put("e", e);
    	}
    	return resultMap;
    }
    
    //바로빌 세금계산서 발행
  	@RequestMapping(value = "/api/taxInvoice", method = RequestMethod.POST, produces = "application/json")
  	public HashMap<String, Object> taxInvoice(@RequestParam HashMap params, HttpServletRequest request,
  			HttpSession session, TaxVO taxVO) {
  		HashMap<String, Object> resultMap = new HashMap<String, Object>();
  		HashMap<String, Object> error = new HashMap<String, Object>();
  		
  		if (taxVO.getCorp_num() == null || taxVO.getCorp_num().equals("")) {
  			error.put(messageSource.getMessage("corp_num", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getCeo_name() == null || taxVO.getCeo_name().equals("")) {
  			error.put(messageSource.getMessage("ceo_name", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getAddr() == null || taxVO.getAddr().equals("")) {
  			error.put(messageSource.getMessage("roadAddress", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		
  		
  		try {
  			if (!isEmpty(error)) {
  				resultMap.put("validateError", error);
  			} else {
  				/*
  				int resultCode = RegistAndIssueTaxInvoice(taxVO);
  				if(resultCode == 1) {
  					resultMap.put("success","success");
  				}else {
  					error.put("Error", "ERROR CODE: "+resultCode);
  					resultMap.put("validateError", error);
  				}
  				*/
  				paymentDAO.insertStoreTaxinvoiceHistory(taxVO);
  				resultMap.put("success","success");
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  			resultMap.put("e", e);
  		}
  		return resultMap;
  	}
 /*
  	 //바로빌 세금계산서 신청
  	@RequestMapping(value = "/api/taxInvoice2", method = RequestMethod.POST, produces = "application/json")
  	public HashMap<String, Object> taxInvoice2(@RequestParam HashMap params, HttpServletRequest request,
  			HttpSession session, TaxVO taxVO, PaymentDAO paymentDAO) {
  		HashMap<String, Object> resultMap = new HashMap<String, Object>();
  		HashMap<String, Object> error = new HashMap<String, Object>();
  		//List<Map<String,Object>> storeInvoiceList = paymentDAO.getStoreInvoiceList(params);
  		
  		if (taxVO.getCorp_num() == null || taxVO.getCorp_num().equals("")) {
  			error.put(messageSource.getMessage("corp_num", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getCeo_name() == null || taxVO.getCeo_name().equals("")) {
  			error.put(messageSource.getMessage("ceo_name", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getAddr() == null || taxVO.getAddr().equals("")) {
  			error.put(messageSource.getMessage("roadAddress", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		
  		
  		try {
  			if (!isEmpty(error)) {
  				resultMap.put("validateError", error);
  			} else {
  				
  				int resultCode = RegistAndIssueTaxInvoice(taxVO);
  				if(resultCode == 1) {
  					resultMap.put("success","success");
  				}else {
  					error.put("Error", "ERROR CODE: "+resultCode);
  					resultMap.put("validateError", error);
  				}
  				
  				paymentDAO.insertStoreTaxinvoiceHistory(taxVO);
  				resultMap.put("success","success");
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  			resultMap.put("e", e);
  		}
  		return resultMap;
  	}
  	*/
    //바로빌 세금계산서 승인
  	@RequestMapping(value = "/api/taxInvoiceApply", method = RequestMethod.POST, produces = "application/json")
  	public HashMap<String, Object> taxInvoiceApply(@RequestParam HashMap params, HttpServletRequest request,
  			HttpSession session, TaxVO taxVO) {
  		HashMap<String, Object> resultMap = new HashMap<String, Object>();
  		HashMap<String, Object> error = new HashMap<String, Object>();
  		
  		
  	//	taxVO.setReg_date("20200812");
  		
  		if (taxVO.getCorp_num() == null || taxVO.getCorp_num().equals("")) {
  			error.put(messageSource.getMessage("corp_num", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getCeo_name() == null || taxVO.getCeo_name().equals("")) {
  			error.put(messageSource.getMessage("ceo_name", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getAddr() == null || taxVO.getAddr().equals("")) {
  			error.put(messageSource.getMessage("roadAddress", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		
  		try {
  			if (!isEmpty(error)) {
  				resultMap.put("validateError", error);
  			} else {
  				
  			
  				paymentDAO.insertStoreTaxinvoiceHistory(taxVO);
  				resultMap.put("success","success");
  				
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  			resultMap.put("e", e);
  		}
  		return resultMap;
  	}
  	@RequestMapping(value = "/api/taxInvoiceApplyzero", method = RequestMethod.POST, produces = "application/json")
  	public HashMap<String, Object> taxInvoiceApplyzero(@RequestParam HashMap params, HttpServletRequest request,
  			HttpSession session, TaxVO taxVO) {
  		HashMap<String, Object> resultMap = new HashMap<String, Object>();
  		HashMap<String, Object> error = new HashMap<String, Object>();
  		

  		
  		if (taxVO.getCorp_num() == null || taxVO.getCorp_num().equals("")) {
  			error.put(messageSource.getMessage("corp_num", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getCeo_name() == null || taxVO.getCeo_name().equals("")) {
  			error.put(messageSource.getMessage("ceo_name", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getAddr() == null || taxVO.getAddr().equals("")) {
  			error.put(messageSource.getMessage("roadAddress", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		
  		try {
  			if (!isEmpty(error)) {
  				resultMap.put("validateError", error);
  			} else {
  				
  			
  				paymentDAO.insertStoreTaxinvoiceHistory(taxVO);
  				resultMap.put("success","success");
  				
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  			resultMap.put("e", e);
  		}
  		return resultMap;
  	}
    //바로빌 세금계산서 발행
  	@RequestMapping(value = "/api/taxInvoice3", method = RequestMethod.POST, produces = "application/json")
  	public HashMap<String, Object> taxInvoice3(@RequestParam HashMap params, HttpServletRequest request,
  			HttpSession session, TaxVO taxVO) {
  		HashMap<String, Object> resultMap = new HashMap<String, Object>();
  		HashMap<String, Object> error = new HashMap<String, Object>();
  		
  		// 테스트시 아래 주석 풀고  현재 날짜로 입력 
  		//taxVO.setReg_date("20200813");
  		//taxVO.setPurchaseExpiry("20200813");
  		//-------------------------------
  		if (taxVO.getCorp_num() == null || taxVO.getCorp_num().equals("")) {
  			error.put(messageSource.getMessage("corp_num", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getCeo_name() == null || taxVO.getCeo_name().equals("")) {
  			error.put(messageSource.getMessage("ceo_name", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		if (taxVO.getAddr() == null || taxVO.getAddr().equals("")) {
  			error.put(messageSource.getMessage("roadAddress", "ko"), messageSource.getMessage("error.required", "ko"));
  		}
  		
  		try {
  			if (!isEmpty(error)) {
  				resultMap.put("validateError", error);
  			} else {
  				int resultCode = RegistAndIssueTaxInvoice(taxVO);
  				String resultCodeS = Integer.toString(resultCode);
  	/*			if(resultCode ==-10002) {*/
  				if(resultCode ==1) {
  					resultMap.put("success","success");
  					taxVO.setTaxinvoice_status("Y");
  					taxVO.setResult_code(resultCodeS);
  					paymentDAO.updateStoreTaxinvoiceHistory(taxVO);
  				}else {
  					error.put("Error", "ERROR CODE: "+resultCode);
  					resultMap.put("validateError", error);
  				}
  			
  				paymentDAO.insertTaxinvoiceHistory(taxVO);
  				
  				
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  			resultMap.put("e", e);
  		}
  		return resultMap;
  	}
 	@RequestMapping(value = "/api/notSend", method = RequestMethod.POST, produces = "application/json")
  	public HashMap<String, Object> notSend(@RequestParam HashMap params, HttpServletRequest request,
  			HttpSession session, TaxVO taxVO) {
  		HashMap<String, Object> resultMap = new HashMap<String, Object>();
  		HashMap<String, Object> error = new HashMap<String, Object>();
  		
  		try {
  			if (!isEmpty(error)) {
  				resultMap.put("validateError", error);
  			} else {
  				
  					taxVO.setTaxinvoice_status("F");
  					paymentDAO.updateStoreTaxinvoiceHistory(taxVO);
  					
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  			resultMap.put("e", e);
  		}
  		return resultMap;
  	}
 
  	
  	//세금계산서 국세청전송
  	public int RegistAndIssueTaxInvoice(TaxVO taxVO) throws RemoteException, MalformedURLException {

		String certKey = barobillKey;                                //인증키

		TaxInvoice taxInvoice = new TaxInvoice();

		taxInvoice.setIssueDirection(1);                    //1-정발행, 2-역발행(위수탁 세금계산서는 정발행만 허용)
		taxInvoice.setTaxInvoiceType(1);                    //1-세금계산서, 2-계산서, 4-위수탁세금계산서, 5-위수탁계산서

		//-------------------------------------------
		//과세형태
		//-------------------------------------------
		//TaxInvoiceType 이 1,4 일 때 : 1-과세, 2-영세
		//TaxInvoiceType 이 2,5 일 때 : 3-면세
		//-------------------------------------------
		taxInvoice.setTaxType(taxVO.getTax_type());

		taxInvoice.setTaxCalcType(1);                        //세율계산방법 : 1-절상, 2-절사, 3-반올림
		taxInvoice.setPurposeType(taxVO.getPurpose_type());                        //1-영수, 2-청구

		//-------------------------------------------
		//수정사유코드
		//-------------------------------------------
		//공백-일반세금계산서, 1-기재사항의 착오 정정, 2-공급가액의 변동, 3-재화의 환입, 4-계약의 해제, 5-내국신용장 사후개설, 6-착오에 의한 이중발행
		//-------------------------------------------
		taxInvoice.setModifyCode("");

		taxInvoice.setKwon(taxVO.getKwon());                                //별지서식 11호 상의 [권] 항목
		taxInvoice.setHo(taxVO.getHo());                                //별지서식 11호 상의 [호] 항목
		taxInvoice.setSerialNum(taxVO.getSerial_num());                        //별지서식 11호 상의 [일련번호] 항목

		//-------------------------------------------
		//공급가액 총액
		//-------------------------------------------
		taxInvoice.setAmountTotal(taxVO.getAmount_total());

		//-------------------------------------------
		//세액합계
		//-------------------------------------------
		//taxInvoice.TaxType 이 2 또는 3 으로 셋팅된 경우 0으로 입력
		//-------------------------------------------
		taxInvoice.setTaxTotal(taxVO.getTax_total());

		//-------------------------------------------
		//합계금액
		//-------------------------------------------
		//공급가액 총액 + 세액합계 와 일치해야 합니다.
		//-------------------------------------------
		taxInvoice.setTotalAmount(taxVO.getTotal_amount());

		taxInvoice.setCash("");                                //현금
		taxInvoice.setChkBill("");                            //수표
		taxInvoice.setNote("");                                //어음
		taxInvoice.setCredit("");                            //외상미수금

		taxInvoice.setRemark1(taxVO.getInvoicee_party_type().equals("foreigner") ? taxVO.getCorp_num() : "");
		taxInvoice.setRemark2(taxVO.getRemark1());
		taxInvoice.setRemark3("");

		taxInvoice.setWriteDate(taxVO.getReg_date());                        //작성일자 (YYYYMMDD), 공백입력 시 Today로 작성됨.

		//-------------------------------------------
		//공급자 정보 - 정발행시 세금계산서 작성자
		//-------------------------------------------
		Date now = new Date();

        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
        String curDate = format.format(now);
        String mgtNum = "T" + curDate + "R" +numberGender.numberGen(5, 1);
        taxVO.setMgt_num(mgtNum);

		taxInvoice.setInvoicerParty(new InvoiceParty());

		taxInvoice.getInvoicerParty().setMgtNum(mgtNum);        //필수입력 - 연동사부여 문서키
		taxInvoice.getInvoicerParty().setCorpNum(barobillCorpNum);        //필수입력 - 연계사업자 사업자번호 ('-' 제외, 10자리)
		taxInvoice.getInvoicerParty().setTaxRegID("");						//종사업장번호
		taxInvoice.getInvoicerParty().setCorpName(barobillCorpName);        //필수입력
		taxInvoice.getInvoicerParty().setCEOName(barobillCeoName);        //필수입력
		taxInvoice.getInvoicerParty().setAddr(barobillAddr);				//사업장주소
		taxInvoice.getInvoicerParty().setBizType(barobillBizType);			//업종
		taxInvoice.getInvoicerParty().setBizClass(barobillBizClass);		//업태
		taxInvoice.getInvoicerParty().setContactID(barobillContactId);        //필수입력 - 담당자 바로빌 아이디
		taxInvoice.getInvoicerParty().setContactName(barobillContactName);    //필수입력
		taxInvoice.getInvoicerParty().setTEL(barobillTel);					//담당자전화번호
		taxInvoice.getInvoicerParty().setHP(barobillHp);					//담당자핸드폰
		taxInvoice.getInvoicerParty().setEmail(barobillEmail);            //필수입력

		//-------------------------------------------
		//공급받는자 정보 - 역발행시 세금계산서 작성자
		//-------------------------------------------
		taxInvoice.setInvoiceeParty(new InvoiceParty());

		taxInvoice.getInvoiceeParty().setCorpNum(taxVO.getInvoicee_party_type().equals("foreigner") ? "9999999999999" : taxVO.getCorp_num());        //필수입력
		taxInvoice.getInvoiceeParty().setTaxRegID("");
		taxInvoice.getInvoiceeParty().setCorpName(taxVO.getInvoicee_party_type().equals("corp") ? taxVO.getCorp_name() : taxVO.getCeo_name());        //필수입력
		taxInvoice.getInvoiceeParty().setCEOName(taxVO.getCeo_name());        //필수입력
		taxInvoice.getInvoiceeParty().setAddr(taxVO.getAddr());
		taxInvoice.getInvoiceeParty().setBizType(taxVO.getBiz_type());
		taxInvoice.getInvoiceeParty().setBizClass(taxVO.getBiz_class());
		taxInvoice.getInvoiceeParty().setContactID("");
		taxInvoice.getInvoiceeParty().setContactName(taxVO.getInvoicee_party_type().equals("corp") ? taxVO.getCorp_name() : taxVO.getCeo_name());    //필수입력
		taxInvoice.getInvoiceeParty().setTEL("");
		taxInvoice.getInvoiceeParty().setHP("");
		taxInvoice.getInvoiceeParty().setEmail(taxVO.getEmail());

		//-------------------------------------------
		//수탁자 정보 - 입력하지 않음
		//-------------------------------------------
		taxInvoice.setBrokerParty(new InvoiceParty());

		taxInvoice.getBrokerParty().setCorpNum("");
		taxInvoice.getBrokerParty().setTaxRegID("");
		taxInvoice.getBrokerParty().setCorpName("");
		taxInvoice.getBrokerParty().setCEOName("");
		taxInvoice.getBrokerParty().setAddr("");
		taxInvoice.getBrokerParty().setBizType("");
		taxInvoice.getBrokerParty().setBizClass("");
		taxInvoice.getBrokerParty().setContactID("");
		taxInvoice.getBrokerParty().setContactName("");
		taxInvoice.getBrokerParty().setTEL("");
		taxInvoice.getBrokerParty().setHP("");
		taxInvoice.getBrokerParty().setEmail("");

		//-------------------------------------------
		//품목
		//-------------------------------------------
		ArrayOfTaxInvoiceTradeLineItem arrayOfTaxInvoiceTradeLineItem = new ArrayOfTaxInvoiceTradeLineItem();

		for (int i = 0; i <taxVO.getPurchaseExpiry().split(",",-1).length; i++) {
			TaxInvoiceTradeLineItem taxInvoiceTradeLineItem = new TaxInvoiceTradeLineItem();
			taxInvoiceTradeLineItem.setPurchaseExpiry(taxVO.getPurchaseExpiry().split(",",-1)[i]);        //YYYYMMDD
			taxInvoiceTradeLineItem.setName(taxVO.getName().split(",",-1)[i]);
			taxInvoiceTradeLineItem.setInformation(taxVO.getInfomation().split(",",-1)[i]);
			taxInvoiceTradeLineItem.setChargeableUnit(taxVO.getChargeableUnit().split(",",-1)[i]);
			taxInvoiceTradeLineItem.setUnitPrice(taxVO.getUnitPrice().split(",",-1)[i]);
			taxInvoiceTradeLineItem.setAmount(taxVO.getAmount().split(",",-1)[i]);
			taxInvoiceTradeLineItem.setTax(taxVO.getTax().split(",",-1)[i]);
			taxInvoiceTradeLineItem.setDescription(taxVO.getDescription().split(",",-1)[i]);

			arrayOfTaxInvoiceTradeLineItem.getTaxInvoiceTradeLineItem().add(taxInvoiceTradeLineItem);
		}

		taxInvoice.setTaxInvoiceTradeLineItems(arrayOfTaxInvoiceTradeLineItem);

		//-------------------------------------------

		boolean sendSms = false;                        //문자 발송여부 (공급받는자 정보의 HP 항목이 입력된 경우에만 발송됨)

		boolean forceIssue = false;                        //가산세가 예상되는 세금계산서 발행 여부

		String mailTitle = "";                            //전송되는 이메일의 제목 설정 (공백 시 바로빌 기본 제목으로 전송됨)

		//-------------------------------------------
		//테스트시 TESTBED 주석 풀기 
		BarobillApiService barobillApiService = new BarobillApiService(BarobillApiProfile.RELEASE);
		//BarobillApiService barobillApiService = new BarobillApiService(BarobillApiProfile.TESTBED);
		int result = barobillApiService.taxInvoice.registAndIssueTaxInvoice(certKey, taxInvoice.getInvoicerParty().getCorpNum(), taxInvoice, sendSms, forceIssue, mailTitle);

		System.out.println(result);
		taxVO.setResult_code(String.valueOf(result));
		return result;
	}
  //폼의 메서드가 GET인지 POST 인지 꼭 확인 
    @RequestMapping(value = "/Manager/managerPasswordChange", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerPassCheck(@RequestParam HashMap params, UserVO userVO, StoreVO storeVO,HttpSession session) throws Exception{
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
        	 if(userVO.getPassword().isEmpty()){
                 error.put("password", "기존비밀번호는 필수 항목입니다.");
             }
        	 if(userVO.getNewpassword().isEmpty()){
                 error.put("newpassword", "신규 비밀번호는 필수 항목입니다.");
             }
        	 if(userVO.getRenewpassword().isEmpty()){
                 error.put("renewpassword", "신규 비밀번호 확인은 필수 항목입니다.");
             }
			 if(!userVO.getRenewpassword().equals(userVO.getNewpassword())){
				 error.put("renewpassword", "비밀번호가 일치하지않습니다.");
			 }
            //이메일 필수 체크
 	    	params.put("email", session.getAttribute("email"));
	    	params.put("password", null);
	    	 
	    	 Map<String, Object> userData= userDAO.getUserStoreList(params);
	  
	        //입력한 비밀번호와 직접 입력한 비밀번호 일치 확인 
 	        if(!passwordEncoder.matches(userVO.getPassword(),(String)userData.get("password"))){
	            error.put("password", "계정정보가 일치하지 않습니다.");
	        }
	        
	 	    
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	userVO.setEmail((String)session.getAttribute("email"));
            	
            	storeVO.setStore_id((String)session.getAttribute("email"));
            	if(userVO.getNewpassword() != null && !userVO.getNewpassword().equals("")) {
            		userVO.setNewpassword(passwordEncoder.encode(userVO.getNewpassword()));
            	}
            	
	            		userDAO.updateManagerPassword(userVO);
            	
	            		userDAO.updateStoreManagerPassword(userVO);
            	resultMap.put("success", true);
                resultMap.put("redirectUrl","/managerLayout/managerFooter");
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    @RequestMapping(value = "/Manager/storeInfoModi", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreInfoModi(StoreVO storeVO, FileVO fileVO,BoardVO boardInfo,HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
        	 FileUtil fs = new FileUtil();
             List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
             SimpleDateFormat ft = new SimpleDateFormat("yyyy");
             fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");
              //fileVO.setParentPK(storeVO.getStore_id());
             if(!isEmpty(error)){
                 resultMap.put("validateError",error);
             }else{ 
            	 fileVO.setParentPK((String)session.getAttribute("email"));
            	 fileVO.setParentPK((String)session.getAttribute("email"));
	             storeVO.setStore_id((String)session.getAttribute("email"));
	          	 fileVO.setFileorder(1);
	              if(!isEmpty(filelist)){
	            	 Integer count =storeInfoDAO.selectfileInfo(storeVO);
	            	  storeVO.getFileName();
	            	  
	                // productVO.setProduct_cd(storeVO.getStore_id());
	                // mgStoreDAO.deleteProductFile(productVO);
	            	  if(count==0) {
	            		  storeInfoDAO.insertProductFile1(filelist,fileVO);
	            	  }else {
	            		  storeInfoDAO.updateStoreFile(filelist,fileVO);
	            	  }
	            	 resultMap.put("redirectUrl","/Manager/storeInfo");
	            	  
              }
        	 // storeInfoDAO.getStoreInfo(storeVO);
	          storeVO.setStore_id((String)session.getAttribute("email"));
        	  storeInfoDAO.updateStoreInfo(storeVO);
              resultMap.put("redirectUrl","/Manager/storeInfo");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    @RequestMapping(value = "/Manager/managerChk3mth", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerChk3mth(@RequestParam HashMap params,StoreVO storeVO, FileVO fileVO,BoardVO boardInfo,HttpSession session){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        
        try {
            //이메일 필수 체크
        	params.put("email", session.getAttribute("email"));
	    	//params.put("password", null);
	    	 
	    	 Map<String, Object> userData= userDAO.getUserStoreList(params);
	    //	 SimpleDateFormat getMonth = new SimpleDateFormat("M");
	  
	    	 	resultMap.put("info",userData);
            	resultMap.put("success", true);
                resultMap.put("redirectUrl","/manager/managerMain");
            
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }

    
    //상품제안등록
    @Transactional
    @RequestMapping(value = "/Manager/insertProposal", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> insertProposal(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, CouponVO couponVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        
        if(params.get("product_name") == null || params.get("product_name").equals("")){
            error.put(messageSource.getMessage("product_name","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(params.get("product_cd") == null || params.get("product_cd").equals("")){
            error.put(messageSource.getMessage("product_cd","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(params.get("target_store_id") == null || params.get("target_store_id").equals("")){
        	error.put(messageSource.getMessage("target_store_id","ko"),messageSource.getMessage("error.required","ko"));
        }
        if(params.get("proposal_fee") == null || params.get("proposal_fee").equals("")){
        	error.put(messageSource.getMessage("proposal_fee","ko"),messageSource.getMessage("error.required","ko"));
        }
        
        try {
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	Object adminLogin = session.getAttribute("adminLogin");
                String email = (String)session.getAttribute("email");
            	if(adminLogin.equals("admin")){
            		params.put("store_id","admin");
        		}else {
        			params.put("store_id",email);
        		}
            	mgProductDAO.insertProductProposal(params);
            	
                resultMap.put("success", "success");
                resultMap.put("redirectUrl", "/Manager/product-proposal");
            } 
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }
    
    //상품제안수정
    @Transactional
    @RequestMapping(value = "/Manager/updateProposal", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> updateProposal(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, CouponVO couponVO, BoardVO boardInfo, FileVO fileVO){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	
    	if(params.get("accept_yn") != null && params.get("accept_yn").equals("Y")) {
    		error.put("Error",messageSource.getMessage("error.proposal_accept", "ko"));
    	}
    	if(params.get("product_name") == null || params.get("product_name").equals("")){
    		error.put(messageSource.getMessage("product_name","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	if(params.get("product_cd") == null || params.get("product_cd").equals("")){
    		error.put(messageSource.getMessage("product_cd","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	if(params.get("target_store_id") == null || params.get("target_store_id").equals("")){
    		error.put(messageSource.getMessage("target_store_id","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	if(params.get("proposal_fee") == null || params.get("proposal_fee").equals("")){
    		error.put(messageSource.getMessage("proposal_fee","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	
    	try {
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			Object adminLogin = session.getAttribute("adminLogin");
                String email = (String)session.getAttribute("email");
            	if(adminLogin.equals("admin")){
            		params.put("store_id","admin");
        		}else {
        			params.put("store_id",email);
        		}
            	
    			mgProductDAO.updateProductProposal(params);
    			
    			resultMap.put("success", "success");
    			resultMap.put("redirectUrl", "/Manager/product-proposal");
    		} 
    	} catch (Exception e) {
    		resultMap.put("e", e);
    	}
    	return resultMap;
    }
    
    //상품제안수락
    @Transactional
    @RequestMapping(value = "/Manager/acceptProposal", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> acceptProposal(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, CouponVO couponVO, BoardVO boardInfo, FileVO fileVO){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	
    	if(params.get("product_name") == null || params.get("product_name").equals("")){
    		error.put(messageSource.getMessage("product_name","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	if(params.get("product_cd") == null || params.get("product_cd").equals("")){
    		error.put(messageSource.getMessage("product_cd","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	if(params.get("target_store_id") == null || params.get("target_store_id").equals("")){
    		error.put(messageSource.getMessage("target_store_id","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	if(params.get("proposal_fee") == null || params.get("proposal_fee").equals("")){
    		error.put(messageSource.getMessage("proposal_fee","ko"),messageSource.getMessage("error.required","ko"));
    	}
    	
    	try {
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			params.put("accept_yn", "Y");
    			mgProductDAO.acceptProductProposal(params);
    			
    			resultMap.put("success", "success");
    			resultMap.put("redirectUrl", "/Manager/product-proposal");
    		} 
    	} catch (Exception e) {
    		resultMap.put("e", e);
    	}
    	return resultMap;
    }
    
    //상품제안상세
    @RequestMapping(value = "/Manager/getProposalDetail" ,method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> getProposalDetail (@RequestParam HashMap params,SearchVO searchVO, ModelMap modelMap, HttpServletRequest request,HttpSession session) throws Exception{
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	try{
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			Object adminLogin = session.getAttribute("adminLogin");
                String email = (String)session.getAttribute("email");
            	if(adminLogin.equals("admin")){
            		email = "admin";
        		}
            	
    			Map<String,Object> data = mgProductDAO.getProposalDetail(params);
    			resultMap.put("proposal",data);
    			if(data.get("store_id").equals(email)) {
    				resultMap.put("mySelf",true);
    			}
    		}
    		
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	
    	return resultMap;
    }
}
