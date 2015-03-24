package com.jokerstation.webframe.action.web;

import java.util.List;

import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;
import com.jokerstation.webframe.dao.web.AboutDao;
import com.jokerstation.webframe.dao.web.CarouselDao;
import com.jokerstation.webframe.dao.web.ContactDao;
import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.vo.web.About;
import com.jokerstation.webframe.vo.web.Carousel;
import com.jokerstation.webframe.vo.web.Contact;

/**
 * 各大页面的跳转
 * @author Joker
 *
 */
public class HomeAction extends BaseAction {

	private static final long serialVersionUID = 2072240603785829418L;

	private static final Logger logger = Logger.getLogger(HomeAction.class);
	
	private static final String INDEX = "index";
	
	private static final String CONTACT = "contact";
	
	private static final String ABOUT = "about";
	
	private static final String PRODUCT = "product";
	
	private static final String RECRUITMENT = "recruitment";
	
	/**
	 * 设置头部数据
	 */
	private void serHeader() {
		setAttribute("href", getRootHostUrl());
		setAttribute("webName", Data.webName);
	}
	
	/**
	 * 跳转首页
	 * @return
	 */
	public String index() {
		try{
			serHeader();
			setAttribute("menu", "index");
			List<Carousel> carouselList = new CarouselDao().listAllBySort();
			if(null != carouselList && carouselList.size() > 0){
				setAttribute("carouselList", carouselList);
			}
		}catch (Exception e) {
			logger.error("跳转首页出错", e);
		}
		
		return INDEX;
	}
	
	/**
	 * 跳转到 关于我们 页面
	 * @return
	 */
	public String about() {
		try{
			serHeader();
			setAttribute("menu", "about");
			AboutDao aboutDao = new AboutDao();
			List<About> list = aboutDao.listByShowIn();
			setAttribute("list", list);
		}catch (Exception e) {
			logger.error("跳转到 关于我们 页面出错", e);
		}
		return ABOUT;
	}
	
	/**
	 * 跳转产品介绍页面
	 * @return
	 */
	public String product() {
		try{
			serHeader();
			setAttribute("menu", "product");
			
		}catch (Exception e) {
			logger.error("跳转产品介绍页面出错", e);
		}
		
		return PRODUCT;
	}
	
	/**
	 * 跳转招聘页面
	 * @return
	 */
	public String recruitment() {
		try{
			serHeader();
			setAttribute("menu", "recruitment");
		}catch (Exception e) {
			logger.error("跳转招聘页面出错", e);
		}
		
		return RECRUITMENT;
	}

	/**
	 * 跳转联系我们页面
	 * @return
	 */
	public String contact() {
		try{
			serHeader();
			setAttribute("menu", "contact");
			Contact contact = new ContactDao().getOne();
			setAttribute("contact", contact);
			if(null != contact && null != contact.getOther()){
				String other = contact.getOther().replace("\n", "<br>");
				setAttribute("other", other);
			}
		}catch (Exception e) {
			logger.error("跳转联系我们页面出错", e);
		}
		
		return CONTACT;
	}
}
