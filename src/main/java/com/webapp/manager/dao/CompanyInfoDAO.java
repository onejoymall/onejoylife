package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.webapp.manager.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.mall.vo.CartPaymentVO;

@Repository
public class CompanyInfoDAO {
    @Autowired
    private SqlSession sql;
    @Transactional
  
 
    
    public Map<String,Object> getCompanyInfo(CompanyInfoVO CompanyInfoVO) throws SQLException {
        Map<String,Object> getCompanyInfo=sql.selectOne("manager.CompanyInfoMapper.getCompanyInfo",CompanyInfoVO);
        return getCompanyInfo;
    }
    public void insertCompanyInfo(CompanyInfoVO CompanyInfoVO) throws SQLException {
        sql.insert("manager.CompanyInfoMapper.insertCompanyInfo",CompanyInfoVO);
    }

}
