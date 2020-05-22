package com.webapp.mall.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.vo.DeliveryInfoVO;

@RestController
public class WebHookController {
	@Autowired 
	private PaymentDAO paymentDAO;
	
	IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;
	
    @RequestMapping(value =  "/iamport-webhook", method = RequestMethod.POST)
    public ResponseEntity<String> webHook(@RequestParam HashMap params,HttpServletRequest request,HttpSession session,DeliveryInfoVO deliveryInfoVO){
    	try {
    		if(params.get("status") != null && params.get("status").equals("paid")) {
    			deliveryInfoVO.setPayment_status("W");
    			paymentDAO.updatePayment(deliveryInfoVO);
    		}
    	}catch (Exception e) {
    		e.printStackTrace();
    		return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
		}
    	return new ResponseEntity<>("success", HttpStatus.OK);
    }
}
