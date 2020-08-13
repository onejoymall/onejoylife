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
import com.webapp.manager.vo.TaxVO;

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
    public void updatePaymentBundle(DeliveryInfoVO deliveryInfoVO) throws SQLException {
    	sql.update("mall.PaymentMapper.updatePaymentBundle",deliveryInfoVO);
    }
    public void updatePaymentManger(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        sql.update("mall.PaymentMapper.updatePaymentManger",deliveryInfoVO);
    }
    public void updatePaymentBundleManger(DeliveryInfoVO deliveryInfoVO) throws SQLException {
    	sql.update("mall.PaymentMapper.updatePaymentBundleManger",deliveryInfoVO);
    }
    public void updatePaymentBundleCancel(DeliveryInfoVO deliveryInfoVO) throws SQLException {
    	sql.update("mall.PaymentMapper.updatePaymentBundleCancel",deliveryInfoVO);
    }
    public List<Map<String, Object>> getPaymentList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getPaymentList = sql.selectList("mall.PaymentMapper.getPaymentList",params);
        return getPaymentList;
    }
    public Map<String, Object> getPaymentListChk(Map<String, String> params) throws SQLException {
        Map<String, Object> getPaymentListChk = sql.selectOne("mall.PaymentMapper.getPaymentListChk",params);
        return getPaymentListChk;
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
    public Map<String,Object> getUserPaymentStatusCount(Map<String, String> params) throws SQLException{
    	Map<String,Object> getUserPaymentStatusCount = sql.selectOne("mall.PaymentMapper.getUserPaymentStatusCount",params);
    	return getUserPaymentStatusCount;
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
			map.put("product_cd",cartPaymentVO.getProduct_cds()[i]);
			map.put("payment_cd",cartPaymentVO.getPayment_cd());
			map.put("order_no",cartPaymentVO.getOrder_no());
			map.put("cart_cd",cartPaymentVO.getChk()[i]);
			map.put("payment_type_cd",cartPaymentVO.getPayment_type_cd());
			map.put("payment_order_quantity",cartPaymentVO.getPayment_order_quantity()[i]);
			map.put("coupon_cd",cartPaymentVO.getCoupon_cd()[i].trim());
			map.put("option_name",cartPaymentVO.getOption_name()[i].trim());
			map.put("coupon_discount",cartPaymentVO.getCoupon_discount()[i].trim());
			map.put("payment_status",cartPaymentVO.getPayment_status());
            sql.insert("mall.PaymentMapper.insertBundle", map);
        }
	}
	public List<Map<String, Object>> getPaymentBundleList(HashMap params) {
		List<Map<String, Object>> getPaymentBundle = sql.selectList("mall.PaymentMapper.getPaymentBundleList",params);
        return getPaymentBundle;
	}
	public void insertTaxinvoiceHistory(TaxVO taxVO) {
		sql.insert("mall.PaymentMapper.insertTaxinvoiceHistory",taxVO);
	}
	public Integer getMgPaymentBundleListCount(HashMap params) {
		Integer getMgPaymentBundleListCount=sql.selectOne("mall.PaymentMapper.getMgPaymentBundleListCount",params);
        return getMgPaymentBundleListCount;
	}
	public List<Map<String, Object>> getMgPaymentBundleList(HashMap params) {
		List<Map<String, Object>> getMgPaymentBundleList = sql.selectList("mall.PaymentMapper.getMgPaymentBundleList",params);
        return getMgPaymentBundleList;
	}
	public Map<String, Object> getMgPaymentBundleDetail(HashMap params) {
		Map<String, Object> getMgPaymentBundleDetail = sql.selectOne("mall.PaymentMapper.getMgPaymentBundleDetail",params);
        return getMgPaymentBundleDetail;
	}
	public List<Map<String, Object>> getUserPaymentBundleList(HashMap params) {
		List<Map<String, Object>> getUserPaymentBundleList = sql.selectList("mall.PaymentMapper.getUserPaymentBundleList",params);
        return getUserPaymentBundleList;
	}
	public Integer getUserPaymentBundleListCount(HashMap params) {
		Integer getUserPaymentBundleListCount = sql.selectOne("mall.PaymentMapper.getUserPaymentBundleListCount",params);
		return getUserPaymentBundleListCount;
	}
	public void insertStoreTaxinvoiceHistory(TaxVO taxVO) {
		sql.insert("mall.PaymentMapper.insertStoreTaxinvoiceHistory",taxVO);
	}
	public void updateStoreTaxinvoiceHistory(TaxVO taxVO) {
		sql.insert("mall.PaymentMapper.updateStoreTaxinvoiceHistory",taxVO);
	}
	   public List<Map<String, Object>> getStoreInvoiceList(Map<String, String> params) throws SQLException {
	        List<Map<String, Object>> getStoreInvoiceList = sql.selectList("mall.PaymentMapper.getStoreInvoiceList",params);
	        return getStoreInvoiceList;
	    }
	
	
}
