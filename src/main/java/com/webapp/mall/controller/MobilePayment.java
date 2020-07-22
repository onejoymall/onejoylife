package com.webapp.mall.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CartDAO;
import com.webapp.mall.dao.CouponDAO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.IamPortDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
@Controller
public class MobilePayment {
	@Autowired
    private NumberGender numberGender;
	@Autowired
	private IamPortDAO iamPortDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private DeliveryDAO deliveryDAO;
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private CouponDAO couponDAO;
	@Autowired
	private PointDAO pointDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CartDAO cartDAO;
	IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;
    
  //결제 정보저장
    @RequestMapping(value = "/SavePaymentMobile", method = RequestMethod.GET, produces = "application/json")
    public  String SavePaymentMobile(@RequestParam HashMap params,HttpServletRequest request,HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
    	String rediectURL = "";
    	if(params.get("error_msg") != null && !params.get("error_msg").equals("")) {
    		if(deliveryInfoVO.getPayment_class().equals("PRODUCT")) {
    			return "redirect:/product/productDetail?product_cd="+params.get("product_cd");
    		}else {
    			return "redirect:/MyPage/GiveawayWinningList";
    		}
    	}
        try{
    		client = new IamportClient(apiKey, apiSecret);
    		Payment impPayment = client.paymentByImpUid((String)params.get("imp_uid")).getResponse();
    		if(impPayment.getAmount().equals(new BigDecimal((String)params.get("payment")))) {
    			deliveryInfoVO.setSuccess(true);
    			params.put("success",true);
    			deliveryInfoVO.setPay_method(impPayment.getPayMethod());
    			params.put("pay_method",impPayment.getPayMethod());
    			params.put("pg_provider",impPayment.getPgProvider());
    		}
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
                deliveryInfoVO.setOrder_user_id( Integer.parseInt(numberGender.numberGen(6,1)));
                rediectURL = "/MyPage/OrderDetailGuest?order_no="+deliveryInfoVO.getOrder_no();
            }else{
            	if(deliveryInfoVO.getPayment_class().equals("PRODUCT")){
	                params.put("payment_user_id",userInfo.get("usr_id"));
	                params.put("point_paid_user_id",userInfo.get("usr_id"));
	                deliveryInfoVO.setOrder_user_id((Integer)userInfo.get("usr_id"));
	                
//	                //회원인 경우 보유포인트 확인
//	                Map<String,Object> productInfo =productDAO.getProductViewDetail(params);
//	                String getPointAmountString = Integer.toString(pointDAO.getPointAmount(params));
//	                String getPaymentString = Integer.toString((Integer)productInfo.get("product_payment"));
//	                
//	                //상품결제 시 포인트 배율 확인 및 지급
//	                //상품결제시 에만 포인트 지급 입력된 값이 있을떼만
//                    BigDecimal userPoint = new BigDecimal(getPointAmountString);//보유포인트
//                    BigDecimal payment = new BigDecimal(getPaymentString);//구매금액
//                    BigDecimal productPointRate = new BigDecimal((String)productInfo.get("product_point_rate"));//포인트배율
//                    BigDecimal hPersent = new BigDecimal("100");//백분율
//                    if(productPointRate.compareTo(BigDecimal.ZERO) == 1){
//
//                        BigDecimal pointMultiply = productPointRate.multiply(payment).divide(hPersent);
//                        params.put("point_amount",userPoint.add(pointMultiply));
//                        params.put("point_paid_memo",productInfo.get("product_name"));
//                        params.put("point_add",pointMultiply);
//                        params.put("point_paid_user_id",userInfo.get("usr_id"));
//                        params.put("point_paid_type","P");
//                        params.put("point_paid_product_cd",productInfo.get("product_cd"));
//                        params.put("order_no",deliveryInfoVO.getOrder_no());
//                        pointDAO.insertPoint(params);
//                    }
                    rediectURL = "/MyPage/OrderAndDelivery";
                }else if(deliveryInfoVO.getPayment_class().equals("GIVEAWAY")){
                	params.put("reg_no",params.get("reg_no1")+"-"+params.get("reg_no2"));
                	//경품 응모시 결제 상태 변경
                    if(params.get("success").equals("false")){
                        params.put("giveaway_payment_status","A");
                    }else{
                        params.put("giveaway_payment_status","B");
                    }

                    paymentDAO.updateGiveawayDeliveryStatus(params);
                    rediectURL = "/MyPage/GiveawayWinningList";
                }
            }

            paymentDAO.insertPayment(params);
            if(deliveryInfoVO.getPayment_class().equals("PRODUCT")){
            	paymentDAO.insertBundle(params);
            }
            
            deliveryDAO.insertDelivery(deliveryInfoVO);

        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:"+rediectURL;
    }
    
