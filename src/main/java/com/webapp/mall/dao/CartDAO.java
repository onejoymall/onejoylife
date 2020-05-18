package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.CartPaymentVO;
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
    public List<Map<String, Object>> getCartProductList(Map<String, Object> params) throws SQLException {
    	List<Map<String, Object>> getCartProductList = sql.selectList("mall.CartMapper.getCartProductList",params);
    	return getCartProductList;
    }
    public Integer getTopCartListCount(Map<String, String> params) throws SQLException {
        Integer getTopCartListCount=sql.selectOne("mall.CartMapper.getTopCartListCount",params);
        return getTopCartListCount;
    }
    public Integer getCartListCount(Map<String, String> params) throws SQLException {
        Integer getCartListCount=sql.selectOne("mall.CartMapper.getCartListCount",params);
        return getCartListCount;
    }
    public Integer getCartStoreCount(Map<String, String> params) throws SQLException {
    	Integer getCartStoreCount=sql.selectOne("mall.CartMapper.getCartStoreCount",params);
    	return getCartStoreCount;
    }
    public void insertCart(Map<String, String> params) throws Exception{
        sql.insert("mall.CartMapper.insertCart",params);
    }

    public void deleteCart(Map<String, String> params) throws Exception{
        sql.insert("mall.CartMapper.deleteCart",params);
    }

    public void updateCart(Map<String, String> params) throws Exception{
        sql.update("mall.CartMapper.updateCart",params);
    }
    public void updateCartUser(Map<String, String> params) throws Exception{
        sql.update("mall.CartMapper.updateCartUser",params);
    }

    public List<Map<String, Object>> getCartPaymentList(CartPaymentVO cartPaymentVO) throws SQLException {
        List<Map<String, Object>> getCartPaymentList = sql.selectList("mall.CartMapper.getCartPaymentList",cartPaymentVO);
        return getCartPaymentList;
    }

    public void CartPaymentListDelete(CartPaymentVO cartPaymentVO) throws SQLException {
        sql.delete("mall.CartMapper.CartPaymentListDelete",cartPaymentVO);
    }

    public Map<String,Object> getPaymentCartSum(CartPaymentVO cartPaymentVO) throws SQLException{
        Map<String,Object> getPaymentCartSum = sql.selectOne("mall.CartMapper.getPaymentCartSum",cartPaymentVO);
        return getPaymentCartSum;
    }

    public Map<String,Object> getCartSum(Map<String, Object> params) throws SQLException{
        Map<String,Object> getCartSum = sql.selectOne("mall.CartMapper.getCartSum",params);
        return getCartSum;
    }

    public List<Map<String, Object>> getFavoritesList(Map<String, Object> params) throws SQLException {
        List<Map<String, Object>> getFavoritesList = sql.selectList("mall.CartMapper.getFavoritesList",params);
        return getFavoritesList;
    }
    public Integer getFavoritesListCount(Map<String, String> params) throws SQLException {
        Integer getFavoritesListCount=sql.selectOne("mall.CartMapper.getFavoritesListCount",params);
        return getFavoritesListCount;
    }
    public void insertFavorites(Map<String, String> params) throws Exception{
        sql.insert("mall.CartMapper.insertFavorites",params);
    }
    public void deleteFavorite(Map<String, String> params) throws Exception{
        sql.delete("mall.CartMapper.deleteFavorite",params);
    }
    public Map<String,Object> getFavoritesSum(Map<String, Object> params) throws SQLException{
        Map<String,Object> getFavoritesSum = sql.selectOne("mall.CartMapper.getFavoritesSum",params);
        return getFavoritesSum;
    }


}
