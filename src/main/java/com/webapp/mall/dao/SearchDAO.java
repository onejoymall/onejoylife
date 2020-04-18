package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.TodayVO;
import com.webapp.manager.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class SearchDAO {
    @Autowired
    private SqlSession sql;

    public List<Map<String, Object>> getSearchProductList(SearchVO searchVO) throws SQLException {
        List<Map<String, Object>> getSearchProductList = sql.selectList("mall.SearchMapper.getSearchProductList",searchVO);
        return getSearchProductList;
    }
    public Integer getSearchProductListCount(SearchVO searchVO) throws SQLException {
        Integer getSearchProductListCount=sql.selectOne("mall.SearchMapper.getSearchProductListCount",searchVO);
        return getSearchProductListCount;
    }
}