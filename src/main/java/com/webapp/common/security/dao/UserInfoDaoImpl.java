package com.webapp.common.security.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.common.security.model.UserInfo;

@Repository("userInfoDao")
public class UserInfoDaoImpl implements UserInfoDao{

	 @Autowired
     private SqlSession sqlSession;
  
     public void setSqlSession(SqlSession sqlSession){
         this.sqlSession = sqlSession;
     }
     
     
     @Override
     public UserInfo selectUserInfo(String usrId) {
    	 return sqlSession.selectOne("userMngMapper.selectUserInfo", usrId);
     }
}
