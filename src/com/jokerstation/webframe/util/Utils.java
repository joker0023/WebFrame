package com.jokerstation.webframe.util;

import java.io.File;

/**
 * 基本的utils,用于获取文件相关路径
 * @author Joker
 *
 */
public class Utils {

	public static String getClassPath() {
		return Utils.class.getResource("/").getPath();
	}
	
	public static String getContextPath() {
		String classPath = getClassPath();
		return classPath.substring(0, classPath.lastIndexOf("classes"));
	}
	
	public static String getWebRootPath() {
		String classPath = getClassPath();
		File file = new File(classPath);
		return file.getParentFile().getParent();
	}
	
	public static String getCurrentLineMessage(Exception e) {
		StackTraceElement stackTraceElement = e.getStackTrace()[0];
		return stackTraceElement.getClassName() + "." + stackTraceElement.getMethodName() + "  ("
				+ stackTraceElement.getFileName() + ":" + stackTraceElement.getLineNumber() + ")";
	}
}
