package com.webapp.mall.controller;

import com.webapp.common.security.model.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
public class MainController {
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    public String mallMain(@RequestParam HashMap params, ModelMap model, UserInfo userInfo) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();
        try{
//            param.put("USR_ID","") //사용자조회시 사용
//            userList = userDAO.getUserList(params);
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "index");
        model.addAttribute("footerScript", "main");
        return "mall/main";
    }
}
