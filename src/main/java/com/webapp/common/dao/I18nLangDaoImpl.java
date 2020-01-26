package com.webapp.common.dao;

import java.util.List;

import com.webapp.common.model.I18nLang;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository("I18nLangDao")
public class I18nLangDaoImpl implements I18nLangDao{

	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
	@Override
	public List<I18nLang> select() {
		return sqlSession.selectList("I18nLangMapper.select");
	}

}
