package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.CurlPost;
import com.webapp.mall.vo.DeliveryInfoVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PopupController {
    @Value("${t_key}")
    private String t_key;
    @Value("${t_url}")
    private String t_url;
    @RequestMapping("/Popup/DeliverySearch")
    public String mallMain(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO, DeliveryInfoVO deliveryInfoVO) throws Exception {
        deliveryInfoVO.setDelivery_t_key(t_key);
        deliveryInfoVO.setDelivery_t_url(t_url);
        deliveryInfoVO.setDelivery_t_code("22");
        deliveryInfoVO.setDelivery_t_invoice("8054001009376");
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
}
