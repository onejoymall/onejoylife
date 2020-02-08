package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.mall.dao.GivewayDAO;
import com.webapp.mall.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Arrays;
@Controller
public class GiveawayController {
    @Autowired
    UserDAO userDAO;
    @Autowired
    GivewayDAO givewayDAO;
    @Autowired
    SelectorDAO selectorDAO;
    //경품 목록
    @RequestMapping(value="/giveaway")
    public String giveawayList(Model model, HttpSession session, HashMap params, SearchVO searchVO) {
        try{
            //사용자 아이디 확인 후 전달
//            params.put("email",session.getAttribute("email"));
//            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
//            params.put("point_paid_user_id",userInfo.get("usr_id"));

//            searchVO.setStaticRowEnd(9);

            searchVO.pageCalculate(givewayDAO.getGivewayListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = givewayDAO.getGivewayList(params);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "epoint-gift");
        return "giveaway/giveawaylist";
    }
    //경품 상세333
    @RequestMapping(value="/giveaway/giveawaydetail",method = RequestMethod.GET)
    public String giveawayDetail(Model model, HashMap params, HttpServletRequest request) throws SQLException {
        params.put("giveway_id",request.getParameter("giveway_id"));
        Map<String,Object> detail = givewayDAO.getGivewayDetail(params);
        String splitString =(String)detail.get("giveway_delivery_type");
        String[] splitArray = splitString.split( "\\|");
        params.put("code","product_delivery_type");
        params.put("code_values",splitArray);
        Map<String,Object> selector = selectorDAO.getSelector(params);
        model.addAttribute("style", "gift-view");

        model.addAttribute("detail", detail);
        return "giveaway/giveawaydetail";
    }
}
