package com.jokerstation.webframe.data;

import com.jokerstation.webframe.util.MailUtil;
import com.jokerstation.webframe.util.Utils;

/**
 * 基本变量,常量
 * @author Joker
 *
 */
public class Data {

	public static final String logWroot = Utils.getClassPath() + "log";
	
	public static final String dbFileName = "druid.properties";
	
	public static final String webFrameFileName = "webframe.properties";
	
	public static final String distributionFileName = "distribution.properties";
	
	public static final String mailConfFile = "mail.properties";
	
	public static final String defAvatar = "/assets/img/avatar-def.jpg";
	
	//邮件发送配置
	public static MailUtil mail;
	
	/*
	 * 以下是网站的配置信息
	 */
	
	public static String alias = null;
	
	public static String ENCODE = null; // 编码
	
	public static int PORT_HTTP = 80; // HTTP 80 端口
	
	//TODO:	初始化
	public static String DOMAIN = null; //域名
	
	//TODO:	初始化
	public static String webName = null; //网站名字
}
