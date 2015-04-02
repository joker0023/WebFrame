package com.jokerstation.webframe.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jokerstation.webframe.dao.comm.LinkDao;
import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.vo.comm.Link;

/**
 * 页面filter
 * @author Joker
 *
 */
public class WebFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		try{
			HttpServletRequest request = (HttpServletRequest)req;
			HttpSession session = request.getSession();
			String sessionAlive = (String)session.getAttribute("sessionAlive");
			if(null == sessionAlive){
				session.setAttribute("webName", Data.webName);
				List<Link> linkList = new LinkDao().listAll();
				session.setAttribute("linkList", linkList);
				session.setAttribute("sessionAlive", "true");
			}
		}catch (Exception e) {
			
		}
		
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
