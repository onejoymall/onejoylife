package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.manager.vo.CouponVO;

@Repository
public class MgCouponDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getCouponList(Map<String, Object> params) throws SQLException {
        List<Map<String, Object>> getCouponList = sql.selectList("mall.MgCouponMapper.getCouponList",params);
        return getCouponList;
    }
    public Map<String, Object> getCouponDetail(Map<String, Object> params) throws SQLException {
    	Map<String, Object> getCouponDetail = sql.selectOne("mall.MgCouponMapper.getCouponDetail",params);
    	return getCouponDetail;
    }
    public Integer getCouponListCount(Map<String, Object> params) throws SQLException {
    	Integer getCouponListCount = sql.selectOne("mall.MgCouponMapper.getCouponListCount",params);
    	return getCouponListCount;
    }
    public void insertCoupon(CouponVO couponVO) throws SQLException {
    	sql.insert("mall.MgCouponMapper.insertCoupon", couponVO);
    }
    public void updateCoupon(CouponVO couponVO) throws SQLException {
    	sql.update("mall.MgCouponMapper.updateCoupon", couponVO);
    }
    public void updateCouponBatch(CouponVO couponVO) throws SQLException {
    	sql.update("mall.MgCouponMapper.updateCouponBatch", couponVO);
    }
    public boolean checkDupCouponCD(String couponCD) throws SQLException {
    	return (int)sql.selectOne("mall.MgCouponMapper.checkDupCouponCD", couponCD) > 0;
    }
    public void insertCouponFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{
        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.insert("mall.MgCouponMapper.insertCouponFile", f);
        }
    }
    public  void deleteCouponFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{
        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.delete("mall.MgCouponMapper.deleteCouponFile",f);
        }
    }
    public void deleteCouponFile(FileVO fileVO) throws SQLException{
        sql.delete("mall.MgCouponMapper.deleteCouponFileOne",fileVO);
    }
}
