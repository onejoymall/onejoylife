package com.webapp.manager.dao;

import com.webapp.board.common.SearchVO;
import com.webapp.manager.vo.MgBrandVO;
import com.webapp.manager.vo.MgUserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MgSalesDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getCategorySalesList(HashMap params) throws SQLException {
        List<Map<String, Object>> getCategorySalesList = sql.selectList("mall.MgSalesMapper.getCategorySalesList",params);
        return getCategorySalesList;
    }
    public Integer getCategorySalesListCount(HashMap params) throws SQLException{
        Integer getCategorySalesListCount =sql.selectOne("mall.MgSalesMapper.getCategorySalesListCount",params);
        return getCategorySalesListCount;
    }
//    public void insertBrand(MgBrandVO mgBrandVO) throws SQLException{
//        sql.insert("mall.MgBrandMapper.insertBrand", mgBrandVO);
//    }
}
