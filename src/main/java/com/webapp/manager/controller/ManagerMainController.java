package com.webapp.manager.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.common.SearchVO;
import com.webapp.mall.dao.PaymentDAO;

@Controller
public class ManagerMainController {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    @Autowired
    private PaymentDAO paymentDAO;
    @RequestMapping(value = "/Manager/ManagerMain")
    public String ManagerMain(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try{
            //공지사항
            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used("9");
            searchVO.setBgno("9");
            searchVO.setDisplayRowCount(8);
            searchVO.setStaticRowEnd(8);
            searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

            List<?> listview  = boardSvc.selectBoardList(searchVO);

            model.addAttribute("noticeListView", listview);


            //1:1
            bgInfo = boardGroupSvc.selectBoardGroupOne4Used("15");
            searchVO.setBgno("9");
            searchVO.setDisplayRowCount(8);
            searchVO.setStaticRowEnd(8);
            searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

            List<?> listOneOne  = boardSvc.selectBoardList(searchVO);

            model.addAttribute("listOneOne", listOneOne);


            //현황
            Map<String, String> param = new HashMap<>();
            //입점업체 아이디 파라미터로 던져야함
            model.addAttribute("todaySummary",paymentDAO.getTodaySummary(param));
            model.addAttribute("lastMonthSummary",paymentDAO.getLastMonthSummary(param));
            
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("bgInfo", bgInfo);
        }catch (Exception e){

        }
        model.addAttribute("topNav",1);
        model.addAttribute("today",new Date());
        model.addAttribute("style","index-admin");
        return "/manager/ManagerMain";
    }
}
