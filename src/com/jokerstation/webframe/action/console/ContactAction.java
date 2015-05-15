package com.jokerstation.webframe.action.console;

import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;
import com.jokerstation.webframe.dao.web.ContactDao;
import com.jokerstation.webframe.vo.web.Contact;

/**
 * 联系我们页面的action
 * @author Joker
 *
 */
public class ContactAction extends BaseAction {

	private static final long serialVersionUID = -2035227435429576033L;

	private static final Logger logger = Logger.getLogger(ContactAction.class);
	
	private static final String CONTACT = "contact";
	
	private static final String INFO = "info";
	
	private static final String MAP = "map";
	
	/**
	 * 跳转联系我们页面
	 * @return
	 */
	public String contact() {
		setAttribute("menu", "contact");
		return CONTACT;
	}
	
	/**
	 * 跳转设置联系信息页面
	 * @return
	 */
	public String info() {
		try{
			Contact contact = new ContactDao().getOne();
			setAttribute("contact", contact);
		}catch (Exception e) {
			logger.error("跳转设置联系信息页面出错", e);
		}
		
		return INFO;
	}
	
	/**
	 * 跳转设置地图页面
	 * @return
	 */
	public String map() {
		try{
			Contact contact = new ContactDao().getOne();
			if(null != contact){
				setAttribute("addrLng", contact.getAddrLng());
				setAttribute("addrLat", contact.getAddrLat());
			}
		}catch (Exception e) {
			logger.error("跳转设置地图页面出错", e);
		}
		
		return MAP;
	}
	
	/**
	 * 保存联系信息
	 */
	public void saveContact() {
		try{
			String addrLng = request.getParameter("addrLng");
			String addrLat = request.getParameter("addrLat");
			
			String compary = request.getParameter("compary");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String other = request.getParameter("other");
			
			boolean update = true;
			ContactDao dao = new ContactDao();
			Contact contact = dao.getOne();
			if(null == contact){
				contact = new Contact();
				update = false;
			}
			if(null != addrLng){
				contact.setAddrLng(addrLng);
			}
			if(null != addrLat){
				contact.setAddrLat(addrLat);
			}
			
			if(null != compary){
				contact.setCompary(compary);
			}
			if(null != address){
				contact.setAddress(address);
			}
			if(null != phone){
				contact.setPhone(phone);
			}
			if(null != other){
				contact.setOther(other);
			}
			
			if(update){
				dao.update(contact);
			}else{
				dao.save(contact);
			}
			
			flushJSONData(true);
		}catch (Exception e) {
			logger.error("保存联系信息出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
}
