package com.webapp.mall.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.common.dao.SelectorDAO;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.TodayVO;
import com.webapp.manager.dao.BannerDAO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.MgSystemDAO;
@Controller
public class GiveawayController {
    @Autowired
    UserDAO userDAO;
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    MgSystemDAO mgSystemDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    PointDAO pointDAO;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private BannerDAO bannerDAO;
	
    //경품 목록
    @RequestMapping(value="/giveaway")
    public String giveawayList(Model model, HttpSession session, HashMap params, GiveawayVO giveawayVO,HttpServletRequest request) {
        try{
        	if(giveawayVO.getParti_rate() == null) {
        		giveawayVO.setParti_rate(1);
        	}
            //사용자 아이디 확인 후 전달
//            params.put("email",session.getAttribute("email"));
//            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
//            params.put("point_paid_user_id",userInfo.get("usr_id"));
            if(giveawayVO.getDisplayRowCount()==null || giveawayVO.getDisplayRowCount() < 9){
                giveawayVO.setDisplayRowCount(9);
            }

            // 기본정렬
            if(giveawayVO.getOrderByValue()==null || giveawayVO.getOrderByKey()==null){
                giveawayVO.setOrderByKey("giveaway_id");
                giveawayVO.setOrderByValue("DESC");
            }
            giveawayVO.setGiveaway_use_yn("Y");
            giveawayVO.setGiveaway_sale_yn("Y");
            giveawayVO.pageCalculate(giveawayDAO.getGiveawayListCount(giveawayVO));
            params.put("rowStart",giveawayVO.getRowStart());
            params.put("staticRowEnd",giveawayVO.getStaticRowEnd());
            List<Map<String,Object>> list = giveawayDAO.getGiveawayList(giveawayVO);
            Map<String,Object> categoryRowData = categoryDAO.getCategoryDetail(giveawayVO);
            model.addAttribute("list", list);
            model.addAttribute("categoryRowData",categoryRowData);
            model.addAttribute("searchVO", giveawayVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/epoint-gift";
        } else {
            model.addAttribute("style", "epoint-gift");
            return "giveaway/giveawaylist";
        }


    }
    //경품 상세333
    @RequestMapping(value="/giveaway/giveawaydetail",method = RequestMethod.GET)
    public String giveawayDetail(Model model, @RequestParam HashMap params, TodayVO todayVO, HttpServletRequest request,HttpSession session) throws SQLException {
        try{
            params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(!isEmpty(userInfo)){
                params.put("point_paid_user_id",userInfo.get("usr_id"));
                Integer point = pointDAO.getPointAmount(params);
                model.addAttribute("point_amount",point);
                
                params.put("user_id", userInfo.get("usr_id"));
            }else{
            	params.put("user_id", session.getAttribute("nonMembersUserId"));
            }
            
          //경품 상세페이지 로드시 최근 본 상품 세션에 적용
            if(isEmpty((List<String>)session.getAttribute("todayGiveaway"))){
                todayVO.setProduct_cd_array_string((String)params.get("giveaway_id"));
                session.setAttribute("todayGiveaway",todayVO.getProduct_cd_array());
                
                //최근본상품없으면 prev없이 insert
                Map<String,Object> map = new HashMap<>();
                map.put("giveaway_current",params.get("giveaway_id"));
                map.put("usr_id",params.get("user_id"));
                giveawayDAO.insertGiveawayHistory(map);
            }else{
            	todayVO.setProduct_cd_array((List<String>) session.getAttribute("todayGiveaway"));
            	//최근본상품있으면 이전기록 next 업데이트
                Map<String,Object> map = new HashMap<>();
                map.put("giveaway_current",todayVO.getProduct_cd_array().get(todayVO.getProduct_cd_array().size()-1));
                map.put("giveaway_next",params.get("giveaway_id"));
                map.put("usr_id",params.get("user_id"));
                giveawayDAO.updateGiveawayHistory(map);
                
                map.put("giveaway_prev",todayVO.getProduct_cd_array().get(todayVO.getProduct_cd_array().size()-1));
                map.put("giveaway_current",params.get("giveaway_id"));
                giveawayDAO.insertGiveawayHistory(map);
                
                todayVO.setProduct_cd_array_string((String)params.get("giveaway_id"));
                session.setAttribute("today",todayVO.getProduct_cd_array());
            }
            
            params.put("giveaway_cd",request.getParameter("giveaway_cd"));
            params.put("giveaway_id",request.getParameter("giveaway_id"));
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
            
            model.addAttribute("delivery",delivery);
            model.addAttribute("delivery_type_list", delivery.get("selector"));
            
            //관련상품 (카테고리기준)
            detail.put("rowStart",1);
            detail.put("displayRowCount",8);
            detail.put("product_cts",((String)detail.get("giveaway_ct")).split("\\|"));
            List<Map<String,Object>> relatedProductList = giveawayDAO.relatedGiveawayList(detail);
            model.addAttribute("relatedProductList", relatedProductList);
            
            //함께본상품
            List<Map<String,Object>> serialProductList = giveawayDAO.serialGiveawayList(detail);
            model.addAttribute("serialProductList", serialProductList);
            
          //띠배너
            params.put("banner_type","product_line");
            List<Map<String,Object>> lineBannerList = bannerDAO.getBannerList(params);
            for(Map<String,Object> banner:lineBannerList) {
            	if("H".equals(banner.get("banner_event_type"))) {
            		banner.put("url",banner.get("banner_href"));
            	}else if("P".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product/productDetail?product_cd="+banner.get("banner_product_cd"));
            	}else if("C".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product?product_ct="+banner.get("banner_product_ct"));
            	}
            }
            model.addAttribute("lineBannerList1", lineBannerList.get(0));
            
            model.addAttribute("style", "gift-view");
            model.addAttribute("detail", detail);
            //포인트 확인 url
            model.addAttribute("postUrl", "/giveaway/PointAmountCheckProc");
            
            //상품정보고시
            List<Map<String,Object>> product_definition = null;
            if(detail.get("giveaway_definition_key") != null && !detail.get("giveaway_definition_key").equals("")) {
            	product_definition = new ArrayList<>();
            	String[] product_definition_key = ((String)detail.get("giveaway_definition_key")).split(",");
            	String[] product_definition_val = ((String)detail.get("giveaway_definition_value")).split(",");
            	for(int i=0; i<product_definition_key.length; i++) {
            		Map<String,Object> tmpMap = new HashMap<>();
            		tmpMap.put(product_definition_key[i],product_definition_val[i]);
            		product_definition.add(tmpMap);
            	}
            }else {
            	String[] product_ct_arr = ((String)detail.get("giveaway_ct")).split("\\|");
            	
    			params.put("store_id","admin");
        		Map<String, Object> store_product_definition = null;
        		for(int i=0; i<product_ct_arr.length; i++) {
	        		params.put("product_ct", product_ct_arr[i]);
	        		store_product_definition = mgSystemDAO.getStoreProductDefinition(params);
	        		if(store_product_definition != null) break;
        		}
        		if(store_product_definition != null) {
        			product_definition = new ArrayList<>();
                	String[] product_definition_key = ((String)store_product_definition.get("product_definition_key")).split(",");
                	String[] product_definition_val = ((String)store_product_definition.get("product_definition_value")).split(",");
                	for(int i=0; i<product_definition_key.length; i++) {
                		Map<String,Object> tmpMap = new HashMap<>();
                		tmpMap.put(product_definition_key[i],product_definition_val[i]);
                		product_definition.add(tmpMap);
                	}
        		}
            }
            model.addAttribute("product_definition",product_definition);
        }catch (Exception e){
            e.printStackTrace();
        }

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/gift-view";
        } else {
            return "giveaway/giveawaydetail";
        }
    }

