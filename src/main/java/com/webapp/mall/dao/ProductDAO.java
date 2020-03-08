package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDAO {
    @Autowired
    private SqlSession sql;

    public List<Map<String, Object>> getProductList(SearchVO searchVO) throws SQLException {
        List<Map<String, Object>> getProductList = sql.selectList("mall.ProductMapper.getProductList",searchVO);
        return getProductList;
    }
    public Integer getProductListCount(SearchVO searchVO) throws SQLException {
        Integer getProductListCount=sql.selectOne("mall.ProductMapper.getProductListCount",searchVO);
        return getProductListCount;
    }
    public Map<String,Object> getProductViewDetail(Map<String,Object> params) throws SQLException {
        Map<String,Object> getProductViewDetail=sql.selectOne("mall.ProductMapper.getProductViewDetail",params);
        return getProductViewDetail;
    }
}
