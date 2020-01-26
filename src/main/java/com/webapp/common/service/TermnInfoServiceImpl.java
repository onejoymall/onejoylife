package com.webapp.common.service;

import java.util.HashMap;

import com.webapp.common.dao.TermnInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TermnInfoServiceImpl implements TermnInfoService {

	@Autowired 
    private TermnInfoDao dao;
	
	/**
	 * 단말기 ID 유무
	 * 
	 * @return
	 */
	public String selectTrcnId(HashMap<String, String> hMap) {
		return dao.selectTrcnId(hMap);
	}
}
