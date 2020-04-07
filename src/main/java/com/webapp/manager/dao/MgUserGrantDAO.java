package com.webapp.manager.dao;

import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.MgUserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgUserGrantDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getUserGrantList(MgUserVO userVO) throws SQLException {
        List<Map<String, Object>> getUserGrantList = sql.selectList("mall.MgUserMapper.getUserGrantList",userVO);
        return getUserGrantList;
    }
    public Integer getUserGrantListCount(MgUserVO userVO) throws SQLException{
        Integer getUserGrantListCount =sql.selectOne("mall.MgUserMapper.getUserGrantListCount",userVO);
        return getUserGrantListCount;
    }

    public Map<String,Object> getUserGrant(MgUserVO mgUserVO) throws SQLException {
        Map<String,Object> getUserGrant=sql.selectOne("mall.MgUserMapper.getUserGrant", mgUserVO);
        return getUserGrant;
    }
    public void insertUserGrant(MgUserVO mgUserVO) throws SQLException{
        sql.insert("mall.MgUserMapper.insertUserGrant", mgUserVO);
    }
    public void userGrantListUpdate(MgUserVO mgUserVO) throws SQLException{
        sql.delete("mall.MgUserMapper.userGrantListUpdate",mgUserVO);
    }
}
