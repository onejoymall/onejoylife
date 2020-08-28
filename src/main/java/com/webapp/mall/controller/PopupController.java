package com.webapp.mall.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.ReviewDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.QnaVO;
import com.webapp.mall.vo.UserVO;
import com.webapp.manager.dao.QnaDAO;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.bouncycastle.math.raw.Mod;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static org.springframework.util.CollectionUtils.isEmpty;
@Controller
public class PopupController {
    @Value("${t_key}")
    private String t_key;
    @Value("${t_url}")
    private String t_url;
    @Value("${kakaoClientId}")
    private String kakaoClientId;
    @Value("${kakaoRedirectUri}")
    private String kakaoRedirectUri;
    @Autowired
    UserDAO userDAO;
    @Autowired
    DeliveryDAO deliveryDAO;
    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    ReviewDAO reviewDAO;
    @Autowired
    QnaDAO qnaDAO;

    IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;
    
    @RequestMapping("/Popup/DeliverySearch")
    public String mallDeliverySearch(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO, DeliveryInfoVO deliveryInfoVO) throws Exception {
        deliveryInfoVO.setDelivery_t_key(t_key);
        deliveryInfoVO.setDelivery_t_url(t_url);
        Map<String,Object> delivery = paymentDAO.getMgPaymentBundleDetail(params);
        deliveryInfoVO.setDelivery_t_code((String)delivery.get("delivery_t_code"));
        deliveryInfoVO.setDelivery_t_invoice((String)delivery.get("delivery_t_invoice"));
        //택배사목록
		Map<String, Object> companylist = CurlPost.curlPostFn(
			deliveryInfoVO.getDelivery_t_url()
					+"/api/v1/companylist?t_key="+deliveryInfoVO.getDelivery_t_key(),
			"",
			"",
			"get"
		);
		List<Map<String,Object>> company = (List)companylist.get("Company");
		if(!isEmpty(company)){
			deliveryDAO.insertDeliveryCompany(company);
		}
		List<Map<String,Object>> resultCompay = deliveryDAO.getDeliveryCompanyList(params);
		model.addAttribute("companyList", resultCompay);

        Map<String, Object> postToken = CurlPost.curlPostFn(
                deliveryInfoVO.getDelivery_t_url()
                +"/api/v1/trackingInfo?t_key="+deliveryInfoVO.getDelivery_t_key()
                +"&t_code="+deliveryInfoVO.getDelivery_t_code()
                +"&t_invoice="+deliveryInfoVO.getDelivery_t_invoice(),
                "",
                "",
                "get"
        );
        model.addAttribute("deliveryInfoVO",deliveryInfoVO);
//        model.addAttribute("companyList",company);
        model.addAttribute("style", "mypage-6-mo");
        model.addAttribute("list",postToken);
        return "popup/deliverySearch";
    }
    @RequestMapping(value = "/Popup/kakao" , produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
    public String mallKakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpSession session, Map params, UserVO userVO) throws Exception{
        Object siteUrl = request.getRequestURL().toString().replace(request.getRequestURI(),"");
        Map<String, Object> kakaoMap = CurlPost.getAccessToken(code,siteUrl,kakaoClientId,kakaoRedirectUri);
        try {
            if(!isEmpty(kakaoMap)){
                if ( session.getAttribute("login") != null ){
                    // 기존에 login이란 세션 값이 존재한다면
                    session.removeAttribute("login"); // 기존값을 제거해 준다.
                    //기존 로그인 세션을 로그아웃후 다시 sns 로그인 할지여부 협의
                    //로그인 기록 저장
                    userVO.setLog_type("snslogin");
                    userDAO.insertUserHistory(userVO);
                }
                session.setAttribute("login", true);
                session.setAttribute("token", kakaoMap.get("token_type")+" "+kakaoMap.get("access_token"));

                //로그인 사용자 정보 획득
                Map<String,Object> kakaoUserMap = CurlPost.getKakaoUserInfo(kakaoMap);
                if(!isEmpty(kakaoUserMap)){
                    Map<String,Object> kakaoUserAccount = (Map<String,Object>)kakaoUserMap.get("kakao_account");
                    session.setAttribute("email", kakaoUserAccount.get("email"));

                    params.put("email", kakaoUserAccount.get("email"));
                    userDAO.insertSnsUser(params);
                    //로그인 기록 저장
                    userVO.setLog_type("snslogin");
                    userVO.setEmail((String)kakaoUserAccount.get("email"));
                    userDAO.insertUserHistory(userVO);
                }


            }
        }catch (Exception e){
            e.printStackTrace();
        }
       return "popup/kakaologin";
    }
    //상품문의 작성 팝업
    @RequestMapping("/Popup/write-qna")
    public String writerQna(@RequestParam HashMap params, ModelMap model, HttpServletRequest request) throws Exception {
        try {
//            model.addAttribute("productDetail",PaymentDAO.getPaymentDetail(params));
        }catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("style", "write-qna");
        Device device = DeviceUtils.getCurrentDevice(request);
    	if(device.isMobile()){
            return "mobile/popup/write-qna";
        } else {
		    return "popup/write-qna";
	    }
    }
    //상품문의Q&A 수정 팝업
    @RequestMapping("/Popup/update-qna")
    public String updateQna(ModelMap model, QnaVO qnaVO, HttpServletRequest request) throws Exception {
        try {
        	 Map<String,Object>detail =qnaDAO.getQnaDetail(qnaVO);
             //resultMap.put("detail", detail);
            model.addAttribute("detail",detail);
        }catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("style", "write-qna");
        Device device = DeviceUtils.getCurrentDevice(request);
    	if(device.isMobile()){
            return "mobile/popup/update-qna";
        } else {
		    return "popup/update-qna";
	    }

    }

