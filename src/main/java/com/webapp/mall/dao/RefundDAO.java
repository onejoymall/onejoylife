package com.webapp.mall.dao;

import com.webapp.mall.vo.DeliveryInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class RefundDAO {
    @Autowired
    private SqlSession sql;

    public Integer insertDeliveryRefund(DeliveryInfoVO deliveryInfoVO) throws SQLException{
        return sql.selectOne("mall.RefundMapper.insertDeliveryRefund", deliveryInfoVO);
    }
    public List<Map<String, Object>> getDeliveryRefundList(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        List<Map<String, Object>> getDeliveryRefundList = sql.selectList("mall.RefundMapper.getDeliveryRefundList",deliveryInfoVO);
        return getDeliveryRefundList;
    }
    public Map<String,Object> getDeliveryRefundDetail(DeliveryInfoVO deliveryInfoVO) throws SQLException{
        Map<String,Object> getDeliveryRefundDetail = sql.selectOne("mall.RefundMapper.getDeliveryRefundDetail",deliveryInfoVO);
        return getDeliveryRefundDetail;
    }
    public Integer getDeliveryRefundListCount(DeliveryInfoVO deliveryInfoVO) throws SQLException {
        Integer getDeliveryRefundListCount=sql.selectOne("mall.RefundMapper.getDeliveryRefundListCount",deliveryInfoVO);
        return getDeliveryRefundListCount;
    }
}
