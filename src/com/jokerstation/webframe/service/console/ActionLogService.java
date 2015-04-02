package com.jokerstation.webframe.service.console;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.jokerstation.webframe.dao.console.ActionLogDao;
import com.jokerstation.webframe.helper.HttpHelper;
import com.jokerstation.webframe.log.UserActionLog;
import com.jokerstation.webframe.vo.console.ActionLog;
import com.jokerstation.webframe.vo.console.ConsoleUser;

/**
 * 用户行为记录的service
 * @author Joker
 *
 */
public class ActionLogService {

	private static final Logger logger = Logger.getLogger(ActionLogService.class);
	
	private static final String extension = ".do";
	
	/**
	 * 开线程记录用户行为
	 */
	public static void recordAction(HttpServletRequest request) {
		try{
//			final HttpServletRequest req = request;
//			new Thread(){
//				@Override
//				public void run() {
//					recordBtThread(req);
//				}
//			}.start();
			recordBtThread(request);
		}catch (Exception e) {
			logger.error("开线程记录用户行为出错", e);
		}
	}
	
	/**
	 * 记录用户行为
	 * @param request
	 */
	public static void recordBtThread(HttpServletRequest request) {
		try{
			String contextPath = request.getContextPath();
			String uri = request.getRequestURI();
			
			String namespace = uri.substring(0, uri.lastIndexOf("/"));
//			System.out.println("uri: " + uri);
//			System.out.println("namespace: " + namespace);
			
			
			if(namespace.equals(contextPath + "/console_check")){
				//登录校验
				consoleCheckRecord(request);
			}else if(namespace.equals(contextPath + "/console")){
				//基本后台操作
				consoleRecord(request);
			}else if(namespace.equals(contextPath + "/console/websetting")){
				//站点设置
				websettingRecord(request);
			}else if(namespace.equals(contextPath + "/console/webindex")){
				//首页设置
				webindexRecord(request);
			}else if(namespace.equals(contextPath + "/console/contact")){
				//联系我们设置
				contactRecord(request);
			}else if(namespace.equals(contextPath + "/console/about")){
				//联系我们设置
				aboutRecord(request);
			}else if(namespace.equals(contextPath + "/console/product")){
				//联系我们设置
				productRecord(request);
			}else if(namespace.equals(contextPath + "/console/recruitment")){
				//招聘设置
				recruitmentRecord(request);
			}else if(namespace.equals(contextPath + "/console/system")){
				//系统设置
				systemRecord(request);
			}else if(namespace.equals(contextPath + "/console/other/dynamic")){
				//系统-动态设置
				other_dynamicRecord(request);
			}
		}catch (Exception e) {
			logger.error("记录用户行为出错", e);
		}
	}
	
