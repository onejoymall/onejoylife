package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class DeliveryDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String,Object>> getDeliveryList(Map<String,Object> paramas) throws SQLException{
        List<Map<String,Object>> getDeliveryList = sql.selectList("mall.DeliveryMapper.getDeliveryList",paramas);
        return getDeliveryList;
    }
    public Integer getDeliveryListCount(Map<String,Object> paramas) throws SQLException{
        return sql.selectOne("mall.DeliveryMapper.getDeliveryListCount", paramas);
    }
    public void insertDeliveryCompany(List<Map<String,Object>> company) throws SQLException {
        for(int i=0; i < company.size(); i++){
            Map<String, Object> map = new HashMap<>();
            map.put("code", company.get(i).get("Code"));
            map.put("name", company.get(i).get("Name"));
            sql.insert("mall.DeliveryMapper.insertDeliveryCompany", map);
        }
    }
    public List<Map<String,Object>> getDeliveryCompanyList(Map<String,Object> paramas) throws SQLException{
        List<Map<String,Object>> getDeliveryCompanyList = sql.selectList("mall.DeliveryMapper.getDeliveryCompanyList",paramas);
        return getDeliveryCompanyList;
    }
    public void insertDelivery(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        sql.insert("mall.DeliveryMapper.insertDelivery",deliveryInfoVO);
    }
    public void updateDelivery(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        sql.insert("mall.DeliveryMapper.updateDelivery",deliveryInfoVO);
    }
    public void updateDeliveryManager(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        sql.update("mall.DeliveryMapper.updateDeliveryManager",deliveryInfoVO);
    }
    public void deleteDelivery(Map<String,Object> paramas) throws SQLException {
    	sql.update("mall.DeliveryMapper.deleteDelivery",paramas);
    }
    public void enabledDefaultDelivery(Map<String,Object> paramas) throws SQLException {
    	sql.update("mall.DeliveryMapper.enabledDefaultDelivery",paramas);
    }
    public void disabledDefaultDelivery(Map<String,Object> paramas) throws SQLException {
    	sql.update("mall.DeliveryMapper.disabledDefaultDelivery",paramas);
    }    
    public void updateDeliveryAddress(Map<String,Object> paramas) throws SQLException {
    	sql.update("mall.DeliveryMapper.updateDeliveryAddress",paramas);
    }
    public void managerAddrmodi(Map<String,Object> paramas) throws SQLException {
    	sql.update("mall.DeliveryMapper.managerAddrmodi",paramas);
    }
    public void insertDeliveryAddress(Map<String,Object> paramas) throws SQLException {
    	sql.update("mall.DeliveryMapper.insertDeliveryAddress",paramas);
    }    
    public Map<String,Object> getDeliveryLatest(Map<String,Object> paramas) throws SQLException{
        Map<String,Object> getDeliveryLatest=sql.selectOne("mall.DeliveryMapper.getDeliveryLatest",paramas);
        return getDeliveryLatest;
    }
    public Map<String,Object> getDeliveryDetail(Map<String, String> params) throws SQLException{
        Map<String,Object> getDeliveryDetail = sql.selectOne("mall.DeliveryMapper.getDeliveryDetail",params);
        return getDeliveryDetail;
    }
    public List<Map<String,Object>> getUserDeliveryList(Map<String,Object> paramas) throws SQLException{
        List<Map<String,Object>> getUserDeliveryList = sql.selectList("mall.DeliveryMapper.getUserDeliveryList",paramas);
        return getUserDeliveryList;
    }
    public Map<String,Object> getDefaultDelivery(Map<String, String> params) throws SQLException{
        Map<String,Object> getDefaultDelivery = sql.selectOne("mall.DeliveryMapper.getDefaultDelivery",params);
        return getDefaultDelivery;
    }
    public Map<String,Object> getLastDelivery(Map<String, String> params) throws SQLException{
    	Map<String,Object> getLastDelivery = sql.selectOne("mall.DeliveryMapper.getLastDelivery",params);
    	return getLastDelivery;
    }
	public Object getUserDeliveryDetail(HashMap params) {
		Map<String,Object> getUserDeliveryDetail = sql.selectOne("mall.DeliveryMapper.getUserDeliveryDetail",params);
        return getUserDeliveryDetail;
	}
    public List<Map<String,Object>> getMyListDelivery(Map<String, String> params) throws SQLException{
    	List<Map<String,Object>> getMyListDelivery = sql.selectList("mall.DeliveryMapper.getMyListDelivery",params);
    	return getMyListDelivery;
    }

    public Map<String,Object> getMyListDelivery2(Map<String, String> params) throws SQLException{
    	Map<String,Object> getMyListDelivery2 = sql.selectOne("mall.DeliveryMapper.getMyListDelivery2",params);
    	return getMyListDelivery2;
    }
	
	
}
