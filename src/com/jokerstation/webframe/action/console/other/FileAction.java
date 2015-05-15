package com.jokerstation.webframe.action.console.other;

import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;

public class FileAction extends BaseAction {
	
	private static final long serialVersionUID = 3648901727041798150L;

	private static final Logger logger = Logger.getLogger(FileAction.class);
	
	private String list() {
		try{
			
		}catch (Exception e) {
			logger.error("获取文件列表出错", e);
		}
		
		return "list";
	}
	
}
