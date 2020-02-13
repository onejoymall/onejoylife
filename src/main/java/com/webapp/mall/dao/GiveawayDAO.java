package com.webapp.mall.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.GiveawayVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class GiveawayDAO {
    @Autowired
    private SqlSession sql;

    public List<Map<String, Object>> getGiveawayList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getGiveawayList = sql.selectList("mall.GiveawayMapper.getGiveawayList",params);
        return getGiveawayList;
    }
    public Map<String,Object> getGiveawayDetail(Map<String, String> params) throws SQLException {
        Map<String, Object> getGiveawayDetail=sql.selectOne("mall.GiveawayMapper.getGiveawayDetail",params);
        return getGiveawayDetail;
    }
    public Integer getGiveawayListCount(Map<String, String> params) throws SQLException {
        Integer getGiveawayListCount=sql.selectOne("mall.GiveawayMapper.getGiveawayListCount",params);
        return getGiveawayListCount;
    }
    public List<Map<String, Object>> getUserGiveawayPlayList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getUserGiveawayPlayList = sql.selectList("mall.GiveawayMapper.getUserGiveawayPlayList",params);
        return getUserGiveawayPlayList;
    }
    public Integer getUserGiveawayPlayListCount(Map<String, String> params) throws SQLException {
        Integer getUserGiveawayPlayListCount=sql.selectOne("mall.GiveawayMapper.getUserGiveawayPlayListCount",params);
        return getUserGiveawayPlayListCount;
    }
    public Integer getGiveawayPlaySumPoint(Map<String, String> params) throws SQLException {
        Integer getGiveawayPlaySumPoint=sql.selectOne("mall.GiveawayMapper.getGiveawayPlaySumPoint",params);
        return getGiveawayPlaySumPoint;
    }
    public void updateWinnerUser(Map<String, String> params) throws SQLException {
        sql.update("mall.GiveawayMapper.updateWinnerUser",params);
    }
    public Integer getGiveawayPlayUserRandId(Map<String, String> params) throws SQLException {
        Integer getGiveawayPlayUserRandId=sql.selectOne("mall.GiveawayMapper.getGiveawayPlayUserRandId",params);
        return getGiveawayPlayUserRandId;
    }
    public void insertGiveawayWinner(Map<String,Object> params) throws SQLException{
        sql.insert("mall.GiveawayMapper.insertGiveawayWinner",params);
    }
    public Integer insertGiveaway(Map<String, String> params) throws SQLException {
        int insertGiveaway = sql.insert("mall.GiveawayMapper.insertGiveaway",params);
        return insertGiveaway;
    }
    public void insertGiveawayPlay(GiveawayVO giveawayVO) throws SQLException {
        sql.insert("mall.GiveawayMapper.insertGiveawayPlay",giveawayVO);

    }
    public Integer updateGiveaway(Map<String, String> params) throws SQLException {
        int updateGiveaway = sql.update("mall.GiveawayMapper.updateGiveaway",params);
        return updateGiveaway;
    }
    public Integer deleteGiveaway(Map<String, String> params) throws SQLException {
        int deleteGiveaway = sql.delete("mall.giveawayMapper.deleteGiveaway",params);
        return deleteGiveaway;
    }
    public Integer deleteGiveawayPlayHistory(Map<String, String> params) throws SQLException {
        int deleteGiveawayPlayHistory = sql.delete("mall.GiveawayMapper.deleteGiveawayPlayHistory",params);
        return deleteGiveawayPlayHistory;
    }
}
