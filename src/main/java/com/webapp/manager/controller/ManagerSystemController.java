package com.webapp.manager.controller;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.app.BoardVO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.vo.MgSystemVO;
import com.webapp.manager.vo.MgUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ManagerSystemController {

    @Autowired
    private MgSystemDAO mgSystemDAO;
    //회원 로그인 이력 관리
    @RequestMapping(value = "/Manager/systemHistory")
    public String managerMemberLoginHistory(@RequestParam HashMap params, ModelMap model, MgSystemVO mgSystemVO) throws Exception {
        try {

            mgSystemVO.setDisplayRowCount(10);
            mgSystemVO.setStaticRowEnd(10);
            mgSystemVO.pageCalculate(mgSystemDAO.systemHistoryListCount(mgSystemVO));

            List<Map<String,Object>> list = mgSystemDAO.systemHistoryList(mgSystemVO);
            model.addAttribute("searchVO", mgSystemVO);
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "member-management");
//        model.addAttribute("postUrl", "/Manager/member-management");
        return "/manager/system/systemHistory";
    }
}
