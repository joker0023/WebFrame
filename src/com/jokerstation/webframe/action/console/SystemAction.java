package com.jokerstation.webframe.action.console;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.RandomAccessFile;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;
import com.jokerstation.base.data.BaseData;
import com.jokerstation.base.util.DateUtil;
import com.jokerstation.base.util.PasswordUtil;
import com.jokerstation.webframe.dao.console.ActionLogDao;
import com.jokerstation.webframe.dao.console.ConsoleUserDao;
import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.vo.console.ActionLog;
import com.jokerstation.webframe.vo.console.ConsoleUser;

/**
 * 系统设置相关的action
 * @author Joker
 *
 */
public class SystemAction extends BaseAction {

	private static final long serialVersionUID = -2460492184239308431L;
	
	private static final Logger logger = Logger.getLogger(SystemAction.class);
	
	private static final String SYSTEM = "system";
	private static final String CHANGEPWD = "changePwd";
	private static final String LOG = "log";
	private static final String USERLIST = "userList";
	private static final String ACTIONLIST = "actionList";
	
	/**
	 * 跳转系统设置页
	 * @return
	 */
	public String system() {
		setAttribute("menu", "system");
		return SYSTEM;
	}
	/**
	 * 跳转修改密码页面
	 * @return
	 */
	public String changePwd() {
		setAttribute("menu", "system");
		return CHANGEPWD;
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String updatePwd() {
		try{
			String oldPwd = request.getParameter("old_pwd");
			String newPwd = request.getParameter("new_pwd");
			
			if(StringUtils.isBlank(oldPwd) || StringUtils.isBlank(newPwd)){
				setAttribute("errMsg", "参数非法");
				return CHANGEPWD;
			}
			
			ConsoleUser consoleUser = (ConsoleUser)request.getSession().getAttribute("console_user");
			String md5Pwd = PasswordUtil.MD5(oldPwd);
			if(!md5Pwd.equals(consoleUser.getPassword())){
				setAttribute("errMsg", "原密码错误");
				return CHANGEPWD;
			}
			
			md5Pwd = PasswordUtil.MD5(newPwd);
			consoleUser.setPassword(md5Pwd);
			new ConsoleUserDao().update(consoleUser);
			request.getSession().setAttribute("console_user", consoleUser);
			setAttribute("errMsg", "0");
			
			return CHANGEPWD;
		}catch (Exception e) {
			logger.error("修改密码出错", e);
			setAttribute("errMsg", e.getMessage());
		}
		
		return CHANGEPWD;
	}
	
	/**
	 * 获取日记
	 * @return
	 */
	public String getInfoLog() {
		String type = request.getParameter("type");
		if(StringUtils.isBlank(type)){
			type = "info";
		}
		setAttribute("type", type);
		
		RandomAccessFile rf = null;
		try{
			String filePath = BaseData.logWroot + "/" + type + ".log";
			
			String logStr = "";
			rf = new RandomAccessFile(filePath,"r");
			
			long len = rf.length();				//文件长度
			long start = rf.getFilePointer();	//开始位
			long nextend = start + len - 1;		//文件指针定位
			String line = null;					//存储一行的信息
			
			if(nextend >= 0){
				rf.seek(nextend);					//定位
				int c = -1;							//读取的一个字符
				int i = 0;							//读取的行数
				while(nextend > start){
					if(i > 400){
						break;
					}
					c = rf.read();
					if(c=='\n'||c=='\r'){
						i++;
						line = rf.readLine();
						if(null != line && line.length() > 0){
							line = new String(line.getBytes("ISO-8859-1"), "UTF-8");
							logStr = line + "<br>" + logStr;
						}
					}
					nextend--;
					rf.seek(nextend);
					if(nextend==0){//当文件指针退至文件开始处，跳出
						line = rf.readLine();
						if(null != line && line.length() > 0){
							line = new String(line.getBytes("ISO-8859-1"), "UTF-8");
							logStr = line + "<br>" + logStr;
						}
						break;
					}
				}
			}
			
			setAttribute("log", logStr);
		}catch (Exception e) {
			logger.error("获取日记出错", e);
		}finally {
			try{
				if(null != rf){
					rf.close();
				}
			}catch (Exception e) {
				logger.error("关闭RandomAccessFile出错", e);
			}
			
		}
		
		return LOG;
	}
	
	/**
	 * 下载日记
	 */
	public void getDownloadLog() {
		String type = request.getParameter("type");
		if(StringUtils.isBlank(type)){
			return;
		}
		
		FileInputStream in = null;
		try{
			String filePath = BaseData.logWroot + "/" + type + ".log";
					
			in = new FileInputStream(filePath);
			byte[] b = new byte[1024];
	    	ByteArrayOutputStream byteOp = new ByteArrayOutputStream(in.available()); 
	    	int i = in.read(b);
	    	while(i != -1){
	    		byteOp.write(b, 0, i);
	    		i = in.read(b);
	    	}
	    	
	    	response.setHeader("Content-Disposition" , "attachment;fileName=" + type + ".log" );
			getOutputStream(response).write(byteOp.toByteArray());
		}catch (Exception e) {
			
		}finally {
			try{
				if(null != in){
					in.close();
				}
			}catch (Exception e) {
				logger.error("关闭RandomAccessFile出错", e);
			}
		}
	}
	
	/**
	 * 跳转用户列表
	 * @return
	 */
	public String userList() {
		try{
			String keyWord = request.getParameter("keyWord");
			ConsoleUserDao dao = new ConsoleUserDao();
			
			int count = (int)dao.countByCustom(keyWord, 1L);
			pager.setTotalRowsAmount(count);
			List<ConsoleUser> userList = dao.listByCustom(keyWord, 1L, pager.getCurrentPage(), pager.getPageSize());
			setAttribute("userList", userList);
			setAttribute("keyWord", keyWord);
		}catch (Exception e) {
			logger.error("跳转用户列表出错", e);
		}
		
		return USERLIST;
	}
	
	/**
	 * 添加用户
	 */
	public void userAdd() {
		try{
			String account = request.getParameter("account");
			String pwd = request.getParameter("pwd");
			
			if(StringUtils.isNotBlank(account) && StringUtils.isNotBlank(pwd)){
				ConsoleUser user = new ConsoleUser();
				user.setAccount(account);
				user.setCreateTime(new Date());
				user.setAvatar(Data.defAvatar);
				user.setNick(account);
				user.setPassword(PasswordUtil.MD5(pwd));
				user.setRole(2L);
				user.setState(ConsoleUser.NORMAL);
				
				new ConsoleUserDao().save(user);
				flushJSONData(true);
			}
		}catch (Exception e) {
			logger.error("添加用户出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 删除用户
	 */
	public void userDel() {
		try{
			String id = request.getParameter("id");
			if(StringUtils.isNotBlank(id)){
				new ConsoleUserDao().delete(Long.valueOf(id));
				flushJSONData(true);
			}
		}catch (Exception e) {
			logger.error("删除用户出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 修改用户
	 */
	public void userUpdate() {
		try{
			String id = request.getParameter("id");
			String stat = request.getParameter("stat");
			if(StringUtils.isNotBlank(id) && StringUtils.isNotBlank(stat)){
				ConsoleUserDao dao = new ConsoleUserDao();
				ConsoleUser user= dao.get(Long.valueOf(id));
				if(null != user){
					if("on".equals(stat)){
						user.setState(ConsoleUser.NORMAL);
					}else if("off".equals(stat)){
						user.setState(ConsoleUser.DISABLED);
					}
					dao.update(user);
					flushJSONData(true);
				}
			}
		}catch (Exception e) {
			logger.error("修改用户出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 跳转用户行为列表
	 * @return
	 */
	public String actionList() {
		try{
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String account = request.getParameter("account");
			
			Date _start = null;
			Date _end = null;
			String _account = null;
			
			if(StringUtils.isNotBlank(start)){
				_start = DateUtil.getDateByString(start);
			}
			if(StringUtils.isNotBlank(end)){
				_end = DateUtil.getDateByString(end);
				_end = new Date(_end.getTime() + 24 * 3600 * 1000);
			}
			if(StringUtils.isNotBlank(account)){
				_account = account;
			}
			
			ActionLogDao dao = new ActionLogDao();
			int count = (int)dao.count(_start, _end, _account);
			pager.setTotalRowsAmount(count);
			List<ActionLog> list = dao.list(_start, _end, _account, pager.getCurrentPage(), pager.getPageSize());
			
			setAttribute("start", start);
			setAttribute("end", end);
			setAttribute("account", account);
			setAttribute("list", list);
		}catch (Exception e) {
			logger.error("跳转用户行为列表出错", e);
		}
		
		return ACTIONLIST;
	}

}
