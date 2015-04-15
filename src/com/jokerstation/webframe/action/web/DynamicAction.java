package com.jokerstation.webframe.action.web;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;
import com.jokerstation.webframe.dao.web.DynamicDao;
import com.jokerstation.webframe.vo.web.Dynamic;

public class DynamicAction extends BaseAction {
	
	private static final long serialVersionUID = -1996510342001542386L;

	private static final Logger logger = Logger.getLogger(DynamicAction.class);
	
	/**
	 * 列表
	 * @return
	 */
	public String list() {
		try{
			setAttribute("webTitle", "动态列表");
			DynamicDao dao = new DynamicDao();
			int count = (int)dao.countLikeTitle(null);
			pager.setPageSize(20);
			pager.setTotalRowsAmount(count);
			List<Dynamic> list = dao.list(null, pager.getCurrentPage(), pager.getPageSize());
			
			setAttribute("list", list);
		}catch (Exception e) {
			logger.error("动态列表页出错", e);
		}
		
		return "list";
	}
	
	/**
	 * 详细
	 */
	public String detail() {
		try{
			String id = request.getParameter("id");
			if(StringUtils.isNotBlank(id)){
				Dynamic dynamic = new DynamicDao().get(Long.valueOf(id));
				setAttribute("dynamic", dynamic);
				setAttribute("webTitle", dynamic.getTitle());
			}
		}catch (Exception e) {
			logger.error("动态列表详情出错", e);
		}
		
		return "detail";
	}
}
