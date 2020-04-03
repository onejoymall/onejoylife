package com.webapp.mall.controller;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.common.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class Help {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    //회원정보 변경
    @RequestMapping(value="/Help/csinfo")
    public String helpCsInfo(Model model) {
        model.addAttribute("style", "help-1");
        model.addAttribute("leftNavOrder", "1");
        return "help/csinfo";
    }
    //포인트 사용안내
    @RequestMapping(value="/Help/usePointGuid")
    public String helpUsePointGuid(Model model) {
        model.addAttribute("style", "help-2");
        model.addAttribute("leftNavOrder", "2");
        return "help/usePointGuid";
    }
    //포인트 사용안내
    @RequestMapping(value="/Help/faqCenter")
    public String helpFaqCenter(Model model) {
        model.addAttribute("style", "help-3");
        model.addAttribute("leftNavOrder", "3");
        return "help/faqCenter";
    }
    //1:1 문의
    @RequestMapping(value="/Help/csBoard")
    public String helpCsBoard(Model modelMap, SearchVO searchVO, HttpServletRequest request) {

        BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used("15");
        if (bgInfo == null) {
            return "board/BoardGroupFail";
        }

        modelMap.addAttribute("bgno", 15);
        modelMap.addAttribute("bgInfo", bgInfo);

        modelMap.addAttribute("style", "help-4");
        modelMap.addAttribute("leftNavOrder", "4");
        return "help/csboard";
    }
    //1:1 문의 완료
    @RequestMapping(value="/Help/csBoardDone")
    public String helpCsDone(Model model) {
        model.addAttribute("style", "help-4-1");
        model.addAttribute("leftNavOrder", "4");
        return "help/csBoardDone";
    }
    //고객센터 전화번호 안내
    @RequestMapping(value="/Help/csCenter")
    public String helpCsCenter(Model model) {
        model.addAttribute("style", "help-5");
        model.addAttribute("leftNavOrder", "5");
        return "help/cscenter";
    }
}
