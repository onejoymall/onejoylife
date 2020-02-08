package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class GivewayDAO {
    @Autowired
    private SqlSession sql;

    public List<Map<String, Object>> getGivewayList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getGivewayList = sql.selectList("mall.GivewayMapper.getGivewayList",params);
        return getGivewayList;
    }
    public Map<String,Object> getGivewayDetail(Map<String, String> params) throws SQLException {
        Map<String, Object> getGivewayDetail=sql.selectOne("mall.GivewayMapper.getGivewayDetail",params);
        return getGivewayDetail;
    }
    public Integer getGivewayListCount(Map<String, String> params) throws SQLException {
        Integer getGivewayListCount=sql.selectOne("mall.GivewayMapper.getGivewayListCount",params);
        return getGivewayListCount;
    }
    public List<Map<String, Object>> getUserGivewayPlayList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getUserGivewayPlayList = sql.selectList("mall.GivewayMapper.getUserGivewayPlayList",params);
        return getUserGivewayPlayList;
    }
    public Map<String, Object> getUserGivewayPlayListCount(Map<String, String> params) throws SQLException {
        Map<String, Object> getUserGivewayPlayListCount=sql.selectOne("mall.GivewayMapper.getUserGivewayPlayListCount",params);
        return getUserGivewayPlayListCount;
    }
    public int insertGiveway(Map<String, String> params) throws SQLException {
        int insertGiveway = sql.insert("mall.GivewayMapper.insertGiveway",params);
        return insertGiveway;
    }
    public int insertGivewayPlay(Map<String, String> params) throws SQLException {
        int insertGivewayPlay = sql.insert("mall.GivewayMapper.insertGivewayPlay",params);
        return insertGivewayPlay;
    }
    public int updateGiveway(Map<String, String> params) throws SQLException {
        int updateGiveway = sql.update("mall.GivewayMapper.updateGiveway",params);
        return updateGiveway;
    }
    public int deleteGiveway(Map<String, String> params) throws SQLException {
        int deleteGiveway = sql.delete("mall.GivewayMapper.deleteGiveway",params);
        return deleteGiveway;
    }
    public int deleteGivewayPlayHistory(Map<String, String> params) throws SQLException {
        int deleteGivewayPlayHistory = sql.delete("mall.GivewayMapper.deleteGivewayPlayHistory",params);
        return deleteGivewayPlayHistory;
    }
}
