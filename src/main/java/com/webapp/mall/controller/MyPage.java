package com.webapp.mall.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CartDAO;
import com.webapp.mall.dao.CouponDAO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.MyPageDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.ReviewDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.MyPageVO;
import com.webapp.mall.vo.QnaVO;
import com.webapp.manager.dao.QnaDAO;

import ch.qos.logback.core.status.Status;
@Controller
public class MyPage {
    @Autowired
    MessageSource messageSource;
    @Autowired
    CouponDAO couponDAO;
    @Autowired
    PointDAO pointDAO;
    @Autowired
    ProductDAO productDAO;
    @Autowired
    UserDAO userDAO;
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    DeliveryDAO deliveryDAO;
    @Autowired
    CartDAO cartDAO;
    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    MyPageDAO myPageDAO;
    @Autowired
    ReviewDAO reviewDAO;
    @Autowired
    QnaDAO qnaDAO;
    
    IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;
    @Autowired
    private NumberGender numberGender;
    @Value("${t_key}")
    private String t_key;
    @Value("${t_url}")
    private String t_url;
    //MyPage 해더
    @RequestMapping(value="/MyPage/RightHeader")
    public String RightHeader(Model model, HashMap params, HttpSession session, HttpServletRequest request) throws SQLException {
        try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("point_paid_user_id",userInfo.get("usr_id"));
            params.put("giveaway_play_user_id",userInfo.get("usr_id"));
            params.put("order_user_id",userInfo.get("usr_id"));
            params.put("coupon_paid_user_id",userInfo.get("usr_id"));
            params.put("payment_user_id",userInfo.get("usr_id"));
            //배송중
            params.put("delivery_status","D");

            Integer couponCnt = couponDAO.getUserCouponListCount(params);
            Integer giveawayCnt = giveawayDAO.getUserGiveawayPlayListCount(params);
            
          //배송현황 카운트
            Map<String,Object> paymentCnt = paymentDAO.getUserPaymentStatusCount(params);
            model.addAttribute("paymentCnt", paymentCnt);
            
            model.addAttribute("giveawayCnt",giveawayCnt);
            model.addAttribute("couponCnt", couponCnt);
            model.addAttribute("point_amount",pointDAO.getPointAmount(params));

        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-1");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/layout/MyPageRightHeader";
        } else {
            return "layout/MyPageRightHeader";
        }
    }
  //MyPage 해더 서브
    @RequestMapping(value="/MyPage/RightHeaderSub")
    public String RightHeaderSub(Model model, HashMap params, HttpSession session, HttpServletRequest request) throws SQLException {

        try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            Integer coupon = couponDAO.getUserCouponListCount(params);
            params.put("point_paid_user_id",userInfo.get("usr_id"));
            params.put("giveaway_play_user_id",userInfo.get("usr_id"));
            params.put("order_user_id",userInfo.get("usr_id"));
            params.put("payment_user_id",userInfo.get("usr_id"));
            //배송중
            params.put("delivery_status","D");

          //배송현황 카운트
            Map<String,Object> paymentCnt = paymentDAO.getUserPaymentStatusCount(params);
            model.addAttribute("paymentCnt", paymentCnt);
            
            Integer giveawayCnt = giveawayDAO.getUserGiveawayPlayListCount(params);
            model.addAttribute("giveawayCnt",giveawayCnt);
            model.addAttribute("couponCnt", coupon);
            model.addAttribute("point_amount",pointDAO.getPointAmount(params));

        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-1");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/layout/MyPageRightHeaderSub";
        } else {
            return "layout/MyPageRightHeader";
        }
    }
    //대시보드
    @RequestMapping(value="/MyPage/DashBoard")
    public String myPageDashBoard( Model model,@RequestParam HashMap params,HttpSession session,SearchVO searchVO, HttpServletRequest request) {
        try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("payment_user_id",userInfo.get("usr_id"));
            //최근 구매내역
            searchVO.setDisplayRowCount(3);
            searchVO.setStaticRowEnd(3);
            searchVO.pageCalculate(paymentDAO.getPaymentListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            params.put("displayRowCount",searchVO.getDisplayRowCount());
            model.addAttribute("searchVO", searchVO);
            List<Map<String,Object>> paymentList = paymentDAO.getUserPaymentBundleList(params);
            
            if(paymentList != null && paymentList.size() > 0) {
	            Map<String,Object> groupList = paymentList.stream().reduce(new HashMap<String,Object>(),(acc, cur) -> {
	            	if(acc.containsKey(cur.get("order_no"))) {
	            		((List)acc.get(cur.get("order_no"))).add(cur);
	            	}else {
	            		List<Map<String,Object>> tmpList = new ArrayList<>();
	            		tmpList.add(cur);
	            		acc.put((String)cur.get("order_no"),tmpList);
	            	}
	            	return acc;
	            });
	            // Map.Entry 리스트 작성
	    		List<Entry<String, Object>> list_entries = new ArrayList<Entry<String, Object>>(groupList.entrySet());
	
	    		// 비교함수 Comparator를 사용하여 오름차순으로 정렬
	    		Collections.sort(list_entries, new Comparator<Entry<String, Object>>() {
	    			// compare로 값을 비교
	    			public int compare(Entry<String, Object> obj1, Entry<String, Object> obj2) {
	    				// 오름 차순 정렬
	    				return String.valueOf(((List<Map<String,Object>>)obj2.getValue()).get(0).get("reg_date")).compareTo(String.valueOf(((List<Map<String,Object>>)obj1.getValue()).get(0).get("reg_date")));
	    			}
	    		});
	    		model.addAttribute("paymentList", list_entries);
            }

            //경품참여
            params.put("giveaway_play_user_id",userInfo.get("usr_id"));
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(giveawayDAO.getUserGiveawayPlayListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());

            //배송현황 카운트
            Map<String,Object> paymentCnt = paymentDAO.getUserPaymentStatusCount(params);
            model.addAttribute("paymentCnt", paymentCnt);
            
            List<Map<String,Object>> giveawayList = giveawayDAO.getUserGiveawayPlayList(params);
            model.addAttribute("giveawayList", giveawayList);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 1);
        model.addAttribute("style", "mypage-1");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-main";
        } else {
            return "mypage/DashBoard";
        }
    }
    //이포인트
    @RequestMapping(value="/MyPage/ePoint")
    public String myPagePoint(Model model,HttpServletRequest request,HttpSession session,@RequestParam HashMap params,SearchVO searchVO) throws SQLException {
        try{
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);

            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("point_paid_user_id",userInfo.get("usr_id"));
            searchVO.pageCalculate(pointDAO.getPointListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = pointDAO.getPointList(params);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 2);
        model.addAttribute("style", "mypage-2");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-2";
        } else {
            return "mypage/ePoint";
        }
    }
    //쿠폰
    @RequestMapping(value="/MyPage/Coupon")
    public String myPageCoupon(HttpSession session, Model model, HashMap params,HttpServletRequest request,SearchVO searchVO) {
    	Device device = DeviceUtils.getCurrentDevice(request);
        try{
        	searchVO.setDisplayRowCount(10);
        	searchVO.setStaticRowEnd(10);
        	if(device.isMobile()) {
        		searchVO.setDisplayRowCount(1000);
            	searchVO.setStaticRowEnd(1000);	
        	}
            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("coupon_paid_user_id",userInfo.get("usr_id"));
            List<Map<String,Object>> userCouponList = couponDAO.getUserCouponList(params);
            model.addAttribute("message_coupon_payment_condition",messageSource.getMessage("coupon.coupon_payment_condition","ko"));
            model.addAttribute("userCouponList", userCouponList);
            
            //자동발급조건 다운로드가능쿠폰
            List<Map<String,Object>> userDownloadCouponList = couponDAO.getUserDownloadCouponList(params);
            List<Map<String,Object>> userDownloadCouponListResult = new ArrayList<>();
            for(Map<String,Object> coupon:userDownloadCouponList) {
            	if(couponConditionCheck(coupon, (Integer)userInfo.get("usr_id"))) userDownloadCouponListResult.add(coupon);
            }
            model.addAttribute("userDownloadCouponList", userDownloadCouponListResult);
            
            model.addAttribute("style", "mypage-3");
            model.addAttribute("leftNavOrder", 3);
        }catch (Exception e){
            e.printStackTrace();
        }
        
        if(device.isMobile()){
            return "mobile/mypage-3";
        } else {
            return "mypage/Coupon";
        }
    }
    
    //쿠폰 다운로드
    @RequestMapping(value="/MyPage/Coupon-issued")
    public String myPageCouponIssued(HttpSession session, Model model, @RequestParam HashMap params,HttpServletRequest request) {

        try{
        	params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("coupon_paid_user_id",userInfo.get("usr_id"));
            
            Map<String,Object> couponInfo = couponDAO.getCouponDetail(params);
            if(couponInfo == null){
            	model.addAttribute("msg","잘못된 쿠폰번호입니다.");
            }else if(couponDAO.getUserCouponListCount(params) > 0 && couponInfo.get("coupon_dup_yn").equals("N")){
            	model.addAttribute("msg","중복사용은 불가능합니다.");
            }else if(couponInfo.get("coupon_condition").equals("L")) {
            	couponDAO.insertCoupon(params);
            	model.addAttribute("msg","쿠폰이 등록되었습니다.");
            }else if(couponInfo.get("coupon_condition").equals("M")) {
            	Map<String,Object> lastPaymentDate = productDAO.getLastPaymentDate(params);
            	if(lastPaymentDate != null) {
	            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            	Date curDate = new Date();
	            	Date lastDate = sdf.parse((String)lastPaymentDate.get("reg_date"));
	            	
	            	Calendar cal = Calendar.getInstance();
	            	cal.setTime(lastDate);
	            	cal.add(Calendar.DATE, (int)couponInfo.get("coupon_none_buy_month")*30);
	            	lastDate = cal.getTime();
	            	if(curDate.compareTo(lastDate) >= 0) {
	            		couponDAO.insertCoupon(params);
	            		model.addAttribute("msg","쿠폰이 등록되었습니다.");
	            	}else {
	            		model.addAttribute("msg","조건이 충족하지못합니다.");
	            	}
            	}else {
            		model.addAttribute("msg","조건이 충족하지못합니다.");
            	}
            }else {
            	model.addAttribute("msg","잘못된 접근입니다.");
            }
        	
            model.addAttribute("style", "mypage-3");
            model.addAttribute("leftNavOrder", 3);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mypage/Coupon-issued";
//        Device device = DeviceUtils.getCurrentDevice(request);
//        if(device.isMobile()){
//            return "mobile/mypage-3";
//        } else {
//            return "mypage/Coupon-issued";
//        }
    }
    //장바구니
    @RequestMapping(value="/MyPage/ShoppingBasket")
    public String myPageShoppingBasket(Model model,HashMap params,HttpSession session,SearchVO searchVO, HttpServletRequest request) throws Exception{
        //사용자 아이디 확인 후 전달
        params.put("email",session.getAttribute("email"));
        Map<String,Object> userInfo = userDAO.getLoginUserList(params);
        try {

            if(isEmpty(userInfo)){
                params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("cart_user_id",userInfo.get("usr_id"));
            }
            //페이징
            searchVO.setDisplayRowCount(1000);
            searchVO.setStaticRowEnd(1000);
            searchVO.pageCalculate(cartDAO.getCartListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            model.addAttribute("searchVO", searchVO);
            
            //결제비용
            Map<String,Object> getCartSum = new HashMap<>();
            List<Map<String,Object>> list = cartDAO.getCartProductList(params);
            Map<String, Integer> storeDeliveryList = new HashMap<>();
            
            int total_ori_payment = 0;
            int total_payment = 0;
            int total_delivery_payment = 0;
            
            for(Map<String,Object> map : list) {
            	map.put("delivery_payment",deliveryPayment(map));
            	total_ori_payment += (int)map.get("product_payment") * (int)map.get("payment_order_quantity");
            	total_payment += (int)map.get("product_user_payment") * (int)map.get("payment_order_quantity");
            	
            	//스토어 묶음배송
            	if(!map.containsKey("product_delivery_bundle_yn") || "N".equals(map.get("product_delivery_bundle_yn"))){
            		total_delivery_payment += (int)map.get("delivery_payment");
            	}else if("Y".equals(map.get("product_delivery_bundle_yn"))) {
            		if(storeDeliveryList.containsKey(map.get("product_store_id"))){ //키가있으면
            			if(storeDeliveryList.get((String)map.get("product_store_id")) > (int)map.get("delivery_payment")) { //가장비싼배송비
            				storeDeliveryList.put((String)map.get("product_store_id"), storeDeliveryList.get((String)map.get("product_store_id"))); 
            			}else {
            				storeDeliveryList.put((String)map.get("product_store_id"), (int)map.get("delivery_payment")); 
            			}
            		}else { //키가없으면
            			storeDeliveryList.put((String)map.get("product_store_id"), (int)map.get("delivery_payment"));
            		}
            	}
            }
            Set<String> keys = storeDeliveryList.keySet();
            for(String key:keys) {
            	total_delivery_payment += storeDeliveryList.get(key);
            }
            getCartSum.put("total_ori_payment",total_ori_payment);
            getCartSum.put("total_payment",total_payment);
            getCartSum.put("total_delivery_payment",total_delivery_payment);
            model.addAttribute("list", list);
            model.addAttribute("getCartSum", getCartSum);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("postUrl","/payment/cartorder");
        model.addAttribute("style", "mypage-4");
        model.addAttribute("leftNavOrder", 4);

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-4";
        } else {
            return "mypage/ShoppingBasket";
        }
    }
    //찜 목록
    @RequestMapping(value="/MyPage/ShoppingAddList")
    public String myPageShoppingAddList(Model model,HashMap params,HttpSession session,SearchVO searchVO,HttpServletRequest request) throws Exception{
        //사용자 아이디 확인 후 전달
        params.put("email",session.getAttribute("email"));
        Map<String,Object> userInfo = userDAO.getLoginUserList(params);
        try {

            if(isEmpty(userInfo)){
                params.put("user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("user_id",userInfo.get("usr_id"));
            }
            //페이징
            searchVO.setDisplayRowCount(1000);
            searchVO.setStaticRowEnd(1000);
            searchVO.pageCalculate(cartDAO.getFavoritesListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            model.addAttribute("searchVO", searchVO);
            //결제비용

            Map<String,Object> getCartSum = cartDAO.getFavoritesSum(params);
            List<Map<String,Object>> list = cartDAO.getFavoritesList(params);
            model.addAttribute("list", list);
            model.addAttribute("getCartSum", getCartSum);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-5");
        model.addAttribute("leftNavOrder", 5);
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-5";
        } else {
            return "mypage/ShoppingAddList";
        }
    }
    //주문배송조회
    @RequestMapping(value="/MyPage/OrderAndDelivery")
    public String myPageOrderAndDelivery(Model model, @RequestParam HashMap params, HttpSession session, MyPageVO myPageVO, HttpServletRequest request) throws Exception{
        try{
        	   
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            myPageVO.setPayment_user_id((Integer)userInfo.get("usr_id"));
            params.put("payment_user_id",(Integer)userInfo.get("usr_id"));
            //페이징
            myPageVO.setStaticRowEnd(5);
            myPageVO.setDisplayRowCount(5);
            model.addAttribute("searchVO", myPageVO);

            //목록 수량
            myPageVO.pageCalculate(paymentDAO.getUserPaymentBundleListCount(params));
            params.put("rowStart",myPageVO.getRowStart());
            params.put("staticRowEnd",myPageVO.getStaticRowEnd());
            params.put("displayRowCount",myPageVO.getDisplayRowCount());
            //목록 생성
            List<Map<String,Object>> paymentList = paymentDAO.getUserPaymentBundleList(params);
            
            if(paymentList != null && paymentList.size() > 0) {
	            Map<String,Object> groupList = paymentList.stream().reduce(new HashMap<String,Object>(),(acc, cur) -> {
	            	if(acc.containsKey(cur.get("order_no"))) {
	            		((List)acc.get(cur.get("order_no"))).add(cur);
	            	}else {
	            		List<Map<String,Object>> tmpList = new ArrayList<>();
	            		tmpList.add(cur);
	            		acc.put((String)cur.get("order_no"),tmpList);
	            	}
	            	return acc;
	            });
	            // Map.Entry 리스트 작성
	    		List<Entry<String, Object>> list_entries = new ArrayList<Entry<String, Object>>(groupList.entrySet());
	
	    		// 비교함수 Comparator를 사용하여 오름차순으로 정렬
	    		Collections.sort(list_entries, new Comparator<Entry<String, Object>>() {
	    			// compare로 값을 비교
	    			public int compare(Entry<String, Object> obj1, Entry<String, Object> obj2) {
	    				// 오름 차순 정렬
	    				return String.valueOf(((List<Map<String,Object>>)obj2.getValue()).get(0).get("reg_date")).compareTo(String.valueOf(((List<Map<String,Object>>)obj1.getValue()).get(0).get("reg_date")));
	    			}
	    		});
	    		model.addAttribute("paymentList", list_entries);
            }
            
            params.put("code", "payment_status");
            List<Map<String, Object>> getSelectorList = selectorDAO.getSelectorList(params);
            model.addAttribute("getSelectorList", getSelectorList);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-6");
        model.addAttribute("leftNavOrder", 6);
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-6";
        } else {
            return "mypage/OrderAndDelivery";
        }
    }
    //주문상세
    @RequestMapping(value="/MyPage/OrderAndDeliveryDetail")
    public String myPageOrderAndDeliveryDetail(Model model,@RequestParam HashMap params, HttpServletRequest request) {
        try{
            Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
            model.addAttribute("paymentBundleList", paymentBundleList);

            if(paymentDetail.get("imp_uid") != null && !paymentDetail.get("imp_uid").equals("")) {
	            client = new IamportClient(apiKey, apiSecret);
	            Payment impPayment = client.paymentByImpUid((String)paymentDetail.get("imp_uid")).getResponse();
	            paymentDetail.put("vbank_name",impPayment.getVbankName());
	            paymentDetail.put("vbank_num",impPayment.getVbankNum());
	            model.addAttribute("impPayment", impPayment);
            }
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("delivery", delivery);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-6-1");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-6-1";
        } else {
            return "mypage/OrderAndDeliveryDetail";
        }
    }
    //주문상세 - 비회원
    @RequestMapping(value="/MyPage/OrderDetailGuest")
    public String myPageOrderAndDeliveryDetailGuest(HttpServletRequest request, Model model,@RequestParam HashMap params) {
        try{
            Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            params.put("order_no", paymentDetail.get("order_no"));
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            
            List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
            model.addAttribute("paymentBundleList", paymentBundleList);
            
            if(paymentDetail.get("imp_uid") != null && !paymentDetail.get("imp_uid").equals("")) {
	            client = new IamportClient(apiKey, apiSecret);
	            Payment impPayment = client.paymentByImpUid((String)paymentDetail.get("imp_uid")).getResponse();
	            paymentDetail.put("vbank_name",impPayment.getVbankName());
	            paymentDetail.put("vbank_num",impPayment.getVbankNum());
            }
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("postUrl","/Manager/ManagerSign/ManagerLoginProc");
            model.addAttribute("delivery", delivery);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-6-1");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-6-1";
        } else {
            return "mypage/OrderAndDeliveryDetail";
        }
    }

    //취소
	@RequestMapping(value = "/MyPage/OrderCancel")
    public String myPageOrderChangeCancel(HttpSession session,Model model,HttpServletRequest request,@RequestParam HashMap params) {
        try{
            Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
            String pstatus = paymentBundleList.get(0).get("payment_status").toString();

            model.addAttribute("paymentBundleList", paymentBundleList);
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("delivery", delivery);
            params.put("code","kcp_bank_code");
            List<Map<String,Object>> getSelectorList = selectorDAO.getSelectorList(params);
            model.addAttribute("getSelectorList",getSelectorList);
   
        }catch (Exception e){
            e.printStackTrace();
        }
        List<Map<String,Object>> paymentBundleList = paymentDAO.getPaymentBundleList(params);
        String pstatus1 = paymentBundleList.get(0).get("payment_status").toString();
        if(pstatus1.equals("M")) {
      	  model.addAttribute("postUrl","/SavePaymentCancelNC"); // 미결제
      }else {
      model.addAttribute("postUrl","/SavePaymentCancel");
      }
        model.addAttribute("leftNavOrder", 6);
       model.addAttribute("style", "mypage-6-1-1");
        
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
        	if(pstatus1.equals("M")) {
        		return "mobile/mypage-6-1-2";//미결제
        		}else {
            return "mobile/mypage-6-1-1";
        	}
        } else {
        	 if(pstatus1.equals("M")) {
        		 return "mypage/mypage-6-1-2";//미결제
             }else {
            	 return "mypage/mypage-6-1-1";
             }
        	
        	
            
        }
    }
	
    //주문상세 무통장
    @RequestMapping(value="/MyPage/OrderAndDeliveryDetailVA")
    public String myPageOrderAndDeliveryDetailVA(Model model) {
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-");
        return "mypage/OrderAndDeliveryDetailVA";
    }
    //취소, 재결제, 교환,반품
    @RequestMapping(value="/MyPage/OrderCancels")
    public String myPageOrderCancels(Model model) {
        model.addAttribute("leftNavOrder", 7);
        model.addAttribute("style", "mypage-7");
        return "mypage/OrderCancels";
    }

    //교환신청
    @RequestMapping(value="/MyPage/OrderChange")
    public String myPageOrderChange(HttpSession session,Model model,HttpServletRequest request,@RequestParam HashMap params) {
        try{
            Map<String,Object> paymentDetail = paymentDAO.getMgPaymentBundleDetail(params);
            params.put("order_no", paymentDetail.get("order_no"));
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("delivery", delivery);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("postUrl","/SaveOrderChange");
        model.addAttribute("leftNavOrder", 7);
        model.addAttribute("style", "mypage-7-1");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-7-1";
        } else {
            return "mypage/OrderChange";
        }
    }
    //반품신청
//    @RequestMapping(value="/MyPage/OrderCancel")
//    public String myPageOrderCancel(HttpSession session,Model model,HttpServletRequest request) {
//        model.addAttribute("leftNavOrder", 7);
//        model.addAttribute("style", "mypage-7-2");
//        return "mypage/OrderCancel";
//    }
    //반품
    @RequestMapping(value="/MyPage/OrderRollback")
    public String myPageOrderRollback(HttpSession session, Model model, HttpServletRequest request, @RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO) {
        try{
            deliveryInfoVO.setDelivery_t_key(t_key);
            deliveryInfoVO.setDelivery_t_url(t_url);
            Map<String,Object> paymentDetail = paymentDAO.getMgPaymentBundleDetail(params);
            params.put("order_no", paymentDetail.get("order_no"));
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("delivery", delivery);

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

            params.put("code","kcp_bank_code");
            List<Map<String,Object>> getSelectorList = selectorDAO.getSelectorList(params);
            model.addAttribute("getSelectorList",getSelectorList);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("postUrl","/SaveOrderRollback");
        model.addAttribute("leftNavOrder", 7);
        model.addAttribute("style", "mypage-7-2");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-7-2";
        } else {
            return "mypage/mypage-7-2";
        }
    }
    //리뷰
    @RequestMapping(value="/MyPage/Reviews")
    public String myPageReviews(@RequestParam HashMap params, Model model, SearchVO searchVO, HttpServletRequest request, HttpSession session) {
    	Device device = DeviceUtils.getCurrentDevice(request);
    	try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("usr_id",userInfo.get("usr_id"));
            if(params.get("end_date") != null && !params.get("end_date").equals("")) {
            	params.put("end_date",params.get("end_date")+" 23:59:59");
            }
            //페이징
            searchVO.setDisplayRowCount(10);
            searchVO.setStaticRowEnd(10);
            searchVO.pageCalculate(reviewDAO.getReviewListCount(params));
            
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            params.put("displayRowCount", searchVO.getDisplayRowCount());
            List<Map<String,Object>> list = reviewDAO.getReviewList(params);

            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 8);
        model.addAttribute("style", "mypage-8");

        if(device.isMobile()){
            return "mobile/mypage-8";
        } else {
        	return "mypage/Reviews";
        }
    }
  //QnA
    @RequestMapping(value="/MyPage/Qna")
    public String myPageQna(@RequestParam HashMap params, Model model, SearchVO searchVO, HttpServletRequest request,
    		HttpSession session,QnaVO qnaVO) {
    	Device device = DeviceUtils.getCurrentDevice(request);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();
    	
    	try {
    		 
    		 qnaVO.setEmail((String)session.getAttribute("email"));
    		 params.put("email",session.getAttribute("email"));
    		
             // 로그인 확인
    		 Map<String,Object> userInfo = userDAO.getLoginUserList(params);
    		 if (!isEmpty(userInfo)) {
    			 resultMap.put("usr_id", userInfo.get("usr_id"));
    		 }
    		 //페이징	 
    		 Integer listCnt = qnaDAO.getQnaListCount(qnaVO);
			 qnaVO.setDisplayRowCount(10);
			 qnaVO.setStaticRowEnd(10);
			 qnaVO.pageCalculate(listCnt);
			 List<Map<String, Object>> list = qnaDAO.getQnaList(qnaVO);
      
             model.addAttribute("list", list);
             model.addAttribute("searchVO", qnaVO);
    		
    	}catch(Exception e){
    		  e.printStackTrace();
    	}

        model.addAttribute("leftNavOrder", 14);
        model.addAttribute("style", "mypage-8");

        if(device.isMobile()){
            return "mobile/mypage-10";
        } else {
        	return "mypage/Qna";
        }
    }
    //자주 구매하는 상품
    @RequestMapping(value="/MyPage/Favorites")
    public String myPageFavorites(@RequestParam HashMap params, ModelMap model, SearchVO searchVO, HttpSession session, HttpServletRequest request) throws Exception {
    	Device device = DeviceUtils.getCurrentDevice(request);
        try {
        	params.put("email", session.getAttribute("email"));
        	searchVO.setDisplayRowCount(10);
        	searchVO.setStaticRowEnd(10);
        	if(device.isMobile()) {
        		searchVO.setDisplayRowCount(1000);
            	searchVO.setStaticRowEnd(1000);	
        	}
        	Integer favCnt = productDAO.getFavoritesProductListCount(params);
        	List<Map<String,Object>> list = null;
        	List<Map<String,Object>> productList = null;
        	if(favCnt > 0) {
        		searchVO.pageCalculate(favCnt);
        		params.put("displayRowCount", searchVO.getDisplayRowCount());
        		params.put("rowStart", searchVO.getRowStart());
                list = productDAO.getFavoritesProductList(params);
        	}else {
        		//상품목록

                searchVO.setDisplayRowCount(8);
                searchVO.setStaticRowEnd(8);

                searchVO.pageCalculate(1);
                searchVO.setProduct_sale_yn("Y");
                searchVO.setProduct_approval_yn("Y");
                productList = productDAO.getProductList(searchVO);
                model.addAttribute("productList", productList);
                model.addAttribute("searchVO", searchVO);
        	}

        	if(list != null) {
	            for(Map<String,Object> map : list) {
	            	map.put("payment_order_quantity",1);
	            	Integer deliveryPayment = deliveryPayment(map);
	                map.put("deliveryPayment",deliveryPayment);
	            }
        	}else {
        		for(Map<String,Object> map : productList) {
	            	map.put("payment_order_quantity",1);
	            	Integer deliveryPayment = deliveryPayment(map);
	                map.put("deliveryPayment",deliveryPayment);
	            }
        	}
            model.addAttribute("list", list);
            model.addAttribute("table_name", "product_payment_history");
            model.addAttribute("Pk", "product_cd");
            model.addAttribute("searchVO", searchVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 9);
        model.addAttribute("style", "mypage-9");
        
        if(device.isMobile()){
            return "mobile/mypage-9";
        } else {
            return "mypage/Favorites";
        }
    }
    //경품 체험
    @RequestMapping(value="/MyPage/GiveawayExperience")
    public String myPageGiveawayExperience(Model model) {
        model.addAttribute("leftNavOrder", 10);
        model.addAttribute("style", "mypage-10");
        return "mypage/GiveawayExperience";
    }
    //경품담청내역
    @RequestMapping(value="/MyPage/GiveawayWinningList")
    public String myPageGiveawayWinningList(Model model, SearchVO searchVO,@RequestParam HashMap params,HttpSession session, HttpServletRequest request) throws SQLException {

    	try {
	        params.put("email",session.getAttribute("email"));
	        Map<String, Object> userInfo = userDAO.getLoginUserList(params);
	        params.put("giveaway_play_user_id",userInfo.get("usr_id"));
	        searchVO.setDisplayRowCount(5);
	        searchVO.setStaticRowEnd(5);
	        searchVO.pageCalculate(giveawayDAO.getUserGiveawayPlayListCount(params));
	        params.put("rowStart",searchVO.getRowStart());
	        params.put("staticRowEnd",searchVO.getStaticRowEnd());
	
	        List<Map<String,Object>> giveawayList = giveawayDAO.getUserGiveawayPlayList(params);
	        model.addAttribute("listCnt", giveawayDAO.getUserGiveawayPlayListCount(params));
	        model.addAttribute("list", giveawayList);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("leftNavOrder", 11);
        model.addAttribute("style", "mypage-11");

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-11";
        } else {
            return "mypage/GiveawayWinningList";
        }
    }
    //경품 참여 정보입력
    @RequestMapping(value="/MyPage/giveawayform")
    public String giveawayform(Model model, @RequestParam HashMap params, HttpServletRequest request,HttpSession session) throws Exception {
        params.put("email",session.getAttribute("email"));
        Map<String, Object> userInfo = userDAO.getLoginUserList(params);
        try {
            if(!isEmpty(userInfo)){
                params.put("giveaway_cd",request.getParameter("giveaway_cd"));
                Map<String,Object> detail = giveawayDAO.getGiveawayDetail(params);
                //배송정보
                params.put("delivery_class",detail.get("giveaway_delivery_class"));
                //배송밥법
                params.put("delivery_type",detail.get("giveaway_delivery_type"));
                //배송비구분
                params.put("delivery_payment_class",detail.get("giveaway_delivery_payment_class"));
                //배송비 구분별 값
                params.put("delivery_payment",detail.get("giveaway_delivery_payment"));
                Map<String,Object> delivery = giveawayDelivery(params);
                //주문번호 생성
                model.addAttribute("order_no","GW-ORDER-"+numberGender.numberGen(6,1) );
                //최근 배송지 불러오기
                params.put("order_user_id",userInfo.get("usr_id"));
                Map<String,Object> latestDelivery = deliveryDAO.getDeliveryLatest(params);
                model.addAttribute("userInfo",userInfo );
                model.addAttribute("postUrl","/SaveDeliveInfo" );
                model.addAttribute("delivery",delivery );
                model.addAttribute("latestDelivery",latestDelivery );
                model.addAttribute("detail",detail );
                model.addAttribute("giveaway_cd",params.get("giveaway_cd") );
                model.addAttribute("giveaway_play_cd",params.get("giveaway_play_cd") );
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("style", "mypage-4-2-1");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-4-2-1";
        } else{
            return "giveaway/giveawayform";
        }
    }
    //경품 결제
    @RequestMapping(value="/MyPage/giveawaypayment")
    public String giveawaypayment(Model model, @RequestParam HashMap params, HttpServletRequest request,HttpSession session) throws Exception {

        try{
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            params.put("giveaway_cd",delivery.get("giveaway_cd"));
            params.put("product_cd",delivery.get("product_cd"));
            Map<String,Object> detail = giveawayDAO.getGiveawayDetail(params);
            
            //과세구분
            String giveaway_tex_class = (String)detail.get("giveaway_tex_class");
            //경품추첨가
            Integer texA = (Integer) detail.get("giveaway_play_winner_point");
            //시가(원조이몰이익10%뺀가격)
            double texB = Math.round(texA/1.1);
            //공급가액
            double texC= giveaway_tex_class.contains("A") ? Math.round(texB/1.1) : texB;
            //부가세
            double texD = texB - texC;
            //기타소득세
            double texE = Math.round(texC*0.2);
            //주민세
            double texF = Math.round(texC*0.02);

            double sum=0;
            
            if(giveaway_tex_class.contains("A")) {
            	if(texA > 50000) {
            		sum = texD+texE+texF;
            	}else {
            		sum = texD;
            	}
            }else {
            	if(texA > 50000) {
            		sum = texE+texF;
            	}else {
            		sum = 0;
            	}
            }
            
            int texSum = Integer.parseInt(String.valueOf(Math.round(sum)));
//            Integer texSumOut = Integer.parseInt(texSum);

            model.addAttribute("postUrl", "/SavePayment");
            model.addAttribute("texSum", texSum);
            model.addAttribute("delivery", delivery);
            model.addAttribute("detail", detail);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-4-2-2");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-4-2-2";
        } else{
            return "mypage/GiveawayPayment";
        }

    }
    //회원정보 변경 비번확인
    @RequestMapping(value="/MyPage/mypage-12")
    public String myPageModifyUserInfo(Model model, HttpServletRequest request) {
        model.addAttribute("leftNavOrder", 12);
        model.addAttribute("style", "mypage-12");
        model.addAttribute("postUrl", "/sign/passcheck");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-12";
        } else {
            return "mypage/mypage-12";
        }
    }
    //회원정보 변경
    @RequestMapping(value="/MyPage/mypage-12-1")
    public String myPageModifyUserInfoForm(Model model, HttpServletRequest request,@RequestParam HashMap params, HttpSession session) {
        model.addAttribute("leftNavOrder", 12);
        model.addAttribute("style", "mypage-12-1");
        model.addAttribute("postUrl", "/sign/modifyuser");
        Device device = DeviceUtils.getCurrentDevice(request);
        try {
	        params.put("email",session.getAttribute("email"));
	        Map<String,Object> userInfo = userDAO.getLoginUserList(params);
	        model.addAttribute("userInfo", userInfo);
        }catch (Exception e) {
        	e.printStackTrace();
		}
        if(device.isMobile()){
            return "mobile/mypage-12-1";
        } else {
            return "mypage/mypage-12-1";
        }
    }
    //회원정보 탈퇴
    @RequestMapping(value="/MyPage/ModifyUserInfoExit")
    public String myPageModifyUserInfoExit(Model model) {
        model.addAttribute("leftNavOrder", 12);
        model.addAttribute("style", "mypage-12-1-1");
        return "mypage/ModifyUserInfoExit";
    }
    //배송지 변경
    @RequestMapping(value="/MyPage/DeliveryAddress")
    public String myPageDeliveryAddress(@RequestParam HashMap params, Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
    	 try {
    		params.put("email", session.getAttribute("email"));
    		params.put("international", 'A');

            List<Map<String, Object>> list = deliveryDAO.getUserDeliveryList(params);
            model.addAttribute("list", list);

             model.addAttribute("searchVO", searchVO);
             model.addAttribute("table_name", "payment");
             model.addAttribute("Pk", "payment_cd");
         } catch (Exception e) {
             e.printStackTrace();
         }
        model.addAttribute("leftNavOrder", 13);
        model.addAttribute("style", "mypage-13");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-13";
        } else {
            return "mypage/DeliveryAddress";
        }
    }
  //새 배송지 등록 모바일
    @RequestMapping(value="/MyPage/DeliveryAddressInsert")
    public String myPageDeliveryAddressInsert(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-13-1";
        } else {
            return "/";
        }
    }
  //새 배송지 등록 모바일 해외
    @RequestMapping(value="/MyPage/DeliveryAddressInsertForeign")
    public String myPageDeliveryAddressInsertForeign(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-13-f-1";
        } else {
            return "/";
        }
    }
  //배송지 수정 모바일
    @RequestMapping(value="/MyPage/DeliveryAddressUpdate")
    public String myPageDeliveryAddressUpdate(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-13-2";
        } else {
            return "/";
        }
    }
  //배송지 수정 모바일 해외
    @RequestMapping(value="/MyPage/DeliveryAddressUpdateForeign")
    public String myPageDeliveryAddressUpdateForeign(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-13-f-2";
        } else {
            return "/";
        }
    }
  //배송지 변경해외
    @RequestMapping(value="/MyPage/DeliveryAddressForeign")
    public String myPageDeliveryAddressForeign(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVO) {
    	 try {
    		Map<String, Object> params = new HashMap<String, Object>();
    		params.put("email", session.getAttribute("email"));
    		params.put("international", 'C');
     		List<Map<String, Object>> list = deliveryDAO.getUserDeliveryList(params);

             model.addAttribute("list", list);
             model.addAttribute("searchVO", searchVO);
             model.addAttribute("table_name", "payment");
             model.addAttribute("Pk", "payment_cd");
         } catch (Exception e) {
             e.printStackTrace();
         }
        model.addAttribute("leftNavOrder", 13);
        model.addAttribute("style", "mypage-13");
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-13-f";
        } else {
            return "mypage/DeliveryAddressForeign";
        }
    }
    //교환권 상세
    @RequestMapping(value="/MyPage/OrderChangeDetail")
    public String myPageOrderChangeDetail(Model model) {
        model.addAttribute("style", "mypage-6");
        return "mypage/OrderChangeDetail";
    }

    //배송정보 출력
    public Map<String ,Object> giveawayDelivery(HashMap params)throws SQLException {

        //배송방법이 없으면 입력값 고정 출력
        if (params.get("delivery_class").equals("F")) {
            //관리자가 설정한 기본 배송방법
            params.put("selector", "기본배송");
        } else {
            //배송방법이 개별이면 사용자 선택
            String splitString = (String) params.get("delivery_type");//배송방법
            String[] splitArray = splitString.split("\\|");
            //관리자가 지정한 배송방법을 출력해준다 경품 상품 모두 동일한 코드사용
            params.put("code", "product_delivery_type");
            params.put("code_values", splitArray);
            List<Map<String, Object>> selector = selectorDAO.getSelector(params);
            params.put("selector", selector);
        }

        return params;
    }
  //배송비
    public Integer deliveryPayment( Map<String,Object> params)throws IOException {
        Integer deliveryPayment=0;
        try{
            //배송방법이 없으면 입력값 고정 출력
            if(params.get("product_delivery_class").equals("F") ){
                deliveryPayment=0;
            }else {
                //배송방법이 개별이면 사용자 선택
                String splitString = (String)params.get("product_delivery_type");//배송방법
                String[] splitArray = splitString.split( "\\|");
                //관리자가 지정한 배송방법을 출력해준다 경품 상품 모두 동일한 코드사용
                params.put("code","product_delivery_type");
                params.put("code_values",splitArray);
                List<Map<String,Object>> selector = selectorDAO.getSelector(params);
                params.put("selector",selector);
            }

            //관리자가 지정한 배송구분별 배송비용을 출력한다.
            String splitDeliveryPaymentString=String.valueOf(params.get("product_delivery_payment"));//구분별 배송비
            String delivery_payment_class = (String) params.get("product_delivery_payment_class");
            Integer product_payment =Integer.parseInt(String.valueOf(params.get("product_payment")));
            Integer product_kg = Integer.parseInt((String)params.get("product_kg"));
            Integer payment_order_quantity = Integer.parseInt(String.valueOf(params.get("payment_order_quantity")));
            if ("T".equals(delivery_payment_class)) {
                deliveryPayment=0;
            } else if ("R".equals(delivery_payment_class)) {
                deliveryPayment = Integer.parseInt(splitDeliveryPaymentString);
            } else if ("M".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeM = splitDeliveryPaymentString.split("\\|");
                if(product_payment <= Integer.parseInt(splitDeliveryTypeM[0])){
                    deliveryPayment = Integer.parseInt(splitDeliveryTypeM[1]);
                }
            } else if ("D".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeD = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeD.length; i++) {
                    if(product_payment <= Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[0]) && product_payment > Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[2]);
                    }
                }
            } else if ("W".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeW = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeW.length; i++) {
                    if(product_kg >= Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[0]) && product_kg > Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[2]);
                    }
                }

            } else if ("C".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeC = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeC.length; i++) {
                    if(payment_order_quantity >= Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[0]) && payment_order_quantity > Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[2]);
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return deliveryPayment;
    }
    
    //자동발급조건체크
    public boolean couponConditionCheck(Map<String,Object> coupon, Integer user_id) {
    	boolean isCondition = false;
    	String couponConditionType = (String)coupon.get("coupon_condition");
    	Map<String,Object> userInfo = userDAO.getUserConditionInfo(user_id);
    	
    	switch(couponConditionType) {
    	case "T": break;
    	case "L": break;
    	case "M": break;
    	case "J": 
    		Date userReg = (Date)userInfo.get("reg_date");
    		Date couponReg = (Date)coupon.get("reg_date");
    		if(userReg.compareTo(couponReg) > 0) isCondition = true;
    		break;
    		
    	case "D": break;
    	case "B": break;
    	case "R": break;
		case "C": break;
		case "F": break;
		case "S": break;
    	}
    	
    	return isCondition;
    }

    //마이페이지 - sns 공유 내역
	@RequestMapping(value="/MyPage/mypage-share")
    public String myPageShare(@RequestParam HashMap params, Model model, SearchVO searchVO, HttpServletRequest request, HttpSession session) {
    	Device device = DeviceUtils.getCurrentDevice(request);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> error = new HashMap<String, Object>();

    	try {
    		params.put("email", session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("usr_id", userInfo.get("usr_id"));
            List<Map<String,Object>> list = myPageDAO.getMyPageSnsShareList(params);

			model.addAttribute("list", list);

    	}catch(Exception e){
    		  e.printStackTrace();
    	}

        model.addAttribute("leftNavOrder", 15);
        model.addAttribute("style", "mypage-6");

        if(device.isMobile()){
            return "mobile/mypage-share";
        } else {
        	return "mypage/mypage-share";
        }
    }

}
