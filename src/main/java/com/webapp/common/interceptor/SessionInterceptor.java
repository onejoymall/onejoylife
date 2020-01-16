package com.webapp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    logger.error("===========================          START         ===========================");
	    logger.error(" Request URI \t:  " + request.getRequestURI());
	    
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    
	    if("anonymous".equals(principal)) {
	    	response.sendRedirect("/login");
	    	return false;
	    }
	    
	    return super.preHandle(request, response, handler);
	 }
	 
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    logger.error("===========================          END           ===========================");
	 }
}
