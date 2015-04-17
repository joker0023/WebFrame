package com.jokerstation.webframe.action.web;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;
import com.jokerstation.webframe.dao.web.AboutDao;
import com.jokerstation.webframe.dao.web.CarouselDao;
import com.jokerstation.webframe.dao.web.ContactDao;
import com.jokerstation.webframe.dao.web.DynamicDao;
import com.jokerstation.webframe.dao.web.RecruitmentCatDao;
import com.jokerstation.webframe.dao.web.RecruitmentDao;
import com.jokerstation.webframe.vo.web.About;
import com.jokerstation.webframe.vo.web.Carousel;
import com.jokerstation.webframe.vo.web.Contact;
import com.jokerstation.webframe.vo.web.Dynamic;
import com.jokerstation.webframe.vo.web.Recruitment;
import com.jokerstation.webframe.vo.web.RecruitmentCat;

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
	 * 跳转首页
	 * @return
	 */
	public String index() {
		try{
			setAttribute("menu", "index");
			setAttribute("webTitle", "首页");
			List<Carousel> carouselList = new CarouselDao().listAllBySort();
			if(null != carouselList && carouselList.size() > 0){
				setAttribute("carouselList", carouselList);
			}
			
			List<Dynamic> dynamicList = new DynamicDao().list(null, 1, 10);
			if(null != dynamicList && dynamicList.size() > 0){
				setAttribute("dynamicList", dynamicList);
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
			setAttribute("menu", "about");
			setAttribute("webTitle", "关于我们");
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
			setAttribute("menu", "product");
			setAttribute("webTitle", "产品介绍");
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
			setAttribute("menu", "recruitment");
			setAttribute("webTitle", "诚聘英才");
			
			String cat = request.getParameter("cat");
			List<RecruitmentCat> catList = new RecruitmentCatDao().listShow();
			if(null != catList && catList.size() > 0){
				RecruitmentCat curCat = null;
				if(StringUtils.isBlank(cat)){
					curCat = catList.get(0);
				}else{
					for(RecruitmentCat c : catList){
						if(Integer.valueOf(cat).equals(c.getId())){
							curCat = c;
							break;
						}
					}
				}
				
				if(null == cat){
					curCat = catList.get(0);
				}
				
				RecruitmentDao recruitmentDao = new RecruitmentDao();
				int count = (int)recruitmentDao.countByCat(curCat.getId(), true);
				pager.setTotalRowsAmount(count);
				List<Recruitment> list = new RecruitmentDao().listByCat(curCat.getId(), true, pager.getCurrentPage(), pager.getPageSize());
				
				setAttribute("catList", catList);
				setAttribute("curCat", curCat);
				if(list.size() > 0){
					setAttribute("list", list);
				}
			}
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
			setAttribute("menu", "contact");
			setAttribute("webTitle", "联系我们");
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
