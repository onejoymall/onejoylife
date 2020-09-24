package com.webapp.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardReplyVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MgBoardController {
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    @Value("${downloadPath}")
    private String downloadPath;
    /**
     * 리스트.
     */
    @RequestMapping(value = "/Manager/boardList")
    public String boardList(BoardVO boardVO, SearchVO searchVO, ModelMap modelMap,HttpServletRequest request) throws Exception{
        String returnString="";

        try{
            HttpSession session = request.getSession();
            if(session.getAttribute("adminLogin").equals("manager")) {
                boardVO.setStore_id((String) session.getAttribute("email"));
            }
            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(boardVO.getBgno());
            if (bgInfo == null) {
                return "manager/mgboard/BoardGroupFail";
            }
            if(boardVO.getDisplayRowCount()==null || boardVO.getDisplayRowCount() < 10){
            	boardVO.setDisplayRowCount(10);
            }
            boardVO.pageCalculate( boardSvc.selectBoardCount(boardVO) ); // startRow, endRow

            List<?> listview  = boardSvc.selectMgBoardList(boardVO);

            modelMap.addAttribute("listview", listview);
            modelMap.addAttribute("searchVO", boardVO);
            modelMap.addAttribute("bgInfo", bgInfo);
            modelMap.addAttribute("leftNavOrder", request.getParameter("bgno"));
            modelMap.addAttribute("table_name", "TBL_BOARD");
            modelMap.addAttribute("Pk", "BRDNO");
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

    @RequestMapping(value = "/Manager/boardList2", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public HashMap<String, Object> boardList2(BoardVO boardVO, SearchVO searchVO, ModelMap modelMap,HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try{
            HttpSession session = request.getSession();
            if(session.getAttribute("adminLogin").equals("manager")) {
                boardVO.setStore_id((String) session.getAttribute("email"));
            }
            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(boardVO.getBgno());
            if(boardVO.getDisplayRowCount()==null || boardVO.getDisplayRowCount() < 10){
            	boardVO.setDisplayRowCount(10);
            }
            boardVO.pageCalculate( boardSvc.selectBoardCount(boardVO) ); // startRow, endRow

            List<?> list = boardSvc.selectMgBoardListToast(boardVO);

            resultMap.put("list",list);

        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
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
    public String boardSave(@RequestParam HashMap params, HttpServletRequest request, BoardVO boardInfo,BoardReplyVO boardReplyInfo,FileVO fileVO) throws Exception{
        String[] fileno = request.getParameterValues("fileno");

        try{
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = null;
            if(boardInfo.getUploadfile() != null) {
            	filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"board");
            }

            boardInfo.setStore_id((String) params.get("product_store_id"));
            boardInfo.setSupplier_cd((String) params.get("product_supplier"));
            boardSvc.insertBoard(boardInfo, filelist, fileno, boardInfo, fileVO);

            if(boardInfo.getBgtype()!=null){
                if(boardInfo.getBgtype().equals("faq")){
                    boardReplyInfo.setBrdno(boardInfo.getBrdno());
                    boardSvc.insertBoardReply(boardReplyInfo);
                    if(boardInfo.getReno()!=null){
                        boardReplyInfo.setReno(boardInfo.getReno());
                    }
                    boardReplyInfo.setRewriter(boardInfo.getBrdwriter());
                    boardReplyInfo.setRedeleteflag("N");
                    BoardVO boardInfoManNo  = boardSvc.selectBoardMaxOne(boardInfo.getBgno());
                    boardReplyInfo.setBrdno(boardInfoManNo.getBrdno());
                    boardSvc.insertBoardReply(boardReplyInfo);
                }
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
