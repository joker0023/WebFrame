package com.jokerstation.webframe.action.console.other;

import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;

/**
 * 动态设置的action
 * @author Joker
 *
 */
public class DynamicAction extends BaseAction {

	private static final long serialVersionUID = 6239911682279615889L;

	private static final Logger logger = Logger.getLogger(DynamicAction.class);
	
	private static final String LIST = "list";
	
	/**
	 * 列表页
	 * @return
	 */
	public String list() {
		setAttribute("menu", "other");
		return LIST;
	}
}
