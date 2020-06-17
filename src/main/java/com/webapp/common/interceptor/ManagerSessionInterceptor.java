package com.webapp.common.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerSessionInterceptor extends HandlerInterceptorAdapter {
	
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
		//개발모드
//		session.setAttribute("adminLogin","admin");
		Object obj = session.getAttribute("adminLogin");
		if ( obj == null ){
			response.sendRedirect("/Manager/ManagerSign/ManagerLogin");
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
		return true;
	 }
	 
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    logger.debug("===========================          END           ===========================");
	 }
}
