package com.jokerstation.webframe.dao.console;

import java.util.Date;
import java.util.List;

import com.jokerstation.base.dao.BaseDao;
import com.jokerstation.base.util.DateUtil;
import com.jokerstation.webframe.vo.console.ActionLog;

/**
 * 用户行为vo的 Dao
 * @author Joker
 *
 */
public class ActionLogDao extends BaseDao<ActionLog> {

	public ActionLogDao() {
		super(ActionLog.class);
	}
	
	public long count(Date start, Date end, String account) throws Exception {
		ActionLog entity = new ActionLog();
		StringBuilder condition = new StringBuilder();
		if(null != start){
			condition.append("time >= '");
			condition.append(DateUtil.getStringByDateTime(start));
			condition.append("'");
		}
		if(null != end){
			if(condition.length() > 0){
				condition.append(" and ");
			}
			condition.append("time <= '");
			condition.append(DateUtil.getStringByDateTime(end));
			condition.append("'");
		}
		
		String _condition = null;
		if(condition.length() > 0){
			_condition = condition.toString();
		}
		
		if(null != account){
			entity.setAccount(account);
		}
		
		return this.count(entity, _condition);
	}
	
	public List<ActionLog> list(Date start, Date end, String account, int page, int size) throws Exception {
		ActionLog entity = new ActionLog();
		StringBuilder condition = new StringBuilder();
		if(null != start){
			condition.append("time >= '");
			condition.append(DateUtil.getStringByDateTime(start));
			condition.append("'");
		}
		if(null != end){
			if(condition.length() > 0){
				condition.append(" and ");
			}
			condition.append("time <= '");
			condition.append(DateUtil.getStringByDateTime(end));
			condition.append("'");
		}
		
		String _condition = null;
		if(condition.length() > 0){
			_condition = condition.toString();
		}
		
		if(null != account){
			entity.setAccount(account);
		}
		
		return this.filter(entity, _condition, page, size, "time desc");
	}
}
