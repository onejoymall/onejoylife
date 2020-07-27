package com.webapp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.webapp.common.support.NumberGender;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    logger.debug("===========================          START         ===========================");
	    logger.debug(" Request URI \t:  " + request.getRequestURI());
	   //RestApi 사용시 (관리자단에 token 인증시 사용)
//	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

//	    if("anonymous".equals(principal)) {
//	    	response.sendRedirect("/login");
//	    	return false;
//	    }

//	    return super.preHandle(request, response, handler);

		HttpSession session = request.getSession();
		if(session.getAttribute("locale") == null) {
			session.setAttribute("locale", "ko");
		}
		Object obj = session.getAttribute("login");
		if ( obj == null ){
			session.setAttribute("nonMembersUserId",NumberGender.numberGen(6, 1));
			response.sendRedirect("/sign/login");
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
		return true;
	 }
	 
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    logger.debug("===========================          END           ===========================");
	 }
}
