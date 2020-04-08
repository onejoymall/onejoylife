package com.webapp.manager.dao;

import com.webapp.manager.vo.MgBrandVO;
import com.webapp.manager.vo.MgUserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgBrandDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getBrandList(MgBrandVO mgBrandVO) throws SQLException {
        List<Map<String, Object>> getBrandList = sql.selectList("mall.MgBrandMapper.getBrandList",mgBrandVO);
        return getBrandList;
    }
    public Integer getBrandListCount(MgBrandVO mgBrandVO) throws SQLException{
        Integer getBrandListCount =sql.selectOne("mall.MgBrandMapper.getBrandListCount",mgBrandVO);
        return getBrandListCount;
    }
    public Map<String,Object> getBrand(MgBrandVO mgBrandVO) throws SQLException {
        Map<String,Object> getBrand=sql.selectOne("mall.MgBrandMapper.getBrand", mgBrandVO);
        return getBrand;
    }
    public void insertBrand(MgBrandVO mgBrandVO) throws SQLException{
        sql.insert("mall.MgBrandMapper.insertBrand", mgBrandVO);
    }
}
