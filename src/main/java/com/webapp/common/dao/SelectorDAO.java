package com.webapp.common.dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Repository
public class SelectorDAO{
    @Autowired
    private SqlSession sql;
    public List<Map<String,Object>> getSelector(Map<String,Object> params) throws SQLException {
        List<Map<String, Object>> getSelector=sql.selectList("common.CommonMapper.getSelector",params);
        return getSelector;
    }
}
