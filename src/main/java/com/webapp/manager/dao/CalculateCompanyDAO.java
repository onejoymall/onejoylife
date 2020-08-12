package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.common.SearchVO;
import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.manager.vo.CalculateCompanyVO;
import com.webapp.manager.vo.StoreVO;

@Repository
public class CalculateCompanyDAO {
    @Autowired
    private SqlSession sql;
  
	
	
		public List<Map<String, Object>> getCalculateCompanyList(CalculateCompanyVO calculateCompanyVO) {
			List<Map<String, Object>> getCalculateCompanyList = sql.selectList("mall.PaymentMapper.getCalculateCompanyList",calculateCompanyVO);
	        return getCalculateCompanyList;
		}
	   public Map<String,Object> getCalculateCompanyListDetail(HashMap param) {
	        return sql.selectOne("mall.PaymentMapper.getCalculateCompanyListDetail", param);
	    }
	   public Integer getCalculateCompanyCount(CalculateCompanyVO calculateCompanyVO) throws SQLException{
	        Integer getCalculateCompanyCount =sql.selectOne("mall.PaymentMapper.getCalculateCompanyCount",calculateCompanyVO);
	        return getCalculateCompanyCount;
	    }
		public List<Map<String, Object>> getCalculateApplyCompanyList(CalculateCompanyVO calculateCompanyVO) {
			List<Map<String, Object>> getCalculateApplyCompanyList = sql.selectList("mall.PaymentMapper.getCalculateApplyCompanyList",calculateCompanyVO);
	        return getCalculateApplyCompanyList;
		
		}
	   public Integer getCalculateApplyCompanyCount(CalculateCompanyVO calculateCompanyVO) throws SQLException{
	        Integer getCalculateApplyCompanyCount =sql.selectOne("mall.PaymentMapper.getCalculateApplyCompanyCount",calculateCompanyVO);
	        return getCalculateApplyCompanyCount;
	    }
	   

    
}
