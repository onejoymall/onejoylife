package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.webapp.manager.vo.MgSystemVO;
import com.webapp.manager.vo.StoreVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.manager.vo.MgDeliveryVO;
import com.webapp.manager.vo.MgProductCodeVO;

@Repository
public class MgSystemDAO {
    @Autowired
    private SqlSession sql;
    @Transactional
    public void insertSystemDelivery(MgDeliveryVO MgDeliveryVO) throws SQLException {
        sql.insert("mall.MgSystemMapper.insertSystemDelivery",MgDeliveryVO);
    }
    public List<Map<String,Object>> systemHistoryList(MgSystemVO mgSystemVO) throws SqlSessionException{
        List<Map<String,Object>> systemHistoryList=sql.selectList("mall.MgSystemMapper.systemHistoryList",mgSystemVO);
        return systemHistoryList;
    }
    public Integer systemHistoryListCount(MgSystemVO mgSystemVO) throws SQLException {
        Integer systemHistoryListCount=sql.selectOne("mall.MgSystemMapper.systemHistoryListCount",mgSystemVO);
        return systemHistoryListCount;
    }
    public void insertSystemHistory(Map<String,Object> params) throws SQLException {
        sql.insert("mall.MgSystemMapper.insertSystemHistory",params);
    }
    public Map<String,Object> getSystemDelivery(MgDeliveryVO MgDeliveryVO) throws SQLException {
        Map<String,Object> getSystemDelivery=sql.selectOne("mall.MgSystemMapper.getSystemDelivery",MgDeliveryVO);
        return getSystemDelivery;
    }
    public Map<String,Object> getStoreDelivery(Map<String,Object> params) throws SQLException {
    	Map<String,Object> getStoreDelivery=sql.selectOne("mall.MgSystemMapper.getStoreDelivery",params);
    	return getStoreDelivery;
    }
    public Map<String,Object> getCartStoreHopeInfo(CartPaymentVO params) throws SQLException {
    	Map<String,Object> getCartStoreHopeInfo=sql.selectOne("mall.MgSystemMapper.getCartStoreHopeInfo",params);
    	return getCartStoreHopeInfo;
    }
    public List<Map<String,Object>> getProductCodeList(MgProductCodeVO mgProductCodeVO) throws SqlSessionException{
        List<Map<String,Object>> getProductCodeList=sql.selectList("mall.MgSystemMapper.getProductCodeList",mgProductCodeVO);
        return getProductCodeList;
    }
    public List<Map<String,Object>> getNormalUserList() throws SqlSessionException{
    	List<Map<String,Object>> getNormalUserList=sql.selectList("mall.MgSystemMapper.getNormalUserList");
    	return getNormalUserList;
    }
    public List<Map<String,Object>> getDeliveryAreaList(Map<String,Object> params) throws SqlSessionException{
    	List<Map<String,Object>> getDeliveryAreaList=sql.selectList("mall.MgSystemMapper.getDeliveryAreaList",params);
    	return getDeliveryAreaList;
    }
    public Integer getDeliveryAreaListCount(Map<String,Object> params) throws SqlSessionException{
    	Integer getDeliveryAreaListCount=sql.selectOne("mall.MgSystemMapper.getDeliveryAreaListCount",params);
    	return getDeliveryAreaListCount;
    }
    public Integer getAdditionalDeliveryPayment(Map<String,Object> params) throws SqlSessionException{
    	Integer getAdditionalDeliveryPayment=sql.selectOne("mall.MgSystemMapper.getAdditionalDeliveryPayment",params);
    	return getAdditionalDeliveryPayment;
    }
    public void insertProductCode(MgProductCodeVO mgProductCodeVO) throws SqlSessionException{
        sql.insert("mall.MgSystemMapper.insertProductCode",mgProductCodeVO);
    }
    public void updateDeliveryArea(Map<String,Object> params) throws SqlSessionException{
    	sql.update("mall.MgSystemMapper.updateDeliveryArea",params);
    }
    public void insertDeliveryArea(Map<String,Object> params) throws SqlSessionException{
    	sql.insert("mall.MgSystemMapper.insertDeliveryArea",params);
    }
	public List<Map<String, Object>> getSupplierList(HashMap params) {
		List<Map<String,Object>> getSupplierList=sql.selectList("mall.MgSystemMapper.getSupplierList",params);
    	return getSupplierList;
	}
}
