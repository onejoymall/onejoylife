package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
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
	public Map<String, Object> getDefinitionDetail(Map<String, Object> params) {
		Map<String, Object> getDefinitionDetail = sql.selectOne("mall.DefinitionMapper.getDefinitionDetail",params);
		return getDefinitionDetail;
	}
	public void insertDefinition(Map<String, Object> params) {
		sql.insert("mall.DefinitionMapper.insertDefinition",params);
	}
	public void updateDefinition(Map<String, Object> params) {
		sql.insert("mall.DefinitionMapper.updateDefinition",params);
	}
}
