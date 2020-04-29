package com.webapp.manager.controller;

import com.webapp.board.app.*;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@Controller
public class MgBoardController {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    /**
     * 리스트.
     */
    @RequestMapping(value = "/Manager/boardList")
    public String boardList(SearchVO searchVO, ModelMap modelMap,HttpServletRequest request) throws Exception{
        String returnString="";
        try{

            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(searchVO.getBgno());
            if (bgInfo == null) {
                return "manager/mgboard/BoardGroupFail";
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

            if(bgInfo.getBgtype().isEmpty()){
                modelMap.addAttribute("style", "cs-qna");
                returnString = "manager/mgboard/BoardList";

            }
            if(bgInfo.getBgtype().equals("1:1")){
                modelMap.addAttribute("style", "cs-qna");
                returnString = "manager/cs-qna";

            }else if(bgInfo.getBgtype().equals("faq")){
                modelMap.addAttribute("style", "cs-faq");
                returnString = "manager/cs-faq";

            }else{
                modelMap.addAttribute("style", "cs-qna");
                returnString = "manager/mgboard/BoardList";
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return returnString;
    }

    /**
     * 글 쓰기.
     */
    @RequestMapping(value = "/Manager/boardForm")
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
            return "manager/mgboard/BoardGroupFail";
        }
        modelMap.addAttribute("style", "help-4");
        modelMap.addAttribute("leftNavOrder", bgno);
        modelMap.addAttribute("bgno", bgno);
        modelMap.addAttribute("bgInfo", bgInfo);

        return "manager/mgboard/BoardForm";
    }

    /**
     * 글 저장.
     */
    @RequestMapping(value = "/Manager/boardSave")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo,BoardReplyVO boardReplyInfo) throws Exception{
        String[] fileno = request.getParameterValues("fileno");
        try{
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),"");

            boardSvc.insertBoard(boardInfo, filelist, fileno);
            if(boardInfo.getBgtype()!=null || boardInfo.getBgtype().equals("faq")){
                if(boardInfo.getReno()!=null){
                    boardReplyInfo.setReno(boardInfo.getReno());
                }
                boardReplyInfo.setRewriter(boardInfo.getBrdwriter());
                boardReplyInfo.setRedeleteflag("N");
                BoardVO boardInfoManNo  = boardSvc.selectBoardMaxOne(boardInfo.getBgno());
                boardReplyInfo.setBrdno(boardInfoManNo.getBrdno());
                boardSvc.insertBoardReply(boardReplyInfo);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/Manager/boardList?bgno=" + boardInfo.getBgno();
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/Manager/boardRead")
    public String board8Read(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");

        boardSvc.updateBoard8Read(brdno);
        BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
        List<?> listview = boardSvc.selectBoard8FileList(brdno);
        List<?> replylist = boardSvc.selectBoard8ReplyList(brdno);

        BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(boardInfo.getBgno());
        if (bgInfo == null) {
            return "manager/mgboard/BoardGroupFail";
        }
        modelMap.addAttribute("style", "help-4");
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("replylist", replylist);
        modelMap.addAttribute("bgInfo", bgInfo);

        return "manager/mgboard/BoardRead";
    }

    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/Manager/boardDelete")
    public String boardDelete(HttpServletRequest request) {
        String brdno = request.getParameter("brdno");
        String bgno = request.getParameter("bgno");

        boardSvc.deleteBoardOne(brdno);

        return "redirect:/Manager/boardList?bgno=" + bgno;
    }

    /* ===================================================================== */

    /**
     * 댓글 저장.
     */
    @RequestMapping(value = "/Manager/boardReplySave")
    public String board8ReplySave(HttpServletRequest request, BoardReplyVO boardReplyInfo, ModelMap modelMap) {

        boardSvc.insertBoardReply(boardReplyInfo);

        modelMap.addAttribute("replyInfo", boardReplyInfo);

        return "manager/mgboard/BoardReadAjaxReply";
    }

    /**
     * 댓글 삭제.
     */
    @RequestMapping(value = "/Manager/boardReplyDelete")
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
            System.out.println("오류: 답변 삭제에 문제가 발생했습니다.");
        }
    }
}
