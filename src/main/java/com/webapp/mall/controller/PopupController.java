package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import org.bouncycastle.math.raw.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
    public String mallKakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpSession session,Map params) throws Exception{
        Object siteUrl = request.getRequestURL().toString().replace(request.getRequestURI(),"");
        Map<String, Object> kakaoMap = CurlPost.getAccessToken(code,siteUrl,kakaoClientId,kakaoRedirectUri);
        try {
            if(!isEmpty(kakaoMap)){
                if ( session.getAttribute("login") != null ){
                    // 기존에 login이란 세션 값이 존재한다면
                    session.removeAttribute("login"); // 기존값을 제거해 준다.
                    //기존 로그인 세션을 로그아웃후 다시 sns 로그인 할지여부 협의
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
                }


            }
        }catch (Exception e){
            e.printStackTrace();
        }
       return "popup/kakaologin";
    }
}