	/**
	 * 登录校验记录
	 * @param request
	 * @throws Exception
	 */
	public static void consoleCheckRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/loginCheck" + extension)){
			//登录
			action = "登录";
			account = request.getParameter("account");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/logout" + extension)){
			//退出登录
			action = "退出登录";
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}
	
	/**
	 * 基本后台操作记录
	 * @param request
	 * @throws Exception
	 */
	public static void consoleRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/upload" + extension)){
			//上传文件
			action = "上传文件";
			log(account, action, detail);
		}else if(path.startsWith("/fileManager" + extension)){
			//查看服务器文件
			action = "查看服务器文件";
			log(account, action, detail);
		}
	}
	
	/**
	 * 站点设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void websettingRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		
		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/saveSetting" + extension)){
			//修改站点设置
			action = "修改站点设置";
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/linkAdd" + extension)){
			//增加友情链接
			action = "增加友情链接";
			detail = "name=" + request.getParameter("name");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/linkUpdate" + extension)){
			//修改友情链接
			action = "修改友情链接";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/linkDel" + extension)){
			//删除友情链接
			action = "删除友情链接";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/batchDel" + extension)){
			//批量删除友情链接
			action = "批量删除友情链接";
			detail = "ids=" + request.getParameter("ids");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}
	
	/**
	 * 首页设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void webindexRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		
		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/addCarousel" + extension)){
			//新增轮播图
			action = "新增轮播图";
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/updateCarousel" + extension)){
			//新增轮播图
			action = "更新轮播图";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/saveSort" + extension)){
			//保存轮播图顺序
			action = "保存轮播图顺序";
			log(account, action, detail);
		}else if(path.startsWith("/delCarousel" + extension)){
			//删除轮播图
			action = "删除轮播图";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}
	
	/**
	 * 联系我们设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void contactRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/saveContact" + extension)){
			//保存联系信息
			action = "保存联系信息";
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}
	
	/**
	 * 关于我们设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void aboutRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/saveAbout" + extension)){
			//保存
			action = "保存'关于我们'页面";
			detail = "id=" + request.getParameter("id") + ", tabName=" + request.getParameter("tabName");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/delAbout" + extension)){
			//删除
			action = "删除'关于我们'页面";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}
	
	/**
	 * 产品介绍设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void productRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
	}
	
	/**
	 * 招聘设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void recruitmentRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/saveCat" + extension)){
			//保存招聘类目
			action = "保存招聘类目";
			detail = "id=" + request.getParameter("id") + ", name=" + request.getParameter("name");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/delCat" + extension)){
			//删除招聘类目
			action = "删除招聘类目";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/save" + extension)){
			//保存招聘条目
			action = "保存招聘条目";
			detail = "id=" + request.getParameter("id") + ", title=" + request.getParameter("title");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/del" + extension)){
			//删除招聘条目
			action = "删除招聘条目";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}
	
	/**
	 * 系统设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void systemRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/updatePwd" + extension)){
			//修改密码
			action = "修改密码";
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/getDownloadLog" + extension)){
			//下载日记
			action = "下载日记";
			log(account, action, detail);
		}else if(path.startsWith("/userAdd" + extension)){
			//添加用户
			action = "添加用户";
			detail = "account=" + request.getParameter("account");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/userUpdate" + extension)){
			//修改用户
			action = "修改用户";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
		}else if(path.startsWith("/userDel" + extension)){
			//删除用户
			action = "删除用户";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}
	
	/**
	 * 动态设置记录
	 * @param request
	 * @throws Exception
	 */
	public static void other_dynamicRecord(HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));

		String account = getAccount(request);
		String action = null;
		String detail = null;
		
		if(path.startsWith("/save" + extension)){
			//保存
			action = "保存动态";
			detail = "id=" + request.getParameter("id") + ", title=" + request.getParameter("title");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}else if(path.startsWith("/del" + extension)){
			//删除
			action = "删除动态";
			detail = "id=" + request.getParameter("id");
			log(account, action, detail);
			saveAction(account, action, detail, request);
		}
	}

	
	/**
	 * 获取当前登录账号
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static String getAccount(HttpServletRequest request) throws Exception {
		ConsoleUser user = (ConsoleUser)request.getSession().getAttribute("console_user");
		if(null != user){
			return user.getAccount();
		}
		
		return null;
	}
	
	/**
	 * log用户行为
	 * @param account
	 * @param action
	 * @param detail
	 */
	public static void log(String account, String action, String detail){
		String logMsg = "用户: " + account + ", action: " + action;
		if(null != detail){
			logMsg += ", " + detail;
		}
		UserActionLog.info(logMsg);
	}
	
	/**
	 * 保存用户行为记录
	 * @param account
	 * @param action
	 * @param detail
	 * @param request
	 * @throws Exception
	 */
	public static void saveAction(String account, String action, String detail, HttpServletRequest request) throws Exception {
		ActionLog actionLog = new ActionLog();
		actionLog.setAccount(account);
		actionLog.setAction(action);
		actionLog.setDetail(detail);
		actionLog.setTime(new Date());
		actionLog.setIp(HttpHelper.getRealIpAddress(request));
		new ActionLogDao().save(actionLog);
	}
}
