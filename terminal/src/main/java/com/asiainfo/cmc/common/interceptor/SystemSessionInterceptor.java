package com.asiainfo.cmc.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SystemSessionInterceptor implements HandlerInterceptor {
	 private static final String LOGIN_URL="/login.jsp";  
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		
		 if (obj==null||"".equals(obj.toString())) {  
	            response.sendRedirect(request.getSession().getServletContext().getContextPath()+LOGIN_URL);
	                 return false;
	           }
	           return true;
	}

}
