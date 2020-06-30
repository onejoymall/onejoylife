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

    public List<Map<String, Object>> getUserCouponList(Map<String, Object> params) throws SQLException {
        List<Map<String, Object>> getUserCouponList = sql.selectList("mall.CouponMapper.getUserCouponList",params);
        return getUserCouponList;
    }
    public Integer getCouponListCount(Map<String, String> params) throws SQLException {
    	Integer getCouponListCount=sql.selectOne("mall.CouponMapper.getCouponListCount",params);
        return getCouponListCount;
    }
    public List<Map<String, Object>> getUserDownloadCouponList(Map<String, String> params) throws SQLException {
    	List<Map<String, Object>> getUserDownloadCouponList = sql.selectList("mall.CouponMapper.getUserDownloadCouponList",params);
    	return getUserDownloadCouponList;
    }
    public Integer getUserDownloadCouponListCount(Map<String, String> params) throws SQLException {
    	Integer getUserDownloadCouponListCount=sql.selectOne("mall.CouponMapper.getUserDownloadCouponListCount",params);
    	return getUserDownloadCouponListCount;
    }
    public Integer getUserCouponListCount(Map<String, String> params) throws SQLException {
    	Integer getUserCouponListCount=sql.selectOne("mall.CouponMapper.getUserCouponListCount",params);
        return getUserCouponListCount;
    }
    public Map<String, Object> getCouponDetail(Map<String, String> params) throws SQLException {
        Map<String, Object> getCouponDetail=sql.selectOne("mall.CouponMapper.getCouponDetail",params);
        return getCouponDetail;
    }
    public int insertCoupon(Map<String, String> params) throws SQLException {
        int insertCoupon = sql.insert("mall.CouponMapper.insertCoupon",params);
        return insertCoupon;
    }
    public int insertCouponPaidHistory(Map<String, String> params) throws SQLException {
        int insertCouponPaidHistory = sql.insert("mall.CouponMapper.insertCouponPaidHistory",params);
        return insertCouponPaidHistory;
    }
    public int updateCouponHistory(Map<String, Object> params) throws SQLException {
        int updateCouponHistory = sql.update("mall.CouponMapper.updateCouponHistory",params);
        return updateCouponHistory;
    }
    public int deleteCoupon(Map<String, String> params) throws SQLException {
        int deleteCoupon = sql.delete("mall.CouponMapper.deleteCoupon",params);
        return deleteCoupon;
    }

}
