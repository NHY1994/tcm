package com.tcm.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// TODO Auto-generated method stub
		// place your code here
		HttpSession session = httpRequest.getSession();
		String uri = httpRequest.getRequestURI();
		System.out.println(uri);
		if (uri.equals("/TCM/")||uri.equals("/TCM/login_test")) {

		} else {
			String sessionvalue = (String) session.getAttribute("username");
			System.out.println(sessionvalue);
			if (sessionvalue != null) {
				System.out.println("123");
				
			} else{
				System.out.println(uri);
				httpServletResponse.sendRedirect("/TCM/");
			}
				
		}
		request.setCharacterEncoding("utf-8"); 
		chain.doFilter(request, response);
		// pass the request along the filter chain
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
