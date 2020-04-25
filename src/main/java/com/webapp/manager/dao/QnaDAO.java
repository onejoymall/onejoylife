package com.webapp.manager.dao;

import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.QnaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class QnaDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getQnaList(QnaVO qnaVO) throws SQLException {
        List<Map<String, Object>> getQnaList = sql.selectList("mall.QnaMapper.getQnaList",qnaVO);
        return getQnaList;
    }

    public Integer getQnaListCount(QnaVO qnaVO) throws SQLException {
        Integer getQnaListCount=sql.selectOne("mall.QnaMapper.getQnaListCount",qnaVO);
        return getQnaListCount;
    }
    public  void insertQna(QnaVO qnaVO) throws SQLException{
        sql.insert("mall.QnaMapper.insertQna",qnaVO);
    }

}
