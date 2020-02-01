package com.webapp.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class CouponDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getCouponList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCouponList = sql.selectList("mall.CouponMapper.getCouponList",params);
        return getCouponList;
    }

    public List<Map<String, Object>> getUserCouponList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getUserCouponList = sql.selectList("mall.CouponMapper.getUserCouponList",params);
        return getUserCouponList;
    }
    public Map<String, Object> getCouponListCount(Map<String, String> params) throws SQLException {
        Map<String, Object> getCouponListCount=sql.selectOne("mall.CouponMapper.getCouponListCount",params);
        return getCouponListCount;
    }
    public Map<String, Object> getUserCouponListCount(Map<String, String> params) throws SQLException {
        Map<String, Object> getUserCouponListCount=sql.selectOne("mall.CouponMapper.getUserCouponListCount",params);
        return getUserCouponListCount;
    }
    public int insertCoupon(Map<String, String> params) throws SQLException {
        int insertCoupon = sql.insert("mall.CouponMapper.insertCoupon",params);
        return insertCoupon;
    }
    public int insertCouponPaidHistory(Map<String, String> params) throws SQLException {
        int insertCouponPaidHistory = sql.insert("mall.CouponMapper.insertCouponPaidHistory",params);
        return insertCouponPaidHistory;
    }
    public int updateCoupon(Map<String, String> params) throws SQLException {
        int updateCoupon = sql.update("mall.CouponMapper.updateCoupon",params);
        return updateCoupon;
    }
    public int deleteCoupon(Map<String, String> params) throws SQLException {
        int deleteCoupon = sql.delete("mall.CouponMapper.deleteCoupon",params);
        return deleteCoupon;
    }

}
