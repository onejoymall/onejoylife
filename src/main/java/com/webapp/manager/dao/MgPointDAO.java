package com.webapp.manager.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.manager.vo.MgPointVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgPointDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getMgPointList(MgPointVO MgPointVO) throws SQLException {
        List<Map<String, Object>> getMgPointList = sql.selectList("mall.MgPointMapper.getMgPointList",MgPointVO);
        return getMgPointList;
    }
    public Integer getMgPointListCount(MgPointVO MgPointVO) throws SQLException {
        Integer getMgPointListCount=sql.selectOne("mall.MgPointMapper.getMgPointListCount",MgPointVO);
        return getMgPointListCount;
    }
    public Integer getMgPointAmount(MgPointVO MgPointVO) throws SQLException {
        Integer getMgPointAmount=sql.selectOne("mall.MgPointMapper.getMgPointAmount",MgPointVO);
        return getMgPointAmount;
    }
    public void insertMgPoint(MgPointVO MgPointVO) throws SQLException {
        sql.insert("mall.MgPointMapper.insertMgPoint",MgPointVO);
    }

}
