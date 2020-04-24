package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.board.common.SearchVO;
import com.webapp.manager.vo.CouponVO;

@Repository
public class MgCouponDAO {
    @Autowired
    private SqlSession sql;
//    public List<Map<String, Object>> getReviewList(SearchVO params) throws SQLException {
//        List<Map<String, Object>> getReviewList = sql.selectList("mall.MgReviewMapper.getReviewList",params);
//        return getReviewList;
//    }
    public void insertCoupon(CouponVO couponVO) throws SQLException {
    	sql.insert("mall.MgCouponMapper.insertCoupon", couponVO);
    }
}
