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
    public List<Map<String, Object>> getUserSalesList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getUserSalesList = sql.selectList("mall.MgSalesMapper.getUserSalesList",params);
    	return getUserSalesList;
    }
    public Integer getUserSalesListCount(SearchVO params) throws SQLException{
    	Integer getUserSalesListCount =sql.selectOne("mall.MgSalesMapper.getUserSalesListCount",params);
    	return getUserSalesListCount;
    }
    public List<Map<String, Object>> getPaymethodSalesList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getPaymethodSalesList = sql.selectList("mall.MgSalesMapper.getPaymethodSalesList",params);
    	return getPaymethodSalesList;
    }
    public Integer getPaymethodSalesListCount(SearchVO params) throws SQLException{
    	Integer getPaymethodSalesListCount =sql.selectOne("mall.MgSalesMapper.getPaymethodSalesListCount",params);
    	return getPaymethodSalesListCount;
    }
    public List<Map<String, Object>> getDateSalesList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getDateSalesList = sql.selectList("mall.MgSalesMapper.getDateSalesList",params);
    	return getDateSalesList;
    }
    public Integer getDateSalesListCount(SearchVO params) throws SQLException{
    	Integer getDateSalesListCount =sql.selectOne("mall.MgSalesMapper.getDateSalesListCount",params);
    	return getDateSalesListCount;
    }
    public List<Map<String, Object>> getWeekSalesList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getWeekSalesList = sql.selectList("mall.MgSalesMapper.getWeekSalesList",params);
    	return getWeekSalesList;
    }
    public Integer getWeekSalesListCount(SearchVO params) throws SQLException{
    	Integer getWeekSalesListCount =sql.selectOne("mall.MgSalesMapper.getWeekSalesListCount",params);
    	return getWeekSalesListCount;
    }
    public List<Map<String, Object>> getMonthSalesList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getMonthSalesList = sql.selectList("mall.MgSalesMapper.getMonthSalesList",params);
    	return getMonthSalesList;
    }
    public Integer getMonthSalesListCount(SearchVO params) throws SQLException{
    	Integer getMonthSalesListCount =sql.selectOne("mall.MgSalesMapper.getMonthSalesListCount",params);
    	return getMonthSalesListCount;
    }
    public List<Map<String, Object>> getTopCategorySalesList(HashMap params) throws SQLException {
        List<Map<String, Object>> getTopCategorySalesList = sql.selectList("mall.MgSalesMapper.getTopCategorySalesList",params);
        return getTopCategorySalesList;
    }
    public Integer getTopCategorySalesListCount(HashMap params) throws SQLException{
        Integer getTopCategorySalesListCount =sql.selectOne("mall.MgSalesMapper.getTopCategorySalesListCount",params);
        return getTopCategorySalesListCount;
    }
    public List<Map<String, Object>> getTopProductSalesList(SearchVO params) throws SQLException {
    	List<Map<String, Object>> getTopProductSalesList = sql.selectList("mall.MgSalesMapper.getTopProductSalesList",params);
    	return getTopProductSalesList;
    }
    public Integer getTopProductSalesListCount(SearchVO params) throws SQLException{
    	Integer getTopProductSalesListCount =sql.selectOne("mall.MgSalesMapper.getTopProductSalesListCount",params);
    	return getTopProductSalesListCount;
    }
}
