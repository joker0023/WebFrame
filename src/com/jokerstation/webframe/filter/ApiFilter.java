package com.jokerstation.webframe.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.jokerstation.base.helper.HttpHelper;
import com.jokerstation.base.util.ApiRequestUtils;

/**
 * api请求过滤
 * @author Joker
 *
 */
public class ApiFilter implements Filter {

	private static final Logger logger = Logger.getLogger(ApiFilter.class);
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		try{
			HttpServletRequest req = (HttpServletRequest)request;
			String uri = req.getRequestURI();
			boolean check = ApiRequestUtils.checkRequest(req, null);
			if(!check){
				logger.warn(uri + " 非法请求 ip: " + HttpHelper.getRealIpAddress(req));
				return;
			}else{
				String timestamp = req.getParameter("timestamp");
				if(null != timestamp){
					long now = System.currentTimeMillis();
					
					if(now - Long.valueOf(timestamp) > 30 * 60 * 1000){
						logger.warn(uri + " 请求过时 ip: " + HttpHelper.getRealIpAddress(req));
					}else{
						//半小时内有效
						chain.doFilter(request, response);
					}
				}
			}
		}catch (Exception e) {
			logger.error("过滤外部请求出错", e);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
