package com.webapp.manager.dao;

import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.manager.vo.ProductVO;
import com.webapp.manager.vo.StoreVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgStoreDAO {

    @Autowired
    private SqlSession sql;
    public List<Map<String, Object>> getStoreList(StoreVO storeVO) throws SQLException {
        List<Map<String, Object>> getStoreList = sql.selectList("mall.MgStoreMapper.getStoreList",storeVO);
        return getStoreList;
    }

    public Map<String,Object> getMgUserList(StoreVO storeVO) throws SQLException {
        Map<String,Object> getMgUserList=sql.selectOne("mall.MgStoreMapper.getMgUserList",storeVO);
        return getMgUserList;
    }

    public Integer getStoreListCount(StoreVO storeVO) throws SQLException {
        Integer getStoreListCount=sql.selectOne("mall.MgStoreMapper.getStoreListCount",storeVO);
        return getStoreListCount;
    }

    public Map<String,Object> getStoreDetail(StoreVO storeVO) throws SQLException {
        Map<String,Object> getStoreDetail=sql.selectOne("mall.MgStoreMapper.getStoreDetail",storeVO);
        return getStoreDetail;
    }
    public Map<String,Object> getStoreRegDetail(StoreVO storeVO) throws SQLException {
        Map<String,Object> getStoreRegDetail=sql.selectOne("mall.MgStoreMapper.getStoreRegDetail",storeVO);
        return getStoreRegDetail;
    }
    public void insertStore(StoreVO storeVO) throws SQLException{
        sql.insert("mall.MgStoreMapper.insertStore",storeVO);
    }

    public void updateStore(StoreVO storeVO) throws SQLException{
        sql.update("mall.MgStoreMapper.updateStore",storeVO);
    }
    public void updateStoreApproval(StoreVO storeVO) throws SQLException{
        sql.update("mall.MgStoreMapper.updateStoreApproval",storeVO);
    }

    public void insertProductFile(List<FileVO> filelist,FileVO fileVO) throws SQLException{
        int i=0;
        for (FileVO f : filelist) {
            i++;
            f.setParentPK(fileVO.getParentPK());
            f.setFilelink(fileVO.getFilepath()+f.getRealname());
            f.setFileorder(i);
            sql.insert("mall.ProductMapper.insertProductFile", f);
        }
    }
    public void deleteProductFile(ProductVO productVO) throws SQLException{
        sql.delete("mall.ProductMapper.deleteProductFile",productVO);
    }
}
