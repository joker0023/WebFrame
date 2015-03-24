package com.jokerstation.webframe.log;

import org.apache.log4j.spi.Filter;
import org.apache.log4j.spi.LoggingEvent;

/**
 * 自定义的logfilter,用于实现log4j的一些自定义输出
 * @author Joker
 *
 */
public class MyLogFilter extends Filter {

	int levelMin;
	int levelMax;

	public int getLevelMin() {
		return levelMin;
	}


	public void setLevelMin(int levelMin) {
		this.levelMin = levelMin;
	}


	public int getLevelMax() {
		return levelMax;
	}


	public void setLevelMax(int levelMax) {
		this.levelMax = levelMax;
	}

	@Override
	public int decide(LoggingEvent lgEvent) {
		int inputLevel = lgEvent.getLevel().toInt();
		if(inputLevel >= levelMin && inputLevel <= levelMax){
			return 0;
		}
		return -1;
	}
}
