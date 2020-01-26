package com.webapp.common.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("termnInfoDao")
public class TermnInfoDaoImpl implements TermnInfoDao{

	 @Autowired
     private SqlSession sqlSession;
  
     public void setSqlSession(SqlSession sqlSession){
         this.sqlSession = sqlSession;
     }
     
     @Override
     public String selectTrcnId(HashMap<String, String> hMap){
         return sqlSession.selectOne("idCheckMapper.selectTrcnId", hMap);
     }
	
}
