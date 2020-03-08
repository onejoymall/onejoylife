package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class CartDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getCartList(Map<String, Object> params) throws SQLException {
        List<Map<String, Object>> getCartList = sql.selectList("mall.CartMapper.getCartList",params);
        return getCartList;
    }
    public Integer getCartListCount(Map<String, String> params) throws SQLException {
        Integer getCartListCount=sql.selectOne("mall.CartMapper.getCartListCount",params);
        return getCartListCount;
    }
    public void insertCart(Map<String, String> params) throws Exception{
        sql.insert("mall.CartMapper.insertCart",params);
    }
    public void deleteCart(Map<String, String> params) throws Exception{
        sql.insert("mall.CartMapper.deleteCart",params);
    }
    public Map<String,Object> getCartSum(Map<String, Object> params) throws SQLException{
        Map<String,Object> getCartSum = sql.selectOne("mall.CartMapper.getCartSum",params);
        return getCartSum;
    }
}
