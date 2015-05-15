package com.jokerstation.webframe.dao.comm;

import java.util.List;

import com.jokerstation.base.dao.BaseDao;
import com.jokerstation.webframe.vo.comm.WebSetting;

/**
 * 站点设置vo的Dao
 * @author Joker
 *
 */
public class WebSettingDao extends BaseDao<WebSetting>{

	public WebSettingDao() {
		super(WebSetting.class);
	}
	
	public WebSetting getOne() throws Exception {
		List<WebSetting> list = this.listAll();
		if(null != list && list.size() > 0){
			return list.get(0);
		}
		
		return null;
	}
}
