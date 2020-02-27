package com.webapp.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class ManagerSingController {
    // 로그아웃 하는 부분
    @RequestMapping(value="/Manager/ManagerSign/ManagerLogOut")
    public String ManagerLoginOut(HttpSession session) {
        session.invalidate(); // 세션 초기화
        return "redirect:/Manager/ManagerSign/ManagerLogin"; // 로그아웃 후 로그인화면으로 이동
    }
    @RequestMapping(value = "/Manager/ManagerSign/ManagerLogin", method = RequestMethod.GET, produces = "application/json")
    public String ManagerLogin(@RequestParam HashMap params, ModelMap model, HttpServletRequest request) throws Exception {
        String returnString ="manager/managerSign/managerLogin";
        try{
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("managerLogin");
            if ( obj != null ){
                returnString ="redirect:/Manager/ManagerMain";
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "login-admin");
        model.addAttribute("postUrl","/Manager/ManagerSign/ManagerLoginProc");
        return returnString;
    }
}
