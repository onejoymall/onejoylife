package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.TodayVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getProductTodayList(TodayVO todayVO) throws SQLException {
        List<Map<String, Object>> getProductTodayList = sql.selectList("mall.ProductMapper.getProductTodayList",todayVO);
        return getProductTodayList;
    }
    public List<Map<String, Object>> getProductList(SearchVO searchVO) throws SQLException {
        List<Map<String, Object>> getProductList = sql.selectList("mall.ProductMapper.getProductList",searchVO);
        return getProductList;
    }
    public Integer getProductListCount(SearchVO searchVO) throws SQLException {
        Integer getProductListCount=sql.selectOne("mall.ProductMapper.getProductListCount",searchVO);
        return getProductListCount;
    }
    public List<Map<String, Object>> getFavoritesProductList(Map<String,Object> params) throws SQLException {
    	List<Map<String, Object>> getFavoritesProductList = sql.selectList("mall.ProductMapper.getFavoritesProductList",params);
    	return getFavoritesProductList;
    }
    public Integer getFavoritesProductListCount(Map<String,Object> params) throws SQLException {
    	Integer getFavoritesProductListCount=sql.selectOne("mall.ProductMapper.getFavoritesProductListCount",params);
    	return getFavoritesProductListCount;
    }
    public Map<String,Object> getProductViewDetail(Map<String,Object> params) throws SQLException {
        Map<String,Object> getProductViewDetail=sql.selectOne("mall.ProductMapper.getProductViewDetail",params);
        return getProductViewDetail;
    }

    public List<Map<String, Object>> getMgProductList(SearchVO searchVO) throws SQLException {
        List<Map<String, Object>> getMgProductList = sql.selectList("mall.ProductMapper.getMgProductList",searchVO);
        return getMgProductList;
    }
    public Integer getMgProductListCount(SearchVO searchVO) throws SQLException {
        Integer getMgProductListCount=sql.selectOne("mall.ProductMapper.getMgProductListCount",searchVO);
        return getMgProductListCount;
    }

}
