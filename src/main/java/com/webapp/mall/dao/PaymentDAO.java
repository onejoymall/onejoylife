package com.webapp.mall.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.mall.vo.DeliveryInfoVO;

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
    public void insertBundle(Map<String,Object> params) throws SQLException {
        sql.insert("mall.PaymentMapper.insertBundle",params);
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
	public void insertCartBundle(CartPaymentVO cartPaymentVO) {
		for(int i=0;i<cartPaymentVO.getChk().length;i++){
			Map<String,Object> map = new HashMap<>();
			map.put("product_cd",cartPaymentVO.getProduct_cd()[i]);
			map.put("payment_cd",cartPaymentVO.getPayment_cd());
			map.put("order_no",cartPaymentVO.getOrder_no());
			map.put("cart_cd",cartPaymentVO.getChk()[i]);
			map.put("payment_type_cd",cartPaymentVO.getPayment_type_cd());
			map.put("payment_order_quantity",cartPaymentVO.getPayment_order_quantity()[i]);
			map.put("coupon_cd",cartPaymentVO.getCoupon_cd()[i]);
            sql.insert("mall.PaymentMapper.insertBundle", map);
            
            //쿠폰사용으로 변경
            if(map.get("coupon_cd") != null && !map.get("coupon_cd").equals("")) {
            	map.put("coupon_paid_user_id",cartPaymentVO.getCart_user_id());
            	sql.update("mall.CouponMapper.updateCouponUse",map);
            }
        }
	}
}
