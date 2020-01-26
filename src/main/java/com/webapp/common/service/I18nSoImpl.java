package com.webapp.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import com.webapp.common.dao.I18nDtlDao;
import com.webapp.common.dao.I18nLangDao;
import com.webapp.common.model.I18nDtl;
import com.webapp.common.model.I18nLang;
import com.webapp.common.support.MessageSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;


@Service
public class I18nSoImpl implements I18nSo, MessageSource {

	@Autowired
	private I18nLangDao i18nLangMapper;
	
//	@Autowired
//	private I18nDao i18nMapper;
	
	@Autowired
	private I18nDtlDao i18nDtlMapper;

	
	/**
	 * Locale 목록 리턴
	 */
	public List<Locale> getUsableLocale() {
		List<Locale> locales = new ArrayList<Locale>();

		List<I18nLang> list = i18nLangMapper.select();

		for (I18nLang i18nLang : list) {
			Locale locale = findLocale(i18nLang.getLangCd());

			if (locale != null) {
				locales.add(locale);
			}
		}

		return locales;
	}
	
	private Locale findLocale(String language) {

		for (Locale locale : Locale.getAvailableLocales()) {
			if (locale.getLanguage().equals(language)) {
				return locale;
			}
		}

		return null;
	}
	
	/**
	 * Message Source
	 */
	public String getMessage(String code, String locale) {
		I18nDtl i18nDtl = inquireDetail(code, locale);
		if (i18nDtl == null) {
			return null;
		}

		return i18nDtl.getDispCont();
	}
	
	public I18nDtl inquireDetail(String msgId, String langCd) {

		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("msgId", msgId);
		hMap.put("langCd", langCd);
		
		I18nDtl i18nDtl = i18nDtlMapper.selectById(hMap);

		if (i18nDtl == null) {
			return null;
		}

		if (i18nDtl.getLangCd() != null) {
			Locale locale = findLocale(i18nDtl.getLangCd());
			i18nDtl.setLangNm(getLanguageName(locale));
		}

		return i18nDtl;
	}

	/**
	 * 
	 * @param language
	 * @return
	 */
	private String getLanguageName(Locale locale) {
		return locale.getDisplayLanguage(LocaleContextHolder.getLocale());
	}
}
