package com.webapp.manager.dao;

import com.webapp.manager.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgDownloadDAO {
    @Autowired
    private SqlSession sql;
    public  List<Map<String,Object>> getProductDtoList(ProductVO productVO) throws SQLException {
        List<Map<String,Object>> getProductDtoList = sql.selectList("mall.MgDownloadMapper.getProductDtoList",productVO);
        return getProductDtoList;
    }
}
