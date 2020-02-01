package com.webapp.mall.dao;

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

    public List<Map<String, Object>> getProductList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getProductList = sql.selectList("mall.ProductMapper.getProductList",params);
        return getProductList;
    }
    public Map<String, Object> getProductListCount(Map<String, String> params) throws SQLException {
        Map<String, Object> getProductListCount=sql.selectOne("mall.ProductMapper.getProductListCount",params);
        return getProductListCount;
    }
    public List<Map<String, Object>> getUserProductPaymentList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getUserProductPaymentList = sql.selectList("mall.ProductMapper.getUserProductPaymentList",params);
        return getUserProductPaymentList;
    }
    public Map<String, Object> getUserProductPaymentListCount(Map<String, String> params) throws SQLException {
        Map<String, Object> getUserProductPaymentListCount=sql.selectOne("mall.ProductMapper.getUserProductPaymentListCount",params);
        return getUserProductPaymentListCount;
    }
    public int insertProduct(Map<String, String> params) throws SQLException {
        int insertProduct = sql.insert("mall.ProductMapper.insertProduct",params);
        return insertProduct;
    }
    public int insertProductPaymentHistory(Map<String, String> params) throws SQLException {
        int insertProductPaymentHistory = sql.insert("mall.ProductMapper.insertProductPaymentHistory",params);
        return insertProductPaymentHistory;
    }
    public int updateProduct(Map<String, String> params) throws SQLException {
        int updateProduct = sql.update("mall.ProductMapper.updateProduct",params);
        return updateProduct;
    }
    public int deleteProduct(Map<String, String> params) throws SQLException {
        int deleteProduct = sql.delete("mall.ProductMapper.deleteProduct",params);
        return deleteProduct;
    }
    public int deleteProductPaymentHistory(Map<String, String> params) throws SQLException {
        int deleteProductPaymentHistory = sql.delete("mall.ProductMapper.deleteProductPaymentHistory",params);
        return deleteProductPaymentHistory;
    }
}
