package lmx.extend;

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

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest  servletRequest=(HttpServletRequest) request;
		HttpServletResponse servletResponse=(HttpServletResponse) response;
		HttpSession session=servletRequest.getSession();
		
		String path=servletRequest.getRequestURI();
		
		String userSession = (String) session.getAttribute("userSession");

		if(path.indexOf("login.html")>-1){
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		
		if(path.indexOf("/checkUser.spring") > -1){
			if(userSession != null)
				servletResponse.sendRedirect("./index.jsp");
			else{
				chain.doFilter(servletRequest, servletResponse);
				return;
			}
		}else if(userSession == null){
			servletResponse.sendRedirect("./login.html");
		}else if(userSession.equals("人事部长")){
			chain.doFilter(servletRequest, servletResponse);
		}
//		}else if(userSession == null){
//			servletResponse.sendRedirect("../left.html");
//		}else if(userSession.equals("人事部长")){
//			servletResponse.sendRedirect("../index.jsp");
//		}
		/*
		if(path.indexOf("/lmx/showEmployeelistfirst.spring")>-1 || path.indexOf("/BookManageSystem/bookinfo-delete")>-1 || path.indexOf("/BookManageSystem/bookinfo-edit")>-1){
			if(adminname==null){
				
			}else{
				chain.doFilter(servletRequest, servletResponse);
			}
		}else{
			chain.doFilter(servletRequest, servletResponse);
		}*/
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
