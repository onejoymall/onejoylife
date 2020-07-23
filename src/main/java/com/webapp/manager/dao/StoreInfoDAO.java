package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.webapp.manager.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.board.common.FileVO;
import com.webapp.mall.vo.CartPaymentVO;

@Repository
public class StoreInfoDAO {
    @Autowired
    private SqlSession sql;
    @Transactional
  
 
    
    public Map<String,Object> getStoreInfo(StoreVO StoreVO) throws SQLException {
        Map<String,Object> getStoreInfo=sql.selectOne("manager.StoreInfoMapper.getStoreInfo",StoreVO);
        return getStoreInfo;
    }
    public Map<String,Object> updateStoreInfo(StoreVO StoreVO) throws SQLException {
        Map<String,Object> updateStoreInfo=sql.selectOne("manager.StoreInfoMapper.updateStoreInfo",StoreVO);
        return updateStoreInfo;
    }
    public Integer selectfileInfo(StoreVO StoreVO) throws SQLException {
    	Integer selectfileInfo=sql.selectOne("manager.StoreInfoMapper.selectfileInfo",StoreVO);
        return selectfileInfo;
    }
    
    
    
    public void updateStoreFile(List<FileVO> filelist,FileVO fileVO) throws Exception{
    	for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.update("manager.StoreInfoMapper.updateStoreFile", f);
        };
    }
    
    public void insertProductFile1(List<FileVO> filelist,FileVO fileVO) throws SQLException{

        for (FileVO f : filelist) {
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(fileVO.getFileorder());
            sql.insert("manager.StoreInfoMapper.insertProductFile1", f);
        }
    }

}
