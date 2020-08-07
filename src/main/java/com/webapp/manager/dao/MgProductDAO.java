package com.webapp.manager.dao;

import com.webapp.board.common.FileVO;
import com.webapp.mall.vo.CommonVO;
import com.webapp.manager.vo.ProductVO;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Repository
public class MgProductDAO {

    @Autowired
    private SqlSession sql;
    public Map<String,Object> getProductViewDetail(Map<String,Object> params) throws SQLException {
        Map<String,Object> getProductViewDetail=sql.selectOne("mall.ProductMapper.getProductViewDetail",params);
        return getProductViewDetail;
    }
    public void insertProduct(ProductVO productVO) throws SQLException{
        sql.insert("mall.ProductMapper.insertProduct",productVO);
    }
    public void insertProductFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.insert("mall.ProductMapper.insertProductFile", f);
        }
    }
    public void insertProductCopy(Map<String,Object> params) throws Exception{
        sql.insert("mall.ProductMapper.insertProductCopy",params);
    }
    public void insertProductFileCopy(Map<String,Object> params) throws Exception{
        sql.insert("mall.ProductMapper.insertProductFileCopy",params);
    }
    public void updateProductFile(List<FileVO> filelist,FileVO fileVO) throws Exception{
    	for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.update("mall.ProductMapper.updateProductFile", f);
        };
    }
    public void updateProduct(ProductVO productVO) throws SQLException{
        sql.update("mall.ProductMapper.updateProduct",productVO);
    }

    public  void deleteProductFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.delete("mall.ProductMapper.deleteProductFile",f);
        }

    }
    public void updateProductList(CommonVO commonVO)throws SQLException{
        sql.insert("mall.ProductMapper.updateProductList", commonVO);
    }
	public void insertProductProposal(Map<String,Object> params) {
		sql.insert("mall.ProductMapper.insertProductProposal", params);
	}
	public void updateProductProposal(Map<String,Object> params) {
		sql.update("mall.ProductMapper.updateProductProposal", params);
	}
	public Integer getProductProposalListCount(HashMap params) {
		Integer getProductProposalListCount = sql.selectOne("mall.ProductMapper.getProductProposalListCount",params);
		return getProductProposalListCount;
	}
	public List<Map<String, Object>> getProductProposalList(HashMap params) {
		List<Map<String, Object>> getProductProposalList = sql.selectList("mall.ProductMapper.getProductProposalList",params);
		return getProductProposalList;
	}
	public Map<String, Object> getProposalDetail(HashMap params) {
		Map<String, Object> getProposalDetail = sql.selectOne("mall.ProductMapper.getProposalDetail",params);
    	return getProposalDetail;
	}
	public void acceptProductProposal(HashMap params) {
		sql.update("mall.ProductMapper.acceptProductProposal", params);
	}
}
