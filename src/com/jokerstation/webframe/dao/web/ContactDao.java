package com.jokerstation.webframe.dao.web;

import java.util.List;

import com.jokerstation.base.dao.BaseDao;
import com.jokerstation.webframe.vo.web.Contact;

/**
 * 联系我们vo的dao
 * @author Joker
 *
 */
public class ContactDao extends BaseDao<Contact>{

	public ContactDao() {
		super(Contact.class);
	}
	
	public Contact getOne() throws Exception {
		List<Contact> list = this.listAll();
		if(null != list && list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
}
