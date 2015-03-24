package com.jokerstation.webframe.action.console;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;
import com.jokerstation.webframe.dao.console.ConsoleRoleDao;
import com.jokerstation.webframe.dao.console.ConsoleUserDao;
import com.jokerstation.webframe.util.PasswordUtil;
import com.jokerstation.webframe.vo.console.ConsoleRole;
import com.jokerstation.webframe.vo.console.ConsoleUser;

/**
 * 登录校验的action
 * @author Joker
 *
 */
public class CheckAction extends BaseAction {

	private static final long serialVersionUID = -2636000022533920338L;

	private static final Logger logger = Logger.getLogger(CheckAction.class);
	
	private static final String LOGIN = "login";
	private static final String INDEX = "index";
	
	/**
	 * 登录校验
	 * @return
	 */
	public String loginCheck() {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		String errMsg = "";
		try{
			if(!StringUtils.isBlank(account) && !StringUtils.isBlank(password)){
				ConsoleUserDao consoleUserDao = new ConsoleUserDao();
				ConsoleUser consoleUser = consoleUserDao.getByAccount(account);
				if(null != consoleUser){
					String md5Pwd = PasswordUtil.MD5(password);
					if(md5Pwd.equals(consoleUser.getPassword())){
						consoleUser.setLastLoginIp(getIpAddr());
						consoleUser.setLastLoginTime(new Date());
						consoleUserDao.update(consoleUser);
						
						ConsoleRole consoleRole = new ConsoleRoleDao().get(consoleUser.getRole());
						
						request.getSession().setAttribute("console_user", consoleUser);
						request.getSession().setAttribute("console_role", consoleRole);
						return INDEX;
					}
				}
				
				errMsg = "账号或密码错误!";
			}
		}catch (Exception e) {
			logger.error("后台登陆验证出错!", e);
			errMsg = "服务器出错!";
		}
		setAttribute("account", account);
		setAttribute("errMsg", errMsg);
		
		return LOGIN;
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	public String logout(){
		request.getSession().setAttribute("console_user", null);
		request.getSession().setAttribute("console_role", null);
		return LOGIN;
	}
}
