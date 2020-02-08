package com.webapp.board.app;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;

@Controller 
public class Board41Ctr {

    @Autowired
    private Board41Svc boardSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/Board/board41List")
    public String boardList(SearchVO searchVO, ModelMap modelMap) {

        searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

        List<?> listview   = boardSvc.selectBoardList(searchVO);
        
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        return "board4/boardList";
    }
    
    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/Board/board41Form")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        if (brdno != null) {
            BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
            List<?> listview = boardSvc.selectBoard4FileList(brdno);
        
            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listview", listview);
        }
        
        return "board4/boardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/Board/board41Save")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo, HttpSession session) {
        String[] fileno = request.getParameterValues("fileno");
//        boardInfo.setBrdwriter((String)session.getAttribute("email"));
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile());

        boardSvc.insertBoard(boardInfo, filelist, fileno);

        return "redirect:/Board/board41List";
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/Board/board41Read")
    public String board4Read(HttpServletRequest request, ModelMap modelMap) {
        
        String brdno = request.getParameter("brdno");
        
        boardSvc.updateBoard4Read(brdno);
        BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
        List<?> listview = boardSvc.selectBoard4FileList(brdno);
        
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        
        return "board4/boardRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/Board/board41Delete")
    public String boardDelete(HttpServletRequest request) {
        
        String brdno = request.getParameter("brdno");
        
        boardSvc.deleteBoardOne(brdno);
        
        return "redirect:/Board/board41List";
    }

}
