package com.jokerstation.webframe.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jokerstation.webframe.vo.console.ConsoleRole;
import com.jokerstation.webframe.vo.console.ConsoleUser;

/**
 * 后台操作filter
 * @author Joker
 *
 */
public class ConsoleFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		String uri = request.getRequestURI();
		
		ConsoleUser consoleUser = (ConsoleUser)request.getSession().getAttribute("console_user");
		
		if(null == consoleUser){
			// 没登录
			response.sendRedirect(request.getContextPath() + "/consolecheck/login.jsp");
			
			return;
		}else{
			// 已登录
			
			// 跳转首页
			if(uri.endsWith("console") || uri.endsWith("console/")){
				request.getRequestDispatcher("/console/index.do").forward(request, response);
				return;
			}
			
			ConsoleRole consoleRole = (ConsoleRole)request.getSession().getAttribute("console_role");
			//没权限
			if(null == consoleRole){
				response.sendRedirect(request.getContextPath() + "/error/403.jsp");
				return;
			}
			
			//校验权限
			boolean authority = false;
			if(uri.indexOf("/", uri.indexOf("/console/") + 9) > 0){
				String contextPath = request.getContextPath();
				String[] namespaces = consoleRole.getNamespace().split(",");	
				for(String namespace : namespaces){
					if(uri.startsWith(contextPath + namespace)){
//						System.out.println("namespace: " + namespace);
						authority = true;
						break;
					}
				}
			}else{
				//不过滤  '/console/XXX.do'
				authority = true;
			}
			
			if(authority){
				chain.doFilter(req, resp);
			}else{
				response.sendRedirect(request.getContextPath() + "/error/403.jsp");
				return;
			}
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
