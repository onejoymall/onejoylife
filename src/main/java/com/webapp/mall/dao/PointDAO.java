package com.webapp.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class PointDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getPointList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getPointList = sql.selectList("mall.PointMapper.getPointList",params);
        return getPointList;
    }

    public Map<String, Object> getPointListCount(Map<String, String> params) throws SQLException {
        Map<String, Object> getPointListCount=sql.selectOne("mall.PointMapper.getPointListCount",params);
        return getPointListCount;
    }
    public Map<String, Object> getPointAmount(Map<String, String> params) throws SQLException {
        Map<String, Object> getPointAmount=sql.selectOne("mall.PointMapper.getPointAmount",params);
        return getPointAmount;
    }
    public int insertPoint(Map<String, String> params) throws SQLException {
        int insertPoint = sql.insert("mall.PointMapper.insertPoint",params);
        return insertPoint;
    }

    public int updatePoint(Map<String, String> params) throws SQLException {
        int updatePoint = sql.update("mall.PointMapper.updatePoint",params);
        return updatePoint;
    }
    public int deletePoint(Map<String, String> params) throws SQLException {
        int deletePoint = sql.delete("mall.PointMapper.deletePoint",params);
        return deletePoint;
    }

}