    //배송정보 출력
    public Map<String ,Object> giveawayDelivery(HashMap params)throws SQLException {

        //배송방법이 없으면 입력값 고정 출력
        if(params.get("delivery_class").equals("F") ){
            params.put("selector","기본배송");
        }else {
            //배송방법이 개별이면 사용자 선택
            String splitString = (String)params.get("delivery_type");//배송방법
            String[] splitArray = splitString.split( "\\|");
            //관리자가 지정한 배송방법을 출력해준다 경품 상품 모두 동일한 코드사용
            params.put("code","product_delivery_type");
            params.put("code_values",splitArray);
            List<Map<String,Object>> selector = selectorDAO.getSelector(params);
            params.put("selector",selector);
        }

        //관리자가 지정한 배송구분별 배송비용을 출력한다.
        String splitDeliveryPaymentString=(String)params.get("delivery_payment");//구분별 배송비
        String deliveryPutString="";
        String delivery_payment_class = (String) params.get("delivery_payment_class");
        if ("T".equals(delivery_payment_class)) {
            params.put("delivery_payment", "배송비 무료");
        } else if ("R".equals(delivery_payment_class)) {
            params.put("delivery_payment", "배송비 " + String.format("%,d", Integer.parseInt(splitDeliveryPaymentString)) + "원");
        } else if ("M".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeM = splitDeliveryPaymentString.split("\\|");
            params.put("delivery_payment", "결재금액 "
                    + String.format("%,d", Integer.parseInt(splitDeliveryTypeM[0])) + "원 이하 / 배송비"
                    + String.format("%,d", Integer.parseInt(splitDeliveryTypeM[1])) + " 원");
        } else if ("D".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeD = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeD.length; i++) {
                deliveryPutString += "결재금액 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[0])) + "원 ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[1])) + "원 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        } else if ("W".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeW = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeW.length; i++) {
                deliveryPutString += ""
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[0])) + "kg ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[1])) + "kg 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        } else if ("C".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeC = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeC.length; i++) {
                deliveryPutString += ""
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[0])) + "ea ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[1])) + "ea 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        }
        return params;
    }
}
