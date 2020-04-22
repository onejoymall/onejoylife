package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.board.common.SearchVO;

@Repository
public class MgReviewDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getReviewList(SearchVO params) throws SQLException {
        List<Map<String, Object>> getReviewList = sql.selectList("mall.MgReviewMapper.getReviewList",params);
        return getReviewList;
    }
    public Map<String, Object> getReviewDetail(Map<String, Object> params) throws SQLException {
    	Map<String, Object> getReviewDetail = sql.selectOne("mall.MgReviewMapper.getReviewDetail",params);
    	return getReviewDetail;
    }
    public Integer getReviewListCount(SearchVO params) throws SQLException{
        Integer getReviewListCount =sql.selectOne("mall.MgReviewMapper.getReviewListCount",params);
        return getReviewListCount;
    }
    public void updateAnswer(Map<String, Object> params) throws SQLException {
    	sql.update("mall.MgReviewMapper.updateAnswer", params);
    }
}
