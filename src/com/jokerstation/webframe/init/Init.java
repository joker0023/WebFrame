package com.jokerstation.webframe.init;

import javax.servlet.ServletContextEvent;

import com.joker23.orm.connection.ConnectionFactory;
import com.jokerstation.base.data.BaseData;
import com.jokerstation.base.init.BaseInit;
import com.jokerstation.webframe.dao.comm.WebSettingDao;
import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.vo.comm.WebSetting;

/**
 * 初始化执行对象
 * 用于web服务器启动时执行
 * @author Joker
 *
 */
public class Init extends BaseInit {

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		try{
			super.contextInitialized(arg0);
			
			// 读取配置文件,获得默认值
			getDistProperties();
			
			//初始化数据库
			ConnectionFactory.init(BaseData.alias, BaseData.dbFileName);
			
			// 初始化变量
			initData();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 加载web配置文件
	 */
	private static void getDistProperties() {
		try{
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取常用值置于内存
	 */
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
	
}
