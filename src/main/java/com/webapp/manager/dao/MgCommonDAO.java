package com.webapp.manager.dao;

import com.webapp.mall.vo.CommonVO;
import com.webapp.manager.vo.CategoryVO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.StockVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;

@Repository
public class MgCommonDAO {
    @Autowired
    private SqlSession sql;

    public void ListDelete(MgCommonVO mgCommonVO) throws SQLException{
        sql.delete("mall.MgCommonMapper.ListDelete",mgCommonVO);
    }
    public void listUpdate(MgCommonVO mgCommonVO) throws SQLException{
        sql.update("mall.MgCommonMapper.listUpdate",mgCommonVO);
    }
    public void listStockUpdate(StockVO stockVO) throws SQLException{
        sql.update("mall.MgCommonMapper.listStockUpdate",stockVO);
    }
    public void productListCategoryUpdate(CategoryVO categoryVO) throws SQLException{
        sql.update("mall.MgCommonMapper.productListCategoryUpdate",categoryVO);
    }
}
