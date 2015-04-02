package com.jokerstation.webframe.dao.web;

import java.util.List;

import com.jokerstation.webframe.dao.BaseDao;
import com.jokerstation.webframe.vo.web.Dynamic;

/**
 * 动态vo的Dao
 * @author Administrator
 *
 */
public class DynamicDao extends BaseDao<Dynamic> {
	
	public DynamicDao() {
		super(Dynamic.class);
	}
	
	public List<Dynamic> list(String keyWord, int page, int size) throws Exception {
		String condition = null;
		if(null != keyWord){
			condition = "title like '%" + keyWord + "%'";
		}
		
		return this.filter(condition, page, size, "type asc, modified desc");
		
	}
	
	public long countLikeTitle(String keyWord) throws Exception {
		String condition = null;
		if(null != keyWord){
			condition = "title like '%" + keyWord + "%'";
		}
		
		return this.count(condition);
		
	}

}
