package com.webapp.manager.dao;

import com.webapp.manager.vo.MgDeliveryVO;
import com.webapp.manager.vo.StoreVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
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
}
