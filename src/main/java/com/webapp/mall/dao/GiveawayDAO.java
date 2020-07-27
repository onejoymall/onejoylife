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

    public List<Map<String, Object>> getGiveawayList(SearchVO searchVO) throws SQLException {
        List<Map<String, Object>> getGiveawayList = sql.selectList("mall.GiveawayMapper.getGiveawayList",searchVO);
        return getGiveawayList;
    }
    public Integer getGiveawayListCount(SearchVO searchVO) throws SQLException {
        Integer getGiveawayListCount=sql.selectOne("mall.GiveawayMapper.getGiveawayListCount",searchVO);
        return getGiveawayListCount;
    }
    public Map<String,Object> getGiveawayDetail(Map<String, String> params) throws SQLException {
        Map<String, Object> getGiveawayDetail=sql.selectOne("mall.GiveawayMapper.getGiveawayDetail",params);
        return getGiveawayDetail;
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

    public void insertGiveawayPlay(GiveawayVO giveawayVO) throws SQLException {
        sql.insert("mall.GiveawayMapper.insertGiveawayPlay",giveawayVO);

    }

    public Map<String,Object> getGiveawayStatusCount(Map<String, String> params) throws SQLException{
        Map<String,Object> getGiveawayStatusCount = sql.selectOne("mall.GiveawayMapper.getGiveawayStatusCount",params);
        return getGiveawayStatusCount;
    }
	public void insertGiveawayHistory(Map<String, Object> params) {
		sql.insert("mall.GiveawayMapper.insertGiveawayHistory", params);
	}
	public void updateGiveawayHistory(Map<String, Object> params) {
		sql.insert("mall.GiveawayMapper.updateGiveawayHistory", params);
	}
	public List<Map<String, Object>> relatedGiveawayList(Map<String, Object> params) {
		List<Map<String, Object>> relatedGiveawayList = sql.selectList("mall.GiveawayMapper.relatedGiveawayList", params);
		return relatedGiveawayList;
	}
	public List<Map<String, Object>> serialGiveawayList(Map<String, Object> params) {
		List<Map<String, Object>> serialGiveawayList = sql.selectList("mall.GiveawayMapper.serialGiveawayList", params);
		return serialGiveawayList;
	}
}
