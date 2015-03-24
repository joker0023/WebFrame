package com.jokerstation.webframe.dao.web;

import com.jokerstation.webframe.dao.BaseDao;
import com.jokerstation.webframe.vo.web.PageSetting;

/**
 * 页面设置vo的dao
 * @author Joker
 *
 */
public class PageSettingDao extends BaseDao<PageSetting> {

	public PageSettingDao() {
		super(PageSetting.class);
	}
	
	public PageSetting getByPageId(String pageId) throws Exception {
		PageSetting entity = new PageSetting();
		entity.setPageId(pageId);
		
		return this.get(entity);
	}
}
