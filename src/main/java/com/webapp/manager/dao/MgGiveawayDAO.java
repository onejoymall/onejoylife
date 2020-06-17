package com.webapp.manager.dao;

import com.webapp.board.common.FileVO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.manager.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class MgGiveawayDAO {

    @Autowired
    private SqlSession sql;
    public Map<String,Object> getGiveawayViewDetail(Map<String,Object> params) throws SQLException {
        Map<String,Object> getGiveawayViewDetail=sql.selectOne("mall.GiveawayMapper.getGiveawayDetail",params);
        return getGiveawayViewDetail;
    }
    public Map<String,Object> getGiveawayPlayViewDetail(Map<String,Object> params) throws SQLException {
    	Map<String,Object> getGiveawayPlayViewDetail=sql.selectOne("mall.GiveawayMapper.getGiveawayPlayDetail",params);
    	return getGiveawayPlayViewDetail;
    }
    public void insertGiveaway(GiveawayVO giveawayVO) throws SQLException{
        sql.insert("mall.GiveawayMapper.insertGiveaway",giveawayVO);
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
    public void insertGiveawayCopy(Map<String,Object> params) throws Exception{
        sql.insert("mall.GiveawayMapper.insertGiveawayCopy",params);
    }
    public void insertGiveawayFileCopy(Map<String,Object> params) throws Exception{
        sql.insert("mall.GiveawayMapper.insertGiveawayFileCopy",params);
    }
    public void updateGiveaway(GiveawayVO giveawayVO) throws SQLException{
        sql.update("mall.GiveawayMapper.updateGiveaway",giveawayVO);
    }
    public void deleteProductFile(GiveawayVO giveawayVO) throws SQLException{
        sql.delete("mall.ProductMapper.deleteProductFile",giveawayVO);
    }
}
