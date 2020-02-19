package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.misc.Contended;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    @Autowired
    ProductDAO productDAO;
    DeliveryDAO deliveryDAO;
    UserDAO userDAO;
    //경품 목록
    @RequestMapping(value="/product")
    public String productList(Model model, HttpSession session, HashMap params, SearchVO searchVO) {
        try{
            //사용자 아이디 확인 후 전달
//            params.put("email",session.getAttribute("email"));
//            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
//            params.put("point_paid_user_id",userInfo.get("usr_id"));

            searchVO.setStaticRowEnd(9);
            searchVO.pageCalculate(productDAO.getProductListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = productDAO.getProductList(params);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "epoint-gift");
        return "product/productList";
    }
}

