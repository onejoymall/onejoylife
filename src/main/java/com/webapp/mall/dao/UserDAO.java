package com.webapp.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class UserDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getUserList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getUserList = sql.selectList("mall.UserMapper.getUserList",params);
        return getUserList;
    }
    public Map<String, Object> getEmailAuthList(Map<String, String> params) throws SQLException {
        Map<String, Object> getEmailAuthList = sql.selectOne("mall.UserMapper.getEmailAuthList",params);
        return getEmailAuthList;
    }
    public Map<String, Object> getLoginUserList(Map<String, String> params) throws SQLException {
        Map<String, Object> getLoginUserList = sql.selectOne("mall.UserMapper.getUserList",params);
        return getLoginUserList;
    }
    public Map<String, Object> getFindUser(Map<String, String> params) throws SQLException {
        Map<String, Object> getFindUser = sql.selectOne("mall.UserMapper.getFindUser",params);
        return getFindUser;
    }
    public void updateToken(Map<String, String> params) throws SQLException {
        sql.update("mall.UserMapper.updateToken", params);
    }
    public void updatePasswordChangeCode(Map<String, String> params) throws SQLException {
        sql.update("mall.UserMapper.updatePasswordChangeCode", params);
    }
    public void updatePasswordChange(Map<String, String> params) throws SQLException {
        sql.update("mall.UserMapper.updatePasswordChange", params);
    }
    public void insertUser(Map<String, String> params) throws SQLException {
        sql.insert("mall.UserMapper.insertUser", params);
    }
    public void insertSnsUser(Map<String, String> params) throws SQLException {
        sql.insert("mall.UserMapper.insertSnsUser", params);
    }
    public void insertEmailAuth(Map<String, String> params) throws SQLException {
        sql.insert("mall.UserMapper.insertEmailAuth", params);
    }

}
