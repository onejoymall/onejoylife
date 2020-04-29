package com.webapp.manager.dao;

import com.webapp.manager.vo.MgDeliveryVO;
import com.webapp.manager.vo.MgProductCodeVO;
import com.webapp.manager.vo.StoreVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgSystemDAO {
    @Autowired
    private SqlSession sql;
    @Transactional
    public void insertSystemDelivery(MgDeliveryVO MgDeliveryVO) throws SQLException {
        sql.insert("mall.MgSystemMapper.insertSystemDelivery",MgDeliveryVO);
    }
    public Map<String,Object> getSystemDelivery(MgDeliveryVO MgDeliveryVO) throws SQLException {
        Map<String,Object> getSystemDelivery=sql.selectOne("mall.MgSystemMapper.getSystemDelivery",MgDeliveryVO);
        return getSystemDelivery;
    }
    public List<Map<String,Object>> getProductCodeList(MgProductCodeVO mgProductCodeVO) throws SqlSessionException{
        List<Map<String,Object>> getProductCodeList=sql.selectList("mall.MgSystemMapper.getProductCodeList",mgProductCodeVO);
        return getProductCodeList;
    }
    public List<Map<String,Object>> getDeliveryAreaList(Map<String,Object> params) throws SqlSessionException{
    	List<Map<String,Object>> getDeliveryAreaList=sql.selectList("mall.MgSystemMapper.getDeliveryAreaList",params);
    	return getDeliveryAreaList;
    }
    public Integer getDeliveryAreaListCount(Map<String,Object> params) throws SqlSessionException{
    	Integer getDeliveryAreaListCount=sql.selectOne("mall.MgSystemMapper.getDeliveryAreaListCount",params);
    	return getDeliveryAreaListCount;
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
}
