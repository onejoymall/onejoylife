package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.manager.vo.MgUserVO;
@Repository
public class MgUserDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getManagerUserList(MgUserVO userVO) throws SQLException {
        List<Map<String, Object>> getManagerUserList = sql.selectList("mall.MgUserMapper.getManagerUserList",userVO);
        return getManagerUserList;
    }
    public Integer getManagerUserListCount(MgUserVO userVO) throws SQLException{
        Integer getManagerUserListCount =sql.selectOne("mall.MgUserMapper.getManagerUserListCount",userVO);
        return getManagerUserListCount;
    }

    public Map<String,Object> getUserDetail(MgUserVO mgUserVO) throws SQLException {
        Map<String,Object> getUserDetail=sql.selectOne("mall.MgUserMapper.getUserDetail", mgUserVO);
        return getUserDetail;
    }

    public List<Map<String, Object>> getUserHistory(MgUserVO userVO) throws SQLException {
        List<Map<String, Object>> getUserHistory = sql.selectList("mall.MgUserMapper.getUserHistory",userVO);
        return getUserHistory;
    }
    public Integer getUserHistoryCount(MgUserVO userVO) throws SQLException{
        Integer getUserHistoryCount =sql.selectOne("mall.MgUserMapper.getUserHistoryCount",userVO);
        return getUserHistoryCount;
    }
    public void userLevelUpdate(HashMap params) throws SQLException{
        sql.selectOne("mall.MgUserMapper.userLevelUpdate",params);
    }
    public List<Map<String, Object>> getMenuDepth() throws SQLException{
    	return sql.selectList("mall.MgUserMapper.getMenuDepth");
    }
    public void userEnableMenuUpdate(HashMap params) throws SQLException{
        sql.selectOne("mall.MgUserMapper.userEnableMenuUpdate",params);
    }

}