  //장바구니 결제 처리
    @RequestMapping(value = "/Save/PaymentOrdersMobile", method = RequestMethod.GET, produces = "application/json")
    public  String PaymentOrdersMobile(@RequestParam HashMap params, CartPaymentVO cartPaymentVO, ModelMap model, HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
    	String rediectURL = "";
    	if(params.get("error_msg") != null && !params.get("error_msg").equals("")) {
    		return "redirect:/MyPage/ShoppingBasket";
    	}
        try{
        	client = new IamportClient(apiKey, apiSecret);
    		Payment impPayment = client.paymentByImpUid((String)params.get("imp_uid")).getResponse();
    		if(impPayment.getAmount().equals(new BigDecimal((String)params.get("payment")))) {
    			deliveryInfoVO.setSuccess(true);
    			params.put("success",true);
    			deliveryInfoVO.setPay_method(impPayment.getPayMethod());
    			params.put("pay_method",impPayment.getPayMethod());
    			params.put("pg_provider",impPayment.getPgProvider());
    		}
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
                rediectURL = "/MyPage/OrderDetailGuest?order_no="+deliveryInfoVO.getOrder_no();
            }else{
                params.put("payment_user_id",userInfo.get("usr_id"));
                params.put("point_paid_user_id",userInfo.get("usr_id"));
                
//                //회원인 경우 보유포인트 확인
//                String getPointAmountString = Integer.toString(pointDAO.getPointAmount(params));
//                //상품결제 시 포인트 배율 확인 및 지급
//                //상품결제시 에만 포인트 지급 입력된 값이 있을떼만
//                if(deliveryInfoVO.getPayment_class().equals("PRODUCT")){
//                    BigDecimal userPoint = new BigDecimal(getPointAmountString);//보유포인트
//                    if(params.get("point_add") != null && !params.get("point_add").equals("") && !params.get("point_add").equals("0")){
//                    	BigDecimal pointMultiply = new BigDecimal((String)params.get("point_add")); //구매포인트
//                        params.put("point_amount",userPoint.add(pointMultiply));
//                        params.put("point_paid_memo",params.get("product_order_name"));
//                        params.put("point_add",pointMultiply);
//                        params.put("point_paid_user_id",userInfo.get("usr_id"));
//                        params.put("point_paid_type","O");
//                        params.put("order_no",deliveryInfoVO.getOrder_no());
//                        pointDAO.insertPoint(params);
//                    }
//                }
//                
                rediectURL = "/MyPage/OrderAndDelivery";
                params.put("payment_order_quantity", params.get("quantity_total"));
                paymentDAO.insertPayment(params);

                cartPaymentVO.setPayment_cd((String)params.get("payment_cd"));
                cartPaymentVO.setCart_user_id(String.valueOf(params.get("payment_user_id")));
                cartPaymentVO.setPayment_status((String) params.get("payment_status"));
                paymentDAO.insertCartBundle(cartPaymentVO);
                cartDAO.CartPaymentListDelete(cartPaymentVO);
            }
            deliveryDAO.insertDelivery(deliveryInfoVO);

        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:"+rediectURL;
    }
    
    // 장바구니 결제성공시 장바구니에서 상품삭제 모바일
    @RequestMapping(value = "/Save/PaymentOrderSuccessMobile", method = RequestMethod.GET, produces = "application/json")
    public  String PaymentOrderSuccessMobile(@RequestParam HashMap params, CartPaymentVO cartPaymentVO, ModelMap model, HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
    	String rediectURL = "";
    	if(params.get("error_msg") != null && !params.get("error_msg").equals("")) {
    		return "redirect:/MyPage/ShoppingBasket";
    	}
    	try{
    		params.put("email",session.getAttribute("email"));
    		//로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                //비회원 주문시 사용자아이디 임시 저장
                rediectURL = "/MyPage/OrderDetailGuest?order_no="+deliveryInfoVO.getOrder_no();
            }else{
                rediectURL = "/MyPage/OrderAndDelivery";
            }
            client = new IamportClient(apiKey, apiSecret);
			Payment impPayment = client.paymentByImpUid(cartPaymentVO.getImp_uid()).getResponse();
			
			if(impPayment != null) {
				iamPortDAO.updateIamportWebHook(impPayment);
			}
			cartDAO.CartPaymentListDelete(cartPaymentVO);
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	return "redirect:"+rediectURL;
    }
    
    // 상품상세 결제성공시 상태값 2중체크 모바일
    @RequestMapping(value = "/Save/PaymentSuccessMobile", method = RequestMethod.GET, produces = "application/json")
    public  String PaymentSuccessMobile(@RequestParam HashMap params, CartPaymentVO cartPaymentVO, ModelMap model, HttpSession session,DeliveryInfoVO deliveryInfoVO,GiveawayVO giveawayVO){
    	String rediectURL = "";
    	if(params.get("error_msg") != null && !params.get("error_msg").equals("")) {
    		if(deliveryInfoVO.getPayment_class().equals("PRODUCT")) {
    			return "redirect:/product/productDetail?product_cd="+params.get("product_cd");
    		}else {
    			return "redirect:/MyPage/GiveawayWinningList";
    		}
    	}
    	
    	try{
    		params.put("email",session.getAttribute("email"));
    		//로그인 확인
    		Map<String,Object> userInfo = userDAO.getLoginUserList(params);
    		if(isEmpty(userInfo)){
    			//비회원 주문시 사용자아이디 임시 저장
    			rediectURL = "/MyPage/OrderDetailGuest?order_no="+deliveryInfoVO.getOrder_no();
    		}else{
    			rediectURL = "/MyPage/OrderAndDelivery";
    		}
    		client = new IamportClient(apiKey, apiSecret);
    		Payment impPayment = client.paymentByImpUid(cartPaymentVO.getImp_uid()).getResponse();
    		
    		if(impPayment != null) {
    			iamPortDAO.updateIamportWebHook(impPayment);
    		}
    		
    		if(!deliveryInfoVO.getPayment_class().equals("PRODUCT")) {
    			rediectURL = "/MyPage/GiveawayWinningList";
    		}
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	return "redirect:"+rediectURL;
    }
}
