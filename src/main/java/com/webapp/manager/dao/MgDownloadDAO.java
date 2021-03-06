package com.webapp.manager.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.jcodec.common.DictionaryCompressor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.board.common.SearchVO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.ProductVO;

@Repository
public class MgDownloadDAO {
    @Autowired
    private SqlSession sql;
    public  List<Map<String,Object>> getProductDtoList(MgCommonVO mgCommonVO) throws SQLException {
        List<Map<String,Object>> getProductDtoList = sql.selectList("mall.MgDownloadMapper.getProductDtoList",mgCommonVO);
        return getProductDtoList;
    }
    
    public  List<Map<String,Object>> getGiveawayDtoList(MgCommonVO mgCommonVO) throws SQLException {
        List<Map<String,Object>> getGiveawayDtoList = sql.selectList("mall.MgDownloadMapper.getGiveawayDtoList",mgCommonVO);
        return getGiveawayDtoList;
    }
    
    public  List<Map<String,Object>> getOrderDtoList(MgCommonVO mgCommonVO) throws SQLException {
    	List<Map<String,Object>> getOrderDtoList = sql.selectList("mall.MgDownloadMapper.getOrderDtoList",mgCommonVO);
    	return getOrderDtoList;
    }
    
    public  List<Map<String,Object>> getReturnedDtoList(MgCommonVO mgCommonVO) throws SQLException {
    	List<Map<String,Object>> getReturnedDtoList = sql.selectList("mall.MgDownloadMapper.getReturnedDtoList",mgCommonVO);
    	return getReturnedDtoList;
    }

    @Transactional
	public void upadteOrderBatch(List<Map<String, Object>> list) throws SQLException {
		for(Map<String, Object> map:list) {
			if(map.get("no") != null && !map.get("no").equals("")) {
				sql.update("mall.MgDownloadMapper.updatePaymentBundleBatch", map);
			}
		}
	}
    @Transactional
    public void upadteGiveawayPartBatch(List<Map<String, Object>> list) throws SQLException {
    	for(Map<String, Object> map:list) {
    		sql.update("mall.MgDownloadMapper.upadteGiveawayPart", map);
    	}
    }

	public List<Map<String, Object>> getGiveawayPartDtoList(MgCommonVO mgCommonVO) {
		List<Map<String,Object>> getGiveawayPartDtoList = sql.selectList("mall.MgDownloadMapper.getGiveawayPartDtoList",mgCommonVO);
    	return getGiveawayPartDtoList;
	}
    @Transactional
    public void updateProduct(List<Map<String, Object>> list) throws SQLException {
        for(Map<String, Object> map:list) {
            //양식 다운로드 후 상품PK 입력시 'PK번호.0'으로 들어올 경우
            String productIdVal = (String) map.get("product_id");
            if(productIdVal.contains(".")){
                String[] splitArr = productIdVal.split("[.]");
                productIdVal = splitArr[0];
            }
            //map.put("product_id", Integer.parseInt((String) map.get("product_id")));
            map.put("product_id", Integer.parseInt((String) productIdVal));
            sql.insert("mall.MgDownloadMapper.updateProduct", map);
        }
    }
}
