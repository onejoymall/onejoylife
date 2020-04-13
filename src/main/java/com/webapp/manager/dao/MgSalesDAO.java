package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.board.common.SearchVO;

@Repository
public class MgSalesDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getCategorySalesList(HashMap params) throws SQLException {
        List<Map<String, Object>> getCategorySalesList = sql.selectList("mall.MgSalesMapper.getCategorySalesList",params);
        return getCategorySalesList;
    }
    public Integer getCategorySalesListCount(HashMap params) throws SQLException{
        Integer getCategorySalesListCount =sql.selectOne("mall.MgSalesMapper.getCategorySalesListCount",params);
        return getCategorySalesListCount;
    }
    public List<Map<String, Object>> getCategorySalesUserList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getCategorySalesUserList = sql.selectList("mall.MgSalesMapper.getCategorySalesUserList",params);
    	return getCategorySalesUserList;
    }
    public Integer getCategorySalesUserListCount(SearchVO params) throws SQLException{
    	Integer getCategorySalesUserListCount =sql.selectOne("mall.MgSalesMapper.getCategorySalesUserListCount",params);
    	return getCategorySalesUserListCount;
    }
    public List<Map<String, Object>> getCategorySalesPaymethodList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getCategorySalesPaymethodList = sql.selectList("mall.MgSalesMapper.getCategorySalesPaymethodList",params);
    	return getCategorySalesPaymethodList;
    }
    public Integer getCategorySalesPaymethodListCount(SearchVO params) throws SQLException{
    	Integer getCategorySalesPaymethodListCount =sql.selectOne("mall.MgSalesMapper.getCategorySalesPaymethodListCount",params);
    	return getCategorySalesPaymethodListCount;
    }
}
