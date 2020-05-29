package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.ReviewDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.UserVO;
import org.bouncycastle.math.raw.Mod;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    PaymentDAO PaymentDAO;
    @Autowired
    ReviewDAO reviewDAO;
    
    @RequestMapping("/Popup/DeliverySearch")
    public String mallDeliverySearch(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO, DeliveryInfoVO deliveryInfoVO) throws Exception {
        deliveryInfoVO.setDelivery_t_key(t_key);
        deliveryInfoVO.setDelivery_t_url(t_url);
        Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
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
        model.addAttribute("companyList",company);
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
        return "popup/write-qna";
    }

    @RequestMapping("/Popup/review-write")
    public String writeReview(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO) throws Exception {
    	try {
    		model.addAttribute("productDetail",PaymentDAO.getPaymentDetail(params));
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
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	model.addAttribute("style", "tax-bill");
    	return "popup/tax-withholding";
    }
}
