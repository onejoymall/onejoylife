package com.webapp.mall.dao;

import com.siot.IamportRestClient.response.Payment;
import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.IamPortVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class IamPortDAO {
    @Autowired
    private SqlSession sql;
    @Autowired
    private DataSourceTransactionManager txManager;
    public void insertWebHook(IamPortVO iamPortVO) throws SQLException {
        sql.insert("iamport.iamPortMapper.insertWebHook",iamPortVO);
    }
    public void webhookUpdatePayment(IamPortVO iamPortVO) throws SQLException {
        sql.update("iamport.iamPortMapper.webhookUpdatePayment",iamPortVO);
    }
	public void updateIamportWebHook(Payment impPayment) {
		sql.update("iamport.iamPortMapper.updateIamportWebHook",impPayment);
	}
}
