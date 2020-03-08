package com.webapp.manager.dao;

import com.webapp.manager.vo.MgCommonVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
public class MgCommonDAO {
    @Autowired
    private SqlSession sql;
    public void ListDelete(MgCommonVO mgCommonVO) throws SQLException{
        sql.delete("mall.MgCommonMapper.ListDelete",mgCommonVO);
    }
}