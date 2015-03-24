package com.jokerstation.webframe.log;

import org.apache.log4j.Level;

/**
 * 自定义的log级别,用于实现自定义的log4j输出时有用
 * @author Joker
 *
 */
public class SeriousLevel extends Level {

	private static final long serialVersionUID = -8703390514146270958L;

	protected SeriousLevel(int level, String levelStr, int syslogEquivalent) {
		super(level, levelStr, syslogEquivalent);
	}
}
