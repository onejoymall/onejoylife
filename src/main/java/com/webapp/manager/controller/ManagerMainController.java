package com.webapp.manager.controller;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.common.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class ManagerMainController {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
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


            model.addAttribute("searchVO", searchVO);
            model.addAttribute("bgInfo", bgInfo);
        }catch (Exception e){

        }
        model.addAttribute("topNav",1);
        model.addAttribute("style","index-admin");
        return "/manager/ManagerMain";
    }
}
