package com.jokerstation.webframe.dao.web;

import java.util.List;

import com.jokerstation.webframe.dao.BaseDao;
import com.jokerstation.webframe.vo.web.About;

/**
 * 关于我们vo的dao
 * @author Joker
 *
 */
public class AboutDao extends BaseDao<About> {

	public AboutDao() {
		super(About.class);
	}
	
	public List<About> listByShowIn() throws Exception {
		About entity = new About();
		entity.setShowIn(true);
		return this.filter(entity, null, 0, 0, "sort");
	}
}
