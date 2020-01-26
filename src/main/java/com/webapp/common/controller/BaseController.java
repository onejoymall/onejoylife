package com.webapp.common.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.webapp.common.model.ComboVo;
import com.webapp.common.service.I18nSo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.ModelAttribute;


public class BaseController {

	@Autowired
	private ServletContext sc;
	@Autowired
	private I18nSo i18nSo;
	
	@ModelAttribute("locales")
	public List<ComboVo> getLocales() {
		Locale inLocale = LocaleContextHolder.getLocale();

		List<ComboVo> list = new ArrayList<ComboVo>();

		List<Locale> locales = i18nSo.getUsableLocale();

		for (Locale locale : locales) {
			ComboVo combo = new ComboVo();
			combo.setValue(locale.getLanguage());
			combo.setDisplay(locale.getDisplayLanguage(inLocale));

			list.add(combo);
		}

		return list;
	}

	@ModelAttribute("locale")
	public Locale getLocale() {
		return LocaleContextHolder.getLocale();
	}

	@ModelAttribute("contextPath")
	public String getContextPath() {
		return sc.getContextPath();
	}

	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		// bind empty strings as null
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
}
