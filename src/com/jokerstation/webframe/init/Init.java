package com.jokerstation.webframe.init;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.LogManager;

import com.joker23.orm.connection.ConnectionFactory;
import com.jokerstation.webframe.dao.comm.WebSettingDao;
import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.util.MailUtil;
import com.jokerstation.webframe.util.Utils;
import com.jokerstation.webframe.vo.comm.WebSetting;

/**
 * 初始化执行对象
 * 用于web服务器启动时执行
 * @author Joker
 *
 */
public class Init implements ServletContextListener{

	private static String logRoot = "logRoot";
	
	static {
		// 初始化系统，配置log4j的log文件输出位置
		String logWroot = Data.logWroot;
		System.setProperty(logRoot, logWroot);
		System.out.println(": success to set the system property. key=" + logRoot + ", value=" + logWroot);
	}
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		//加载数据库配置文件
		try{
			// 读取配置文件,获得默认值
			getDistProperties();
			
			//初始化数据库
			ConnectionFactory.init(Data.alias, Data.dbFileName);
			
			// 初始化邮件配置
			initMail();
			
			// 初始化变量
			initData();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.print(Utils.getCurrentLineMessage(new Exception()));
		System.out.println(":clean SystemValue Completely,key=" + logRoot + ", value=" + System.getProperty(logRoot));
		System.clearProperty(logRoot);
		LogManager.shutdown();
	}

	/**
	 * 加载web配置文件
	 */
	private static void getDistProperties() {
		try{
			PropertyLoader pl = new PropertyLoader();
			pl.initialize(Data.webFrameFileName);
			
			Data.alias = pl.getParameter("alias");
			Data.ENCODE = pl.getParameter("ENCODE");
			Data.PORT_HTTP = Integer.valueOf(pl.getParameter("PORT_HTTP"));
			
			PropertyLoader p2 = new PropertyLoader();
			p2.initialize(Data.distributionFileName);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void initMail(){
		PropertyLoader p = new PropertyLoader();
		p.initialize(Data.mailConfFile);
		Data.mail = new MailUtil(p.getParameter("mailServer"),
				p.getParameter("from"),
				p.getParameter("username"),
				p.getParameter("password"),
				p.getParameter("nick"));
	}
	
	private static void initData() {
		try{
			WebSettingDao WebSettingDao = new WebSettingDao();
			WebSetting webSetting = WebSettingDao.getOne();
			if(null != webSetting){
				Data.webName = webSetting.getWebName();
				Data.DOMAIN = webSetting.getDomain();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 內部類，讀取property
	 */
	static class PropertyLoader {

		private Properties property = new Properties();

		public void initialize(String initFile) {
			try {
				InputStream in = PropertyLoader.class.getClassLoader().getResourceAsStream(initFile);
				property.load(in);
				System.out.println("%====success to init the properties file =====%");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("%====fail to init the properties file=====%");
			}
		}

		public String getParameter(String param) {
			return property.getProperty(param);
		}
	}

}
