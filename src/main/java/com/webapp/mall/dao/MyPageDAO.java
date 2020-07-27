package com.webapp.mall.dao;

import com.webapp.mall.vo.MyPageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
@Repository
public class MyPageDAO {
    @Autowired
    private SqlSession sql;

    public List<Map<String, Object>> getMyPagePaymentList(MyPageVO myPageVO) throws SQLException {
        List<Map<String, Object>> getMyPagePaymentList = sql.selectList("mall.MyPageMapper.getMyPagePaymentList",myPageVO);
        return getMyPagePaymentList;
    }
    public Integer getMyPagePaymentListCount(MyPageVO myPageVO) throws SQLException {
        Integer getMyPagePaymentListCount=sql.selectOne("mall.MyPageMapper.getMyPagePaymentListCount",myPageVO);
        return getMyPagePaymentListCount;
    }
    public Map<String,Object> getMyPagePaymentDetail(MyPageVO myPageVO) throws SQLException{
        Map<String,Object> getMyPagePaymentDetail = sql.selectOne("mall.MyPageMapper.getMyPagePaymentDetail",myPageVO);
        return getMyPagePaymentDetail;
    }

    public List<Map<String, Object>> getMyPageSnsShareList(Map<String,Object> params) throws SQLException {
        List<Map<String, Object>> getMyPageSnsShareList = sql.selectList("mall.MyPageMapper.getMyPageSnsShareList",params);
        return getMyPageSnsShareList;
    }
}
