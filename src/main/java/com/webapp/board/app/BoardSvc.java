package com.webapp.board.app;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;

@Service
public class BoardSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;
    
	@Value("${downloadPath}")
	private String downloadPath;
	
	
    public Integer selectBoardCount(SearchVO param) {
        return sqlSession.selectOne("selectBoard8Count", param);
    }
    
    public List<?> selectBoardList(SearchVO param) {
        return sqlSession.selectList("selectBoard8List", param);
    }
    public List<?> selectMgBoardList(SearchVO param) {
        return sqlSession.selectList("selectMgBoard8List", param);
    }
    public List<?> selectMgBoardListToast(SearchVO param) {
        return sqlSession.selectList("selectMgBoardListToast", param);
    }
    
    /**
     * 글 저장.
     */
    public void insertBoard(BoardVO param, List<FileVO> filelist, String[] fileno,BoardVO boardInfo,FileVO fileVO) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
        try {
            if (param.getBrdno() == null || "".equals(param.getBrdno())) {
                 sqlSession.insert("insertBoard8", param);
            } else {
                sqlSession.update("updateBoard8", param);
            }
            
            if (fileno != null) {
                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
                fparam.put("fileno", fileno);
                sqlSession.insert("deleteBoard8File", fparam);
            }
            
            if (filelist != null) {
	            for (FileVO f : filelist) {
	                f.setParentPK(param.getBrdno());
	                f.setFilelink(fileVO.getFilepath()+f.getRealname());
	                f.setFileorder(fileVO.getFileorder());
	                
	                sqlSession.insert("insertBoard8File", f);
	            }
            }

            
            
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            System.out.println("데이터 저장 오류: " + ex.toString());
        }            
    }
 
    public BoardVO selectBoardOne(String param) {
        return sqlSession.selectOne("selectBoard8One", param);
    }
    
    public void updateBoard8Read(String param) {
        sqlSession.insert("updateBoard8Read", param);
    }
    
    public void deleteBoardOne(String param) {
        sqlSession.delete("deleteBoard8One", param);
    }
    
    public List<?> selectBoard8FileList(String param) {
        return sqlSession.selectList("selectBoard8FileList", param);
    }
    
    /* =============================================================== */
    public List<?> selectBoard8ReplyList(String param) {
        return sqlSession.selectList("selectBoard8ReplyList", param);
    }
    
    /**
     * 댓글 저장. 
     */
    public void insertBoardReply(BoardReplyVO param) {
        if (param.getReno() == null || "".equals(param.getReno())) {
            if (param.getReparent() != null) {
                BoardReplyVO replyInfo = sqlSession.selectOne("selectBoard8ReplyParent", param.getReparent());
                param.setRedepth(replyInfo.getRedepth());
                param.setReorder(replyInfo.getReorder() + 1);
                sqlSession.selectOne("updateBoard8ReplyOrder", replyInfo);
            } else {
                Integer reorder = sqlSession.selectOne("selectBoard8ReplyMaxOrder", param.getBrdno());
                param.setReorder(reorder);
            }
            
            sqlSession.insert("insertBoard8Reply", param);
        } else {
            sqlSession.insert("updateBoard8Reply", param);
        }
    }   
    
    /**
     * 댓글 삭제.
     * 자식 댓글이 있으면 삭제 안됨. 
     */
    public boolean deleteBoard8Reply(String param) {
        Integer cnt = sqlSession.selectOne("selectBoard8ReplyChild", param);
        
        if ( cnt > 0) {
            return false;
        }
        
        sqlSession.update("updateBoard8ReplyOrder4Delete", param);
        
        sqlSession.delete("deleteBoard8Reply", param);
        
        return true;
    }
    public BoardVO selectBoardMaxOne(String param) {
        return sqlSession.selectOne("selectBoardMaxOne", param);
    }
}
