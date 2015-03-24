package com.jokerstation.webframe.action.console.other;

import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;

/**
 * 其他页面的action
 * @author Joker
 *
 */
public class OtherAction extends BaseAction {

	private static final long serialVersionUID = 9068388743822456112L;

	private static final Logger logger = Logger.getLogger(OtherAction.class);
	
	private static final String OTHER = "other";
	
	/**
	 * 跳转到其他设置页面
	 * @return
	 */
	public String other() {
		try{
			setAttribute("menu", "other");
		}catch (Exception e) {
			logger.error("跳转到其他设置页面出错", e);
		}
		
		return OTHER;
	}
}
