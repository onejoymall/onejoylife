package com.webapp.manager.dao;

import com.webapp.board.common.SearchVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class CategoryDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getCategoryList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategoryList = sql.selectList("mall.CategoryMapper.getCategoryList",params);
        return getCategoryList;
    }
    public List<Map<String, Object>> getCategorySubList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategorySubList = sql.selectList("mall.CategoryMapper.getCategorySubList",params);
        return getCategorySubList;
    }
    public List<Map<String, Object>> getCategoryThirdList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategoryThirdList = sql.selectList("mall.CategoryMapper.getCategoryThirdList",params);
        return getCategoryThirdList;
    }
}
