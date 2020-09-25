package com.webapp.board.app;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webapp.mall.dao.UserDAO;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import static org.springframework.util.CollectionUtils.isEmpty;
@Controller 
public class BoardCtr {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    @Value("${downloadPath}")
    private String downloadPath;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/Board/boardList")
     public String boardList(@RequestParam HashMap params, BoardVO boardVO, ModelMap modelMap, HttpServletRequest request, HttpSession session )throws Exception {
        String returnString="";
        try{
            params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
          //  Map<String,Object> userInfo = userDAO.getLoginUserList1(params);
            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used(boardVO.getBgno());
            if(!isEmpty(userInfo)){
                if(bgInfo.getBgtype().equals("1:1")) {
                    boardVO.setUsr_id((Integer) userInfo.get("usr_id"));
                }
            }
            if (bgInfo == null) {
                return "board/BoardGroupFail";
            }
            if(boardVO.getDisplayRowCount()==null || boardVO.getDisplayRowCount() < 10){
                boardVO.setDisplayRowCount(10);
            }
            boardVO.setStaticRowEnd(10);
            boardVO.pageCalculate( boardSvc.selectBoardCount(boardVO) ); // startRow, endRow

            List<?> listview  = boardSvc.selectBoardList(boardVO);

            modelMap.addAttribute("listview", listview);
            modelMap.addAttribute("searchVO", boardVO);
            modelMap.addAttribute("bgInfo", bgInfo);
            modelMap.addAttribute("leftNavOrder", request.getParameter("bgno"));

            if(bgInfo.getBgtype().equals("1:1")){
                if(isEmpty(userInfo)) {
                    returnString = "help/help-4-2";
                }else{
                    returnString = "help/help-4-2-u";
                }
                modelMap.addAttribute("style", "help-4-2");
            }else{
                returnString ="board/BoardList";
                modelMap.addAttribute("style", "help-7");
            }
            Device device = DeviceUtils.getCurrentDevice(request);
            if(device.isMobile()){
                returnString ="mobile/help-7";
            } else {
                returnString =returnString;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnString;
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
    public String boardSave(HttpServletRequest request, BoardVO boardInfo, HttpSession session,HashMap params,FileVO fileVO)throws Exception{
        try{
            params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){

            }else{
                boardInfo.setUsr_id((Integer)userInfo.get("usr_id"));
            }

            String[] fileno = request.getParameterValues("fileno");
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"question");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
			
            fileVO.setFileorder(1);
			fileVO.setFilepath("/fileupload/question/" + ft.format(new Date()) + "/");
            
            boardSvc.insertBoard(boardInfo, filelist, fileno, boardInfo, fileVO);
               
        }catch (Exception e){
            e.printStackTrace();
        }
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
            System.out.println("오류: 답변 삭제에 문제가 발생했습니다.");
        }
    }
   
}
