package com.webapp.common.dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
@Repository
public class SelectorDAO{
    @Autowired
    private SqlSession sql;
    public Map<String,Object> getSelector(Map<String,Object> params) throws SQLException {
        Map<String, Object> getSelector=sql.selectOne("common.CommonMapper.getSelector",params);
        return getSelector;
    }
}
