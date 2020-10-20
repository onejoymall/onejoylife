package com.webapp.mall.dao;

import com.webapp.mall.vo.UserVO;
import com.webapp.manager.vo.StoreVO;

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

    public List<Map<String, Object>> getMailUserList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getMailUserList = sql.selectList("mall.UserMapper.getMailUserList",params);
        return getMailUserList;
    }
    public void insertMarketingLog(Map<String, String> params) throws SQLException {
        sql.insert("mall.UserMapper.insertMarketingLog", params);
    }
    public Map<String, Object> getEmailAuthList(Map<String, String> params) throws SQLException {
        Map<String, Object> getEmailAuthList = sql.selectOne("mall.UserMapper.getEmailAuthList",params);
        return getEmailAuthList;
    }
    public Map<String, Object> getEmailAuthCode(UserVO userVO) throws SQLException {
        Map<String, Object> getEmailAuthCode = sql.selectOne("mall.UserMapper.getEmailAuthCode",userVO);
        return getEmailAuthCode;
    }

    public Map<String, Object> getLoginUserList(Map<String, String> params) throws SQLException {
        Map<String, Object> getLoginUserList = sql.selectOne("mall.UserMapper.getUserList",params);
        return getLoginUserList;
    }

    public Map<String, Object> getUserStoreList(Map<String, String> params) throws SQLException {
        Map<String, Object> getUserStoreList = sql.selectOne("mall.UserMapper.getUserStoreList",params);
        return getUserStoreList;
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

    public void updatePasswordChangeMember(UserVO userVO) throws SQLException {
        sql.update("mall.UserMapper.updatePasswordChangeMember", userVO);
    }
    public void privacy_policy(UserVO userVO) throws SQLException {
        sql.update("mall.UserMapper.privacy_policy", userVO);
    }

    public void insertUserHistory(UserVO userVO) throws SQLException{
        sql.insert("mall.UserMapper.insertUserHistory", userVO);
    }

	public Map<String, Object> getUserConditionInfo(Integer user_id) {
		 Map<String, Object> getUserConditionInfo = sql.selectOne("mall.UserMapper.getUserConditionInfo",user_id);
        return getUserConditionInfo;
	}
	public Map<String, Object> getUserForId(Map<String, Object> params) {
		Map<String, Object> getUserForId = sql.selectOne("mall.UserMapper.getUserForId", params);
        return getUserForId;
	}
    public void updateManagerPassword(UserVO userVO) throws SQLException {
        sql.update("mall.UserMapper.updateManagerPassword", userVO);
    }
    public void updateStoreManagerPassword(UserVO userVO) throws SQLException {
        sql.update("mall.UserMapper.updateStoreManagerPassword", userVO);
    }
	public void deleteUser(Map<String, Object> userInfo) {
		sql.delete("mall.UserMapper.deleteUser", userInfo);
	}
    
}
