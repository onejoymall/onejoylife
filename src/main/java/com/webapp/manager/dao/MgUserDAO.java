package com.webapp.manager.dao;

import com.webapp.manager.vo.MgUserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
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
}
