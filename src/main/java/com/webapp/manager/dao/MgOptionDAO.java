package com.webapp.manager.dao;

import com.webapp.manager.vo.MgBrandVO;
import com.webapp.manager.vo.MgOptionVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgOptionDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getOptionList(MgOptionVO mgOptionVO) throws SQLException {
        List<Map<String, Object>> getOptionList = sql.selectList("mall.MgOptionMapper.getOptionList",mgOptionVO);
        return getOptionList;
    }
    public Integer getOptionListCount(MgOptionVO mgOptionVO) throws SQLException{
        Integer getOptionListCount =sql.selectOne("mall.MgOptionMapper.getOptionListCount",mgOptionVO);
        return getOptionListCount;
    }
    public Map<String,Object> getOption(MgOptionVO mgOptionVO) throws SQLException {
        Map<String,Object> getOption=sql.selectOne("mall.MgOptionMapper.getOption", mgOptionVO);
        return getOption;
    }
    public void insertOption(MgOptionVO mgOptionVO) throws SQLException{
        sql.insert("mall.MgOptionMapper.insertOption", mgOptionVO);
    }
}
