package com.webapp.board.app;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;

@Controller 
public class BoardCtr {

    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/Board/boardList")
     public String boardList(SearchVO searchVO, ModelMap modelMap,HttpServletRequest request ) {

         BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(searchVO.getBgno());
         if (bgInfo == null) {
             return "board/BoardGroupFail";
         }
         if(searchVO.getDisplayRowCount()==null || searchVO.getDisplayRowCount() < 10){
             searchVO.setDisplayRowCount(10);
         }
         searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

         List<?> listview  = boardSvc.selectBoardList(searchVO);

         modelMap.addAttribute("listview", listview);
         modelMap.addAttribute("searchVO", searchVO);
         modelMap.addAttribute("bgInfo", bgInfo);
         modelMap.addAttribute("leftNavOrder", request.getParameter("bgno"));
         modelMap.addAttribute("style", "help-7");

         Device device = DeviceUtils.getCurrentDevice(request);
         if(device.isMobile()){
             return "mobile/help-7";
         } else {
             return "board/BoardList";
         }

     }

    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/Board/boardForm")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String bgno = request.getParameter("bgno");
        String brdno = request.getParameter("brdno");
        
        if (brdno != null) {
            BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
            List<?> listview = boardSvc.selectBoard8FileList(brdno);
        
            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listview", listview);
            bgno = boardInfo.getBgno();
        }
        BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(bgno);
        if (bgInfo == null) {
            return "board/BoardGroupFail";
        }
        modelMap.addAttribute("style", "help-4");
        modelMap.addAttribute("leftNavOrder", bgno);
        modelMap.addAttribute("bgno", bgno);
        modelMap.addAttribute("bgInfo", bgInfo);
        
        return "board/BoardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/Board/boardSave")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) {
        String[] fileno = request.getParameterValues("fileno");
        
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),"");

        boardSvc.insertBoard(boardInfo, filelist, fileno);

        return "redirect:/Board/boardList?bgno=" + boardInfo.getBgno();
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/Board/boardRead")
    public String board8Read(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        
        boardSvc.updateBoard8Read(brdno);
        BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
        List<?> listview = boardSvc.selectBoard8FileList(brdno);
        List<?> replylist = boardSvc.selectBoard8ReplyList(brdno);

        BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(boardInfo.getBgno());
        if (bgInfo == null) {
            return "board/BoardGroupFail";
        }
        
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("replylist", replylist);
        modelMap.addAttribute("bgInfo", bgInfo);
        
        return "board/BoardRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/Board/boardDelete")
    public String boardDelete(HttpServletRequest request) {
        String brdno = request.getParameter("brdno");
        String bgno = request.getParameter("bgno");
        
        boardSvc.deleteBoardOne(brdno);
        
        return "redirect:/boardList?bgno=" + bgno;
    }

    /* ===================================================================== */
    
    /**
     * 댓글 저장.
     */
    @RequestMapping(value = "/Board/boardReplySave")
    public String board8ReplySave(HttpServletRequest request, BoardReplyVO boardReplyInfo, ModelMap modelMap) {
        
        boardSvc.insertBoardReply(boardReplyInfo);

        modelMap.addAttribute("replyInfo", boardReplyInfo);
        
        return "board8/BoardReadAjaxReply";
    }
    
    /**
     * 댓글 삭제.
     */
    @RequestMapping(value = "/Board/boardReplyDelete")
    public void board8ReplyDelete(HttpServletResponse response, BoardReplyVO boardReplyInfo) {
        
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=UTF-8");
        
        try {
            if (!boardSvc.deleteBoard8Reply(boardReplyInfo.getReno()) ) {
                response.getWriter().print(mapper.writeValueAsString("Fail"));
            } else {
                response.getWriter().print(mapper.writeValueAsString("OK"));
            }
        } catch (IOException ex) {
            System.out.println("오류: 댓글 삭제에 문제가 발생했습니다.");
        }
    }
   
}
