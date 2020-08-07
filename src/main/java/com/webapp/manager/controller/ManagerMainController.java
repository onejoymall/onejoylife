package com.webapp.manager.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.app.BoardVO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.manager.dao.StoreInfoDAO;
import com.webapp.manager.vo.StoreVO;

@Controller
public class ManagerMainController {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    @Autowired
    private PaymentDAO paymentDAO;
    @Autowired
    private StoreInfoDAO storeInfoDAO;
    @RequestMapping(value = "/Manager/ManagerMain")
    public String ManagerMain(@RequestParam HashMap params, ModelMap model, BoardVO searchVO,StoreVO storeVO,HttpSession session) throws Exception {
        try{
        	//입점 업체 정보 
	    	storeVO.setStore_id((String)session.getAttribute("email"));
			Map<String,Object> info = storeInfoDAO.getStoreInfo(storeVO);
			model.addAttribute("info", info);

        	
            //공지사항
            if(session.getAttribute("adminLogin").equals("manager")) {
                searchVO.setStore_id((String) session.getAttribute("email"));
            }
            //날짜 계산
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DAY_OF_MONTH, 0);
            String nowday = format.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH, -3);
            String newday = format.format(cal.getTime());

            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used("9");
            searchVO.setBgno("9");
            searchVO.setDisplayRowCount(8);
            searchVO.setStaticRowEnd(8);
            searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

            List<?> listview  = boardSvc.selectBoardList(searchVO);
            model.addAttribute("nowday", nowday);
            model.addAttribute("newday", newday);
            model.addAttribute("noticeListView", listview);


            //1:1
            bgInfo = boardGroupSvc.selectBoardGroupOne4Used("15");
            searchVO.setBgno("15");
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
        	e.printStackTrace();
        }
        model.addAttribute("topNav",1);
        model.addAttribute("today",new Date());
        model.addAttribute("style","index-admin");
        return "/manager/ManagerMain";
    }
}
