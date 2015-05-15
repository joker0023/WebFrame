package com.jokerstation.webframe.action.console;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;
import com.jokerstation.webframe.dao.web.AboutDao;
import com.jokerstation.webframe.vo.web.About;

/**
 * 关于我们页面的action
 * @author Joker
 *
 */
public class AboutAction extends BaseAction {

	private static final long serialVersionUID = -4709568244531533214L;

	private static final Logger logger = Logger.getLogger(AboutAction.class);
	
	private static final String ABOUT = "about";
	private static final String ABOUTSETTING = "aboutSetting";
	private static final String ADDABOUT = "addAbout";
	private static final String EDITABOUT = "editAbout";
	
	/**
	 * 跳转关于我们页面
	 * @return
	 */
	public String about() {
		setAttribute("menu", "about");
		return ABOUT;
	}
	
	/**
	 * 跳转关于我们设置页面
	 * @return
	 */
	public String aboutSetting() {
		try{
			List<About> aboutList = new AboutDao().listAll();
			if(null != aboutList && aboutList.size() > 0){
				setAttribute("aboutList", aboutList);
			}
		}catch (Exception e) {
			logger.error("跳转 关于我们 设置页面出错", e);
		}
		
		return ABOUTSETTING;
	}
	
	/**
	 * 新增
	 * @return
	 */
	public String addAbout() {
		setAttribute("breadcrumb", "新增");
		return ADDABOUT;
	}
	
	/**
	 * 编辑
	 * @return
	 */
	public String editAbout() {
		try{
			setAttribute("breadcrumb", "编辑");
			
			String id = request.getParameter("id");
			if(null == id){
				return ABOUTSETTING;
			}
			AboutDao aboutDao = new AboutDao();
			About about = aboutDao.get(Long.valueOf(id));
			setAttribute("about", about);
		}catch (Exception e) {
			logger.error("跳转编辑'关于我们'页面出错", e);
			return ABOUTSETTING;
		}
		
		return EDITABOUT;
	}
	
	/**
	 * 保存
	 */
	public void saveAbout() {
		try{
			String id = request.getParameter("id");
			String tabName = request.getParameter("tabName");
			String sort = request.getParameter("sort");
			String showin = request.getParameter("showin");
			String html = request.getParameter("html");
			
			AboutDao aboutDao = new AboutDao();
			About about = null;
			if(StringUtils.isBlank(id)){
				//新增
				about = new About();
			}else{
				//编辑
				about = aboutDao.get(Long.valueOf(id));
				if(null == about){
					flushJSONData(false);
					return;
				}
			}
			
			about.setTabName(tabName);
			if(StringUtils.isNotBlank(sort) && StringUtils.isNumeric(sort)){
				about.setSort(Integer.valueOf(sort));
			}else{
				about.setSort(1);
			}
			if("1".equals(showin)){
				about.setShowIn(true);
			}else{
				about.setShowIn(false);
			}
			about.setHtml(html);
			about.setModified(new Date());
			
			if(StringUtils.isBlank(id)){
				aboutDao.save(about);
			}else{
				aboutDao.update(about);
			}
			
			
			flushJSONData(true);
		}catch (Exception e) {
			logger.error("保存about出错", e);
		}
	}
	
	/**
	 * 删除
	 */
	public void delAbout() {
		try{
			String id = request.getParameter("id");
			if(null != id){
				new AboutDao().delete(Long.valueOf(id));
				flushJSONData(true);
				return;
			}
		}catch (Exception e) {
			logger.error("删除about出错", e);
		}
		
		flushJSONData(false);
	}
	
}
