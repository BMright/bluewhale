package com.bluewhale.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		HttpSession session = request.getSession();
		String isLogin = (String) session.getAttribute("loginStatus");
		String path = request.getRequestURI();
		System.out.println("path:" + path);
		if (path.equals("/bluewhale/toLogin") || path.equals("/bluewhale/getIsLogin") || path.contains(".")) {
			chain.doFilter(req, res);
		}
		else if (isLogin == "true") {
			chain.doFilter(req, res);
		}
		else {
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void destroy() {	
	}

}
