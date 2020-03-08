package com.webapp.mall.dao;

import com.webapp.mall.vo.CommonVO;
import com.webapp.manager.vo.MgCommonVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;

@Repository
public class CommonDAO {
    @Autowired
    private SqlSession sql;
    public void commonListDelete(CommonVO commonVO) throws SQLException{
        sql.delete("mall.CommonMapper.commonListDelete",commonVO);
    }
}
