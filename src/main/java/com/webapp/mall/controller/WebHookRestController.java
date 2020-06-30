package com.webapp.mall.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.mall.dao.CouponDAO;
import com.webapp.mall.dao.IamPortDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.IamPortVO;

@RestController
public class WebHookRestController {
	@Autowired
	private IamPortDAO iamPortDAO;
	@Autowired 
	private PaymentDAO paymentDAO;
	@Autowired 
	private CouponDAO couponDAO;
	IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;

	/**
	 * 결제가 승인되었을 때(모든 결제 수단) - (status : paid)
	 * 가상계좌가 발급되었을 때 - (status : ready)
	 * 가상계좌에 결제 금액이 입금되었을 때 - (status : paid)
	 * 예약결제가 시도되었을 때 - (status : paid or failed)
	 * 대시보드에서 환불되었을 때 - (status : cancelled)
	 * "imp_uid": "imp_1234567890", "merchant_uid": "order_id_8237352",
	 * {"imp_uid":"imp_565137837038","merchant_uid":"PD-ORDER-2385532","status":"ready"}
	 */

	@PostMapping(value =  "/webhook/restapi")
	public HashMap<String,Object> IamPortWebHookRest(@RequestBody IamPortVO iamPortVO, DeliveryInfoVO deliveryInfoVO) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			iamPortDAO.insertWebHook(iamPortVO);
			client = new IamportClient(apiKey, apiSecret);
			Payment impPayment = client.paymentByImpUid(iamPortVO.getImp_uid()).getResponse();
			
			if(impPayment != null) {
				iamPortDAO.updateIamportWebHook(impPayment);
			}
			if(iamPortVO.getStatus() != null && (iamPortVO.getStatus().equals("paid") || iamPortVO.getStatus().equals("ready"))) {
				Map<String,Object> param = new HashMap<>();
				param.put("coupon_use_yn","Y");
				param.put("order_no",iamPortVO.getMerchant_uid());
				
				couponDAO.updateCouponHistory(param);
			}
			if(iamPortVO.getStatus() != null && iamPortVO.getStatus().equals("cancelled")) {
				Map<String,Object> param = new HashMap<>();
				param.put("coupon_use_yn","N");
				param.put("order_no",iamPortVO.getMerchant_uid());
				
				couponDAO.updateCouponHistory(param);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		resultMap.put("body", "success");
		resultMap.put("status",200);
		return resultMap;
	}
}
