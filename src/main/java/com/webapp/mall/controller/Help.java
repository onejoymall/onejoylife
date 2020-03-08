package com.webapp.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Help {
    //회원정보 변경
    @RequestMapping(value="/Help/csinfo")
    public String myPageModifyUserInfo(Model model) {
        model.addAttribute("style", "help-1");
        return "help/csinfo";
    }
}
