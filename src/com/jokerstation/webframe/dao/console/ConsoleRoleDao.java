package com.jokerstation.webframe.dao.console;

import java.sql.SQLException;
import java.util.List;

import com.jokerstation.base.dao.BaseDao;
import com.jokerstation.webframe.vo.console.ConsoleRole;

/**
 * 后台用户角色vo的Dao
 * @author Joker
 *
 */
public class ConsoleRoleDao extends BaseDao<ConsoleRole>{

	public ConsoleRoleDao() {
		super(ConsoleRole.class);
	}
	
	public List<ConsoleRole> listGtId(Long id) throws SQLException{
		String condition = " id > " + id;
		return this.filter(condition, 0, 0, null);
	}
}
