package com.webapp.manager.controller;

import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.common.SearchVO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.vo.MgDeliveryVO;
import com.webapp.manager.vo.MgOptionVO;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MgSystemController {
    @Autowired
    private MgSystemDAO mgSystemDAO;
    //배송관리
    @RequestMapping(value = "/Manager/Delivery")
    public String MgDelivery(@RequestParam HashMap params, ModelMap model, MgDeliveryVO mgDeliveryVO, HttpSession session) throws Exception {
        Object adminLogin = session.getAttribute("adminLogin");
        try {
            if(adminLogin.equals("admin")){
                mgDeliveryVO.setStore_id("admin");
            }
            Map<String,Object> detail = mgSystemDAO.getSystemDelivery(mgDeliveryVO);
            model.addAttribute("detail", detail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "goods-add");
        return "manager/system/delivery";
    }
    
    //지역별 배송비 관리
    @RequestMapping(value = "/Manager/Delivery-area")
    public String MgDeliveryArea(@RequestParam HashMap params, ModelMap model, MgDeliveryVO mgDeliveryVO, HttpSession session) throws Exception {
        Object adminLogin = session.getAttribute("adminLogin");
        try {
            if(adminLogin.equals("admin")){
                mgDeliveryVO.setStore_id("admin");
            }
            Map<String,Object> detail = mgSystemDAO.getSystemDelivery(mgDeliveryVO);
            model.addAttribute("detail", detail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "goods-add");
        return "manager/system/delivery-area";
    }
}
