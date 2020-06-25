package com.webapp.mall.controller;

import com.siot.IamportRestClient.IamportClient;
import com.webapp.mall.dao.IamPortDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.IamPortVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
public class WebHookRestController {
	@Autowired
	private IamPortDAO iamPortDAO;
	@Autowired 
	private PaymentDAO paymentDAO;

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

			if(iamPortVO.getStatus() != null && iamPortVO.getStatus().equals("paid")) {
				deliveryInfoVO.setPayment_status("W");
				paymentDAO.updatePayment(deliveryInfoVO);
			}
			if(iamPortVO.getStatus() != null && iamPortVO.getStatus().equals("ready")) {
				deliveryInfoVO.setPayment_status("M");
				paymentDAO.updatePayment(deliveryInfoVO);
			}
			if(iamPortVO.getStatus() != null && iamPortVO.getStatus().equals("cancelled")) {
				deliveryInfoVO.setPayment_status("C");
				paymentDAO.updatePayment(deliveryInfoVO);
			}
		}catch (Exception e) {
			e.printStackTrace();
//			return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		resultMap.put("body", "success");
		resultMap.put("status",200);
		return resultMap;
	}
}
