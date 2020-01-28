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
public class ManagerMainController {
    @RequestMapping(value = "/Manager/ManagerMain")
    public String ManagerMain(@RequestParam HashMap params, ModelMap model) throws Exception {
        return "/manager/ManagerMain";
    }
}
