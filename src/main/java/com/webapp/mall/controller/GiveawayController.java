package com.webapp.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GiveawayController {
    //경품 목록
    @RequestMapping(value="/giveaway")
    public String giveawayList(Model model) {
        model.addAttribute("style", "epoint-gift");
        return "giveaway/giveawaylist";
    }
    //경품 상세
    @RequestMapping(value="/giveaway/giveawaydetail")
    public String giveawayDetail(Model model) {

        model.addAttribute("style", "gift-view");
        return "giveaway/giveawaydetail";
    }
}
