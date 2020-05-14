package com.webapp.manager.dao;

import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class BannerDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getBannerList(Map<String, Object> params) throws SQLException {
        List<Map<String, Object>> getBannerList = sql.selectList("mall.BannerMapper.getBannerList",params);
        return getBannerList;
    }
    public List<Map<String, Object>> getCategoryEventList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategoryEventList = sql.selectList("mall.BannerMapper.getCategoryEventList",params);
        return getCategoryEventList;
    }
    public List<Map<String, Object>> getCategorySubList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategorySubList = sql.selectList("mall.BannerMapper.getCategorySubList",params);
        return getCategorySubList;
    }
    public List<Map<String, Object>> getCategoryThirdList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategoryThirdList = sql.selectList("mall.BannerMapper.getCategoryThirdList",params);
        return getCategoryThirdList;
    }
    public Map<String,Object> getBannerDetail(Map<String, Object> params) throws SQLException {
        Map<String,Object> getBannerDetail=sql.selectOne("mall.BannerMapper.getBannerDetail",params);
        return getBannerDetail;
    }
    public Map<String,Object> getCategoryView(Map<String,Object> params) throws SQLException {
        Map<String,Object> getCategoryView=sql.selectOne("mall.BannerMapper.getCategoryView",params);
        return getCategoryView;
    }
    public  void insertCategory(Map<String, String> params) throws SQLException{
        sql.insert("mall.BannerMapper.insertCategory",params);
    }
    public  void insertCategoryEvent(Map<String, String> params) throws SQLException{
        sql.insert("mall.BannerMapper.insertCategoryEvent",params);
    }
    public  void updateBanner(Map<String, String> params) throws SQLException{
        sql.update("mall.BannerMapper.updateBanner",params);
    }
    public  void deleteCategory(Map<String, String> params) throws SQLException{
        sql.delete("mall.BannerMapper.deleteCategory",params);
    }

    public void insertBannerFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{
        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.insert("mall.BannerMapper.insertBannerFile", f);
        }
    }
    public  void deleteBannerFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.delete("mall.BannerMapper.deleteBannerFile",f);
        }

    }
}
