package com.webapp.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
public class CouponDAO {
    @Autowired
    private SqlSession sql;
    public Map<String, Object> getEmailAuthList(Map<String, String> params) throws SQLException {
        Map<String, Object> getEmailAuthList = sql.selectOne("mall.UserMapper.getEmailAuthList",params);
        return getEmailAuthList;
    }
}
