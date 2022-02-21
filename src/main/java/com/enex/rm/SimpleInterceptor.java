package com.enex.rm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SimpleInterceptor extends HandlerInterceptorAdapter{
	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception { 
		HttpSession session = request.getSession(false);
		if(session==null || session.getAttribute("usrID")==null) {
			System.out.println("세션이 사라졌습니다.");
			response.sendRedirect("logout.do");
			return false; // 컨트롤러 메서드 수행하지 않게 한다.
		}else {
			//System.out.println("세션 체크 : " + session.getAttribute("usrID"));
		}
		return true;
	}


}
