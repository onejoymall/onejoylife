package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
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
    public void insertDelivery(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        sql.insert("mall.DeliveryMapper.insertDelivery",deliveryInfoVO);
    }
    public Map<String,Object> getDelivery(Map<String,Object> paramas) throws SQLException{
        Map<String,Object> getDelivery=sql.selectOne("mall.DeliveryMapper.getDelivery",paramas);
        return getDelivery;
    }
}
