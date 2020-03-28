package com.webapp.manager.dao;

import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class ConfigDAO {
    @Autowired
    private SqlSession sql;

    public Map<String,Object> getConfigDetail(Map<String, Object> params) throws SQLException {
        Map<String,Object> getConfigDetail=sql.selectOne("mall.ConfigMapper.getConfigDetail",params);
        return getConfigDetail;
    }
    public List<Map<String,Object>>getConfigList(Map<String, Object> params) throws SQLException {
        List<Map<String,Object>> getConfigList=sql.selectOne("mall.ConfigMapper.getConfigList",params);
        return getConfigList;
    }
    public  void insertConfig(Map<String, Object> params) throws SQLException{
        sql.insert("mall.ConfigMapper.insertConfig",params);
    }

    public Map<String,Object> getPartnerMarketConfigDetail(Map<String, Object> params) throws SQLException {
        Map<String,Object> getPartnerMarketConfigDetail=sql.selectOne("mall.ConfigMapper.getPartnerMarketConfigDetail",params);
        return getPartnerMarketConfigDetail;
    }
    public  void insertPartnerMarketConfig(Map<String, Object> params) throws SQLException{
        sql.insert("mall.ConfigMapper.insertPartnerMarketConfig",params);
    }
}
