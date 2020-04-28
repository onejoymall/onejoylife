package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.board.common.SearchVO;
import com.webapp.manager.vo.ProductVO;

@Repository
public class MgDownloadDAO {
    @Autowired
    private SqlSession sql;
    public  List<Map<String,Object>> getProductDtoList(ProductVO productVO) throws SQLException {
        List<Map<String,Object>> getProductDtoList = sql.selectList("mall.MgDownloadMapper.getProductDtoList",productVO);
        return getProductDtoList;
    }
    
    public  List<Map<String,Object>> getGiveawayDtoList(SearchVO searchVO) throws SQLException {
        List<Map<String,Object>> getGiveawayDtoList = sql.selectList("mall.MgDownloadMapper.getGiveawayDtoList",searchVO);
        return getGiveawayDtoList;
    }
    
    public  List<Map<String,Object>> getOrderDtoList(Map<String,Object> params) throws SQLException {
    	List<Map<String,Object>> getOrderDtoList = sql.selectList("mall.MgDownloadMapper.getOrderDtoList",params);
    	return getOrderDtoList;
    }
}
