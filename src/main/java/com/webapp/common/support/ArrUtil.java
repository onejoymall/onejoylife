package com.webapp.common.support;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ArrUtil {
	public static MessageSource messageSource;
	
	@Autowired
	public ArrUtil(MessageSource messageSource) {
		this.messageSource = messageSource;
	}
	
	public static boolean contains(List list, Object o) {
		return list.contains(o);
	}
	public static boolean contains(String[] list, Object o) {
		return Arrays.asList(list).contains(o);
	}
	public static String getMessage(String key, String locale) {
		if(locale == null || locale.equals("")) {
			locale = "ko";
		}
		return messageSource.getMessage(key, locale);
	}
}
