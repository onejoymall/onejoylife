package com.webapp.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class PaymentDAO {
    @Autowired
    private SqlSession sql;

    public void insertPayment(Map<String,Object> params) throws SQLException {
        sql.insert("mall.PaymentMapper.insertPayment",params);
    }
    public void updateGiveawayDeliveryStatus(Map<String,Object> params) throws SQLException {
        sql.update("mall.PaymentMapper.updateGiveawayDeliveryStatus",params);
    }
    public List<Map<String, Object>> getPaymentList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getPaymentList = sql.selectList("mall.PaymentMapper.getPaymentList",params);
        return getPaymentList;
    }

    public Integer getPaymentListCount(Map<String, String> params) throws SQLException {
        Integer getPaymentListCount=sql.selectOne("mall.PaymentMapper.getPaymentListCount",params);
        return getPaymentListCount;
    }
}
