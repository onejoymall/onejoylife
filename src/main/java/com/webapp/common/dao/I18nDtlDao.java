package com.webapp.common.dao;

import java.util.HashMap;
import com.webapp.common.model.I18nDtl;

public interface I18nDtlDao {
	
	public I18nDtl selectById(HashMap<String, Object> hMap);
}
