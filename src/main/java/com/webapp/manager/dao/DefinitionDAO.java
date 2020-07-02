package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DefinitionDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getDefinitionList(Map<String, Object> params) throws SQLException {
        List<Map<String, Object>> getDefinitionList = sql.selectList("mall.DefinitionMapper.getDefinitionList",params);
        return getDefinitionList;
    }
    public Integer getDefinitionCount(Map<String, Object> params) throws SQLException {
    	Integer getDefinitionCount = sql.selectOne("mall.DefinitionMapper.getDefinitionCount",params);
    	return getDefinitionCount;
    }
}
