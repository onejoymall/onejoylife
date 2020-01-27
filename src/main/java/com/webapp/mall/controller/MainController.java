package com.webapp.mall.controller;

import com.webapp.common.security.model.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("/")
public class MainController {
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    public String mallMain(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();
        try{
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("login");
//            param.put("USR_ID","") //사용자조회시 사용
//            userList = userDAO.getUserList(params);
            model.addAttribute("style", "index");
            model.addAttribute("footerScript", "main");
            model.addAttribute("loginStatus",obj);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "mall/main";
    }
}