    //리뷰작성
    @RequestMapping("/Popup/review-write")
    public String writeReview(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO) throws Exception {
    	try {
    		model.addAttribute("productDetail",paymentDAO.getMgPaymentBundleDetail(params));
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	model.addAttribute("style", "write-review");
    	Device device = DeviceUtils.getCurrentDevice(request);
    	if(device.isMobile()){
            return "mobile/popup/review-write";
        } else {
        	return "popup/review-write";
        }
    }
    
    //리뷰 수정
    @RequestMapping("/Popup/review-update")
    public String updateReview(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		params.put("email",session.getAttribute("email"));
    		//로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(!isEmpty(userInfo)){
                params.put("usr_id",userInfo.get("usr_id"));
            }
    		model.addAttribute("review",reviewDAO.getReviewDetail(params));
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	model.addAttribute("style", "write-review");
    	Device device = DeviceUtils.getCurrentDevice(request);
    	if(device.isMobile()){
            return "mobile/popup/review-update";
        } else {
        	return "popup/review-update";
        }
    }
    
    //원천징수영수증
    @RequestMapping("/Popup/withholding")
    public String withholding(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		params.put("email",session.getAttribute("email"));
    		//로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(!isEmpty(userInfo)){
                params.put("usr_id",userInfo.get("usr_id"));
            }
            //경품 결제정보
            Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	model.addAttribute("style", "tax-bill");
    	return "popup/tax-withholding";
    }
    
    //현금영수증신청
    @RequestMapping("/Popup/cashReceipt")
    public String cashReceipt(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		params.put("email",session.getAttribute("email"));
    		//로그인 확인
    		Map<String,Object> userInfo = userDAO.getLoginUserList(params);
    		if(!isEmpty(userInfo)){
    			params.put("usr_id",userInfo.get("usr_id"));
    		}

    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "cash-receipts");
    	return "popup/cash-receipts";
    }
    
    //매출전표
    @RequestMapping("/Popup/salesStatement")
    public String salesStatement(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		params.put("email",session.getAttribute("email"));
    		//로그인 확인
    		Map<String,Object> userInfo = userDAO.getLoginUserList(params);
    		if(!isEmpty(userInfo)){
    			params.put("usr_id",userInfo.get("usr_id"));
    		}

    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		
    		client = new IamportClient(apiKey, apiSecret);
			String token = client.getAuth().getResponse().getToken();
			
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost("https://api.iamport.kr/payments/"+paymentDetail.get("imp_uid"));
			post.addHeader("Authorization",token);
			
			HttpResponse restResponse = client.execute(post);
			
			String content = EntityUtils.toString(restResponse.getEntity());
			
			if(restResponse.getStatusLine().getStatusCode() == 200) {
				model.addAttribute("impPayment",new JSONObject(content).toMap().get("response"));
			}
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "mypage-4-1-2(4)");
    	return "popup/sales-statement";
    }
    
    //거래명세서
    @RequestMapping("/Popup/transactionStatement")
    public String transactionStatement(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
    		Map<String,Object> userInfo = userDAO.getUserForId(paymentDetail);
    		
    		model.addAttribute("detail", paymentDetail);
    		model.addAttribute("paymentBundleList", paymentBundleList);
    		model.addAttribute("userInfo", userInfo);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "mypage-4-1-2(5)");
    	return "popup/transaction-statement";
    }
    
    //일반영수증
    @RequestMapping("/Popup/normalReceipt")
    public String normalReceipt(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		params.put("email",session.getAttribute("email"));
    		//로그인 확인
    		Map<String,Object> userInfo = userDAO.getLoginUserList(params);
    		if(!isEmpty(userInfo)){
    			params.put("usr_id",userInfo.get("usr_id"));
    		}

    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		model.addAttribute("detail", paymentDetail);
    		model.addAttribute("userInfo", userInfo);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "mypage-4-1-2(2)");
    	return "popup/normal-receipts";
    }
    
    //세금계산서발행
    @RequestMapping("/Popup/taxInvoice")
    public String taxInvoice(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
    		
    		int payment_total = Integer.parseInt(String.valueOf(paymentDetail.get("payment")));
    		int delivery_payment = 0;
    		int delivery_supply_payment = 0;
    		int supply_total = 0;
    		int tax_total = 0;
    		int empty_count = 0;

    		for(Map<String,Object> bundle:paymentBundleList) {
    			int bundlePayment =  Integer.parseInt(String.valueOf(bundle.get("product_payment"))) * Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int bundleCouponDiscount = Integer.parseInt(String.valueOf(bundle.get("coupon_discount")));
    			int unit_price = (bundlePayment - bundleCouponDiscount) / Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int unit_supply_price = (int)Math.round(unit_price / 1.1);
    			bundle.put("unit_price",unit_price);
    			bundle.put("unit_supply_price",unit_supply_price);
    			
    			supply_total += unit_supply_price;
    			tax_total += (unit_price - unit_supply_price);
    			payment_total -= (bundlePayment - bundleCouponDiscount);
    		}
    		delivery_payment = payment_total;
    		delivery_supply_payment = (int)Math.round(delivery_payment / 1.1);
    		supply_total += delivery_supply_payment;
    		tax_total += (delivery_payment - delivery_supply_payment);
    		
    		String supply_total_str = String.format("% 11d", supply_total);
    		String tax_total_str = String.format("% 10d", tax_total);
    		
    		for(int i=0; i<supply_total_str.length(); i++) {
    			if(supply_total_str.charAt(i) == ' ') empty_count++;
    		}
    		
    		model.addAttribute("delivery_payment", delivery_payment);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("supply_total", supply_total);
    		model.addAttribute("supply_total_str", supply_total_str);
    		model.addAttribute("tax_total", tax_total);
    		model.addAttribute("tax_total_str", tax_total_str);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("empty_count", empty_count);
    		
    		
            model.addAttribute("paymentBundleList", paymentBundleList);
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "tax-bill");
    	return "popup/tax-invoice";
    }
    //입점업체세금계산서신청
    @RequestMapping("/Popup/taxStoreInvoice")
    public String taxStoreInvoice(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
    		
    		int payment_total = Integer.parseInt(String.valueOf(paymentDetail.get("payment")));
    		int delivery_payment = 0;
    		int delivery_supply_payment = 0;
    		int supply_total = 0;
    		int tax_total = 0;
    		int empty_count = 0;

    		for(Map<String,Object> bundle:paymentBundleList) {
    			int bundlePayment =  Integer.parseInt(String.valueOf(bundle.get("product_payment"))) * Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int bundleCouponDiscount = Integer.parseInt(String.valueOf(bundle.get("coupon_discount")));
    			int unit_price = (bundlePayment - bundleCouponDiscount) / Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int unit_supply_price = (int)Math.round(unit_price / 1.1);
    			bundle.put("unit_price",unit_price);
    			bundle.put("unit_supply_price",unit_supply_price);
    			
    			supply_total += unit_supply_price;
    			tax_total += (unit_price - unit_supply_price);
    			payment_total -= (bundlePayment - bundleCouponDiscount);
    		}
    		delivery_payment = payment_total;
    		delivery_supply_payment = (int)Math.round(delivery_payment / 1.1);
    		supply_total += delivery_supply_payment;
    		tax_total += (delivery_payment - delivery_supply_payment);
    		
    		String supply_total_str = String.format("% 11d", supply_total);
    		String tax_total_str = String.format("% 10d", tax_total);
    		
    		for(int i=0; i<supply_total_str.length(); i++) {
    			if(supply_total_str.charAt(i) == ' ') empty_count++;
    		}
    		
    		model.addAttribute("delivery_payment", delivery_payment);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("supply_total", supply_total);
    		model.addAttribute("supply_total_str", supply_total_str);
    		model.addAttribute("tax_total", tax_total);
    		model.addAttribute("tax_total_str", tax_total_str);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("empty_count", empty_count);
    		
    		
            model.addAttribute("paymentBundleList", paymentBundleList);
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "tax-bill");
    	return "popup/tax-storeInvoice";
    }
    //입점업체세금계산서 승인확인
    @RequestMapping("/Popup/taxStoreInvoiceApproval")
    public String taxStoreInvoiceApproval(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
    		List<Map<String,Object>> storeInvoiceList = paymentDAO.getStoreInvoiceList(params);
    		
    		String tax_type = String.valueOf(storeInvoiceList.get(0).get("tax_type"));
    		int payment_total = Integer.parseInt(String.valueOf(paymentDetail.get("payment")));
    		int delivery_payment = 0;
    		int delivery_supply_payment = 0;
    		int supply_total = 0;
    		int tax_total = 0;
    		int empty_count = 0;

    		for(Map<String,Object> bundle:paymentBundleList) {
    			int bundlePayment =  Integer.parseInt(String.valueOf(bundle.get("product_payment"))) * Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int bundleCouponDiscount = Integer.parseInt(String.valueOf(bundle.get("coupon_discount")));
    			int unit_price = (bundlePayment - bundleCouponDiscount) / Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int unit_supply_price = (int)Math.round(unit_price / 1.1);
    			bundle.put("unit_price",unit_price);
    			bundle.put("unit_supply_price",unit_supply_price);
    			
    			supply_total += unit_supply_price;
    			tax_total += (unit_price - unit_supply_price);
    			payment_total -= (bundlePayment - bundleCouponDiscount);
    		}
    		delivery_payment = payment_total;
    		delivery_supply_payment = (int)Math.round(delivery_payment / 1.1);
    		supply_total += delivery_supply_payment;
    		tax_total += (delivery_payment - delivery_supply_payment);
    		
    		String supply_total_str = String.format("% 11d", supply_total);
    		String tax_total_str = String.format("% 10d", tax_total);
  
    		for(int i=0; i<supply_total_str.length(); i++) {
    			if(supply_total_str.charAt(i) == ' ') empty_count++;
    		}
    		
    		model.addAttribute("delivery_payment", delivery_payment);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("supply_total", supply_total);
    		model.addAttribute("supply_total_str", supply_total_str);
    		model.addAttribute("tax_total", tax_total);
    		model.addAttribute("tax_total_str", tax_total_str);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("empty_count", empty_count);
    		model.addAttribute("storeInvoiceList",storeInvoiceList);
            model.addAttribute("paymentBundleList", paymentBundleList);
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "tax-bill");
    	List<Map<String,Object>> storeInvoiceList = paymentDAO.getStoreInvoiceList(params);
		
		String tax_type = String.valueOf(storeInvoiceList.get(0).get("tax_type"));
		String taxinvoice_status = String.valueOf(storeInvoiceList.get(0).get("taxinvoice_status"));
		/*
		 * if(taxinvoice_status.equals("S")) {
		 * 
		 * 
		 * }
		 */
		
		if(tax_type.equals("2") ) {
			return "popup/tax-storeapprove-zero";
    	}else {
    		return "popup/tax-storeapproval";
    	}
    	
    	
    }
    
    
    //입점업체세금계산서 내용 확인
    @RequestMapping("/Popup/taxStoreInvoiceApprovalChk")
    public String taxStoreInvoiceApprovalChk(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
    		List<Map<String,Object>> storeInvoiceList = paymentDAO.getStoreInvoiceList(params);
    		
    		String tax_type = String.valueOf(storeInvoiceList.get(0).get("tax_type"));
    		int payment_total = Integer.parseInt(String.valueOf(paymentDetail.get("payment")));
    		int delivery_payment = 0;
    		int delivery_supply_payment = 0;
    		int supply_total = 0;
    		int tax_total = 0;
    		int empty_count = 0;

    		for(Map<String,Object> bundle:paymentBundleList) {
    			int bundlePayment =  Integer.parseInt(String.valueOf(bundle.get("product_payment"))) * Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int bundleCouponDiscount = Integer.parseInt(String.valueOf(bundle.get("coupon_discount")));
    			int unit_price = (bundlePayment - bundleCouponDiscount) / Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int unit_supply_price = (int)Math.round(unit_price / 1.1);
    			bundle.put("unit_price",unit_price);
    			bundle.put("unit_supply_price",unit_supply_price);
    			
    			supply_total += unit_supply_price;
    			tax_total += (unit_price - unit_supply_price);
    			payment_total -= (bundlePayment - bundleCouponDiscount);
    		}
    		delivery_payment = payment_total;
    		delivery_supply_payment = (int)Math.round(delivery_payment / 1.1);
    		supply_total += delivery_supply_payment;
    		tax_total += (delivery_payment - delivery_supply_payment);
    		
    		String supply_total_str = String.format("% 11d", supply_total);
    		String tax_total_str = String.format("% 10d", tax_total);
  
    		for(int i=0; i<supply_total_str.length(); i++) {
    			if(supply_total_str.charAt(i) == ' ') empty_count++;
    		}
    		
    		model.addAttribute("delivery_payment", delivery_payment);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("supply_total", supply_total);
    		model.addAttribute("supply_total_str", supply_total_str);
    		model.addAttribute("tax_total", tax_total);
    		model.addAttribute("tax_total_str", tax_total_str);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("empty_count", empty_count);
    		model.addAttribute("storeInvoiceList",storeInvoiceList);
            model.addAttribute("paymentBundleList", paymentBundleList);
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "tax-bill");
    	List<Map<String,Object>> storeInvoiceList = paymentDAO.getStoreInvoiceList(params);
		
		String tax_type = String.valueOf(storeInvoiceList.get(0).get("tax_type"));
		String taxinvoice_status = String.valueOf(storeInvoiceList.get(0).get("taxinvoice_status"));
		/*
		 * if(taxinvoice_status.equals("S")) {
		 * 
		 * 
		 * }
		 */
		
		if(tax_type.equals("2") ) {
			return "popup/tax-storeapprove-zeroChk";
    	}else {
    		return "popup/tax-storeapprovalChk";
    	}
    	
    	
    }
    
    
    //세금계산서발행영세
    @RequestMapping("/Popup/taxInvoiceZero")
    public String taxInvoiceZero(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
    		
    		int payment_total = Integer.parseInt(String.valueOf(paymentDetail.get("payment")));
    		int delivery_payment = 0;
    		int delivery_supply_payment = 0;
    		int supply_total = 0;
    		int tax_total = 0;
    		int empty_count = 0;
    		
    		for(Map<String,Object> bundle:paymentBundleList) {
    			int bundlePayment =  Integer.parseInt(String.valueOf(bundle.get("product_payment"))) * Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int bundleCouponDiscount = Integer.parseInt(String.valueOf(bundle.get("coupon_discount")));
    			int unit_price = (bundlePayment - bundleCouponDiscount) / Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int unit_supply_price = (int)Math.round(unit_price / 1.1);
    			bundle.put("unit_price",unit_price);
    			bundle.put("unit_supply_price",unit_supply_price);
    			
    			supply_total += unit_supply_price;
    			tax_total += (unit_price - unit_supply_price);
    			payment_total -= (bundlePayment - bundleCouponDiscount);
    		}
    		delivery_payment = payment_total;
    		delivery_supply_payment = (int)Math.round(delivery_payment / 1.1);
    		supply_total += delivery_supply_payment;
    		tax_total += (delivery_payment - delivery_supply_payment);
    		
    		String supply_total_str = String.format("% 11d", supply_total);
    		String total_amount_str = String.format("% 11d", supply_total+tax_total);
    		String tax_total_str = String.format("% 10d", tax_total);
    		
    		for(int i=0; i<total_amount_str.length(); i++) {
    			if(total_amount_str.charAt(i) == ' ') empty_count++;
    		}
    		
    		model.addAttribute("delivery_payment", delivery_payment);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("supply_total", supply_total);
    		model.addAttribute("supply_total_str", supply_total_str);
    		model.addAttribute("tax_total", tax_total);
    		model.addAttribute("tax_total_str", tax_total_str);
    		model.addAttribute("total_amount_str", total_amount_str);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("empty_count", empty_count);
    		
    		
    		model.addAttribute("paymentBundleList", paymentBundleList);
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "tax-bill");
    	return "popup/tax-invoice-zero";
    }
    //세금계산서발행영세
    @RequestMapping("/Popup/taxStoreInvoiceZero")
    public String taxStoreInvoiceZero(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session) throws Exception {
    	try {
    		Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
    		List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
    		List<Map<String,Object>> storeInvoiceList = paymentDAO.getStoreInvoiceList(params);
    		int payment_total = Integer.parseInt(String.valueOf(paymentDetail.get("payment")));
    		int delivery_payment = 0;
    		int delivery_supply_payment = 0;
    		int supply_total = 0;
    		int tax_total = 0;
    		int empty_count = 0;
    		
    		for(Map<String,Object> bundle:paymentBundleList) {
    			int bundlePayment =  Integer.parseInt(String.valueOf(bundle.get("product_payment"))) * Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int bundleCouponDiscount = Integer.parseInt(String.valueOf(bundle.get("coupon_discount")));
    			int unit_price = (bundlePayment - bundleCouponDiscount) / Integer.parseInt(String.valueOf(bundle.get("payment_order_quantity")));
    			int unit_supply_price = (int)Math.round(unit_price / 1.1);
    			bundle.put("unit_price",unit_price);
    			bundle.put("unit_supply_price",unit_supply_price);
    			
    			supply_total += unit_supply_price;
    			tax_total += (unit_price - unit_supply_price);
    			payment_total -= (bundlePayment - bundleCouponDiscount);
    		}
    		delivery_payment = payment_total;
    		delivery_supply_payment = (int)Math.round(delivery_payment / 1.1);
    		supply_total += delivery_supply_payment;
    		tax_total += (delivery_payment - delivery_supply_payment);
    		
    		String supply_total_str = String.format("% 11d", supply_total);
    		String total_amount_str = String.format("% 11d", supply_total+tax_total);
    		String tax_total_str = String.format("% 10d", tax_total);
    		
    		for(int i=0; i<total_amount_str.length(); i++) {
    			if(total_amount_str.charAt(i) == ' ') empty_count++;
    		}
    		
    		model.addAttribute("delivery_payment", delivery_payment);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("supply_total", supply_total);
    		model.addAttribute("supply_total_str", supply_total_str);
    		model.addAttribute("tax_total", tax_total);
    		model.addAttribute("tax_total_str", tax_total_str);
    		model.addAttribute("total_amount_str", total_amount_str);
    		model.addAttribute("delivery_supply_payment", delivery_supply_payment);
    		model.addAttribute("empty_count", empty_count);
    		model.addAttribute("storeInvoiceList",storeInvoiceList);
    		
    		model.addAttribute("paymentBundleList", paymentBundleList);
    		model.addAttribute("detail", paymentDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("style", "tax-bill");
    	return "popup/tax-storeInvoice-zero";
    }
}
