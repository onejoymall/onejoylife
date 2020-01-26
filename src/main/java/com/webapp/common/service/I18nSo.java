package com.webapp.common.service;

import java.util.List;
import java.util.Locale;

public interface I18nSo {

	
	/**
	 * Locale 목록 리턴
	 * 
	 * @return
	 */
	public List<Locale> getUsableLocale();
	
	public String getMessage(String msgId, String locale);
	
}
