package com.webapp.mall.controller;

import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    MessageSource messageSource;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private UserDAO userDAO;
    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = "application/json")
    public String mallLogin(@RequestParam HashMap params, ModelMap model) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();
        try{
//            param.put("USR_ID","") //사용자조회시 사용
//            userList = userDAO.getUserList(params);
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "login");

        return "mall/login";
    }
    @RequestMapping(value = "/signup")
    public String mallSignup(@RequestParam HashMap params, ModelMap model) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();

        try{
            //
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "joinform");

        return "mall/signup";
    }

}
