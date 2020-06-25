package com.webapp.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
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

    public Integer getPointListCount(Map<String, String> params) throws SQLException {
    	Integer getPointListCount=sql.selectOne("mall.PointMapper.getPointListCount",params);
        return getPointListCount;
    }
    public Integer getPointAmount(Map<String, String> params) throws SQLException {
        Integer getPointAmount=sql.selectOne("mall.PointMapper.getPointAmount",params);
        return getPointAmount;
    }
    public void insertPoint(Map<String, Object> pointParam) throws SQLException {
        sql.insert("mall.PointMapper.insertPoint",pointParam);
    }

    public int updatePoint(Map<String, String> params) throws SQLException {
        int updatePoint = sql.update("mall.PointMapper.updatePoint",params);
        return updatePoint;
    }
    public int deletePoint(Map<String, String> params) throws SQLException {
        int deletePoint = sql.delete("mall.PointMapper.deletePoint",params);
        return deletePoint;
    }

	public Map<String, Object> getPointOrderNo(HashMap params) {
		Map<String, Object> getPointOrderNo = sql.selectOne("mall.PointMapper.getPointOrderNo",params);
        return getPointOrderNo;
	}

}
