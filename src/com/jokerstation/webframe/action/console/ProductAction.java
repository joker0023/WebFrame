package com.jokerstation.webframe.action.console;

import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;

/**
 * 产品介绍action
 * @author Joker
 *
 */
public class ProductAction extends BaseAction {

	private static final long serialVersionUID = -346097465978230534L;
	
	private static final Logger logger = Logger.getLogger(ProductAction.class);
	
	private static final String PRODUCT = "product";
	
	/**
	 * 跳转产品介绍设置页面
	 * @return
	 */
	public String product() {
		return PRODUCT;
	}
}
