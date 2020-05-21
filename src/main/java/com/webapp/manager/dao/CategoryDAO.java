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
public class CategoryDAO {
    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getCategoryList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategoryList = sql.selectList("mall.CategoryMapper.getCategoryList",params);
        return getCategoryList;
    }
    public List<Map<String, Object>> getCategoryEventList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategoryEventList = sql.selectList("mall.CategoryMapper.getCategoryEventList",params);
        return getCategoryEventList;
    }
    public List<Map<String, Object>> getCategorySubList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategorySubList = sql.selectList("mall.CategoryMapper.getCategorySubList",params);
        return getCategorySubList;
    }
    public List<Map<String, Object>> getCategoryThirdList(Map<String, String> params) throws SQLException {
        List<Map<String, Object>> getCategoryThirdList = sql.selectList("mall.CategoryMapper.getCategoryThirdList",params);
        return getCategoryThirdList;
    }
    public Map<String,Object> getCategoryDetail(SearchVO searchVO) throws SQLException {
        Map<String,Object> getCategoryDetail=sql.selectOne("mall.CategoryMapper.getCategoryDetail",searchVO);
        return getCategoryDetail;
    }
    public Map<String,Object> getCategoryView(Map<String,Object> params) throws SQLException {
        Map<String,Object> getCategoryView=sql.selectOne("mall.CategoryMapper.getCategoryView",params);
        return getCategoryView;
    }
    public  void insertCategory(Map<String, String> params) throws SQLException{
        sql.insert("mall.CategoryMapper.insertCategory",params);
    }
    public  void insertCategoryEvent(Map<String, String> params) throws SQLException{
        sql.insert("mall.CategoryMapper.insertCategoryEvent",params);
    }
    public  void updateCategory(Map<String, String> params) throws SQLException{
        sql.update("mall.CategoryMapper.updateCategory",params);
    }
    public  void deleteCategory(Map<String, String> params) throws SQLException{
        sql.delete("mall.CategoryMapper.deleteCategory",params);
    }

    public void insertCategoryFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{
        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.insert("mall.CategoryMapper.insertCategoryFile", f);
        }
    }
    public  void deleteCategoryFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.delete("mall.CategoryMapper.deleteCategoryFile",f);
        }

    }
	public Map<String, Object> getRootCategoty(Map<String, Object> params) {
		Map<String, Object> getRootCategory = sql.selectOne("mall.CategoryMapper.getRootCategory", params);
		return getRootCategory;
	}
}
