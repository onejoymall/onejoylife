package com.webapp.mall.controller;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.common.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class Help {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    //회원정보 변경
    @RequestMapping(value="/Help/csinfo")
    public String helpCsInfo(Model model, HttpServletRequest request) {
        model.addAttribute("style", "help-1");
        model.addAttribute("leftNavOrder", "1");

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/help-1";
        } else {
            return "help/csinfo";
        }
    }
    //포인트 사용안내
    @RequestMapping(value="/Help/usePointGuid")
    public String helpUsePointGuid(Model model, HttpServletRequest request) {
        model.addAttribute("style", "help-2");
        model.addAttribute("leftNavOrder", "2");

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/help-2";
        } else {
            return "help/usePointGuid";
        }
    }
    //FAQ
    @RequestMapping(value="/Help/faqCenter")
    public String helpFaqCenter(@RequestParam HashMap params, Model model, HttpServletRequest request, SearchVO searchVO) {

        BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used("16");
        searchVO.setBgno("16");
        searchVO.setDisplayRowCount(10);
        searchVO.setStaticRowEnd(10);
        searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow
        List<?> listview  = boardSvc.selectBoardList(searchVO);

        model.addAttribute("listview", listview);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("bgInfo", bgInfo);


        model.addAttribute("style", "help-3");
        model.addAttribute("leftNavOrder", "7");

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/help-3";
        } else {
            return "help/faqCenter";
        }

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
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/help-4-2";
        } else {
            return "help/csboard";
        }
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
    public String helpCsCenter(Model model, HttpServletRequest request) {
        model.addAttribute("style", "help-5");
        model.addAttribute("leftNavOrder", "5");

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/help-5";
        } else {
            return "help/cscenter";
        }
    }
}
