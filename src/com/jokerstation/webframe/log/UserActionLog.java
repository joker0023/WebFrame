package com.jokerstation.webframe.log;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.net.SyslogAppender;

/**
 * 记录用户行为的log
 * @author Joker
 *
 */
public class UserActionLog {

	private static Logger logger = Logger.getLogger(UserActionLog.class);
	
	private static final Level ACTION_LOG_LEVEL = new SeriousLevel(20100, "ACTION", SyslogAppender.LOG_LOCAL0);
	
	public static void info(Object action_info){
		logger.log(ACTION_LOG_LEVEL, action_info);
	}
}
