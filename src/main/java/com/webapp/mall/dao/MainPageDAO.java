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
public class MainPageDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getMainGiveawayList(GiveawayVO giveawayVO) throws SQLException {
        List<Map<String, Object>> getMainGiveawayList = sql.selectList("mall.MainPageMapper.getMainGiveawayList",giveawayVO);
        return getMainGiveawayList;
    }
    public List<Map<String, Object>> getMainProductList(SearchVO searchVO) throws SQLException {
        List<Map<String, Object>> getMainProductList = sql.selectList("mall.MainPageMapper.getMainProductList",searchVO);
        return getMainProductList;
    }

    public void insertSnsShare(Map<String,Object> params) throws SQLException {
        sql.insert("mall.MainPageMapper.insertSnsShare",params);
    }
}
