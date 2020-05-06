package com.webapp.mall.dao;

import com.webapp.board.common.FileVO;
import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.mall.vo.DeliveryInfoVO;
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
    public void paymentOrders( List<Map<String, Object>> bundlelist, Map<String, Object> params) throws SQLException {

        for(Map<String, Object> c : bundlelist){
            c.put("payment_cd", params.get("payment_cd"));
            c.put("order_no", params.get("order_no"));
            c.put("payment_type_cd", params.get("payment_type_cd"));
            sql.insert("mall.PaymentMapper.paymentOrders", c);
        }
    }
    public void updateGiveawayDeliveryStatus(Map<String,Object> params) throws SQLException {
        sql.update("mall.PaymentMapper.updateGiveawayDeliveryStatus",params);
    }
    public void updatePayment(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        sql.update("mall.PaymentMapper.updatePayment",deliveryInfoVO);
    }
    public void updatePaymentManger(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        sql.update("mall.PaymentMapper.updatePaymentManger",deliveryInfoVO);
    }
    public List<Map<String, Object>> getPaymentList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getPaymentList = sql.selectList("mall.PaymentMapper.getPaymentList",params);
        return getPaymentList;
    }
    public Map<String,Object> getPaymentDetail(Map<String, String> params) throws SQLException{
        Map<String,Object> getPaymentDetail = sql.selectOne("mall.PaymentMapper.getPaymentDetail",params);
        return getPaymentDetail;
    }
    public Map<String,Object> getTodaySummary(Map<String, String> params) throws SQLException{
    	Map<String,Object> getTodaySummary = sql.selectOne("mall.PaymentMapper.getTodaySummary",params);
    	return getTodaySummary;
    }
    public Map<String,Object> getLastMonthSummary(Map<String, String> params) throws SQLException{
    	Map<String,Object> getLastMonthSummary = sql.selectOne("mall.PaymentMapper.getLastMonthSummary",params);
    	return getLastMonthSummary;
    }
    public Map<String,Object> getStatusCount(Map<String, String> params) throws SQLException{
    	Map<String,Object> getStatusCount = sql.selectOne("mall.PaymentMapper.getStatusCount",params);
    	return getStatusCount;
    }
    public Integer getPaymentListCount(Map<String, String> params) throws SQLException {
        Integer getPaymentListCount=sql.selectOne("mall.PaymentMapper.getPaymentListCount",params);
        return getPaymentListCount;
    }
    public void insertPaymentRefund(DeliveryInfoVO deliveryInfoVO)throws SQLException {
        sql.insert("mall.PaymentMapper.insertPaymentRefund",deliveryInfoVO);
    }
}
