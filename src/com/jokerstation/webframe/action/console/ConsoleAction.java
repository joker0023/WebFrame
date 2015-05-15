package com.jokerstation.webframe.action.console;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.jokerstation.base.action.BaseAction;
import com.jokerstation.base.util.Utils;

/**
 * 后台基本的action
 * @author Joker
 *
 */
public class ConsoleAction extends BaseAction {

	private static final long serialVersionUID = 8296323052690813540L;

	private static final Logger logger = Logger.getLogger(ConsoleAction.class);
	
	private static final String INDEX = "index";
	
	private File imgFile = null;
	
	private String imgFileFileName = null;
	
	/**
	 * 跳转后台首页
	 * @return
	 */
	public String index() {
		
		return INDEX;
	}
	
	/**
	 * 上传文件
	 */
	public void upload() {
		InputStream in = null;
		OutputStream op = null;
		try{
			//文件保存目录路径
			String savePath = Utils.getWebRootPath() + "/upload/";
			
			//文件保存目录URL
			String saveUrl  = request.getContextPath() + "/upload/";
			
			//定义允许上传的文件扩展名
			HashMap<String, String> extMap = new HashMap<String, String>();
			extMap.put("image", "gif,jpg,jpeg,png,bmp");
			extMap.put("flash", "swf,flv");
			extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
			extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
			
			//最大文件大小
			long maxSize = 1000000;
			
			if(!ServletFileUpload.isMultipartContent(request)){
				setJSONAttribute("error", 1);
				setJSONAttribute("message", "请选择文件");
				flushJSONData(false);
				return;
			}
			
			String dirName = request.getParameter("dir");
			if (dirName == null) {
				dirName = "image";
			}
			if(!extMap.containsKey(dirName)){
				setJSONAttribute("error", 1);
				setJSONAttribute("message", "目录名不正确");
				flushJSONData(false);
				return;
			}
			
			//创建文件夹
			savePath += dirName + "/";
			saveUrl += dirName + "/";
			File saveDirFile = new File(savePath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			saveUrl += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			
			if(null == imgFile){
				setJSONAttribute("error", 1);
				setJSONAttribute("message", "请选择文件");
				flushJSONData(false);
				return;
			}
			
			//检查文件大小
			if(imgFile.length() > maxSize){
				setJSONAttribute("error", 1);
				setJSONAttribute("message", "上传文件大小超过限制");
				flushJSONData(false);
				return;
			}
			
			//检查扩展名
			String fileExt = imgFileFileName.substring(imgFileFileName.lastIndexOf(".") + 1).toLowerCase();
			if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
				setJSONAttribute("error", 1);
				setJSONAttribute("message", "上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
				flushJSONData(false);
				return;
			}
			
			String newFileName = System.currentTimeMillis() + "_" + new Random().nextInt(1000) + "." + fileExt;
			File uploadedFile = new File(savePath, newFileName);
			in = new FileInputStream(imgFile);
			op = new FileOutputStream(uploadedFile);
			IOUtils.copy(in, op);

			setJSONAttribute("error", 0);
			setJSONAttribute("url", saveUrl + newFileName);
			flushJSONData(true);
			
		}catch (Exception e) {
			logger.error("kindeditor上传文件出错", e);
			setJSONAttribute("error", 1);
			setJSONAttribute("message", e.getMessage());
			flushJSONData(false);
		}finally {
			try{
				if(null != in){
					in.close();
				}
				if(null != op){
					op.close();
				}
			}catch (Exception e) {
				logger.error("关闭文件流出错", e);
			}
		}
	}
	
	/**
	 * 远程文件
	 */
	public void fileManager() {
		try{
			//文件保存目录路径
			String rootPath = Utils.getWebRootPath() + "/upload/";
			
			//文件保存目录URL
			String rootUrl  = request.getContextPath() + "/upload/";
			
			//图片扩展名
			String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};
			
			String dirName = request.getParameter("dir");
			if (dirName != null) {
				if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
					flushHtml("Invalid Directory name.");
					return;
				}
				rootPath += dirName + "/";
				rootUrl += dirName + "/";
				File saveDirFile = new File(rootPath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}
			}
			//根据path参数，设置各路径和URL
			String path = request.getParameter("path") != null ? request.getParameter("path") : "";
			String currentPath = rootPath + path;
			String currentUrl = rootUrl + path;
			String currentDirPath = path;
			String moveupDirPath = "";
			if (!"".equals(path)) {
				String str = currentDirPath.substring(0, currentDirPath.length() - 1);
				moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
			}
			
			//排序形式，name or size or type
			String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";
			
			//不允许使用..移动到上一级目录
			if (path.indexOf("..") >= 0) {
				flushHtml("Access is not allowed.");
				return;
			}
			//最后一个字符不是/
			if (!"".equals(path) && !path.endsWith("/")) {
				flushHtml("Parameter is not valid.");
				return;
			}
			//目录不存在或不是目录
			File currentPathFile = new File(currentPath);
			if(!currentPathFile.isDirectory()){
				flushHtml("Directory does not exist.");
				return;
			}
			
			//遍历目录取的文件信息
			List<Hashtable<String, Object>> fileList = new ArrayList<Hashtable<String, Object>>();
			if(currentPathFile.listFiles() != null) {
				for (File file : currentPathFile.listFiles()) {
					Hashtable<String, Object> hash = new Hashtable<String, Object>();
					String fileName = file.getName();
					if(file.isDirectory()) {
						hash.put("is_dir", true);
						hash.put("has_file", (file.listFiles() != null));
						hash.put("filesize", 0L);
						hash.put("is_photo", false);
						hash.put("filetype", "");
					} else if(file.isFile()){
						String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
						hash.put("is_dir", false);
						hash.put("has_file", false);
						hash.put("filesize", file.length());
						hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
						hash.put("filetype", fileExt);
					}
					hash.put("filename", fileName);
					hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
					fileList.add(hash);
				}
			}
			
			if ("size".equals(order)) {
				Collections.sort(fileList, new SizeComparator());
			} else if ("type".equals(order)) {
				Collections.sort(fileList, new TypeComparator());
			} else {
				Collections.sort(fileList, new NameComparator());
			}
			
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("moveup_dir_path", moveupDirPath);
			result.put("current_dir_path", currentDirPath);
			result.put("current_url", currentUrl);
			result.put("total_count", fileList.size());
			result.put("file_list", fileList);

			response.setContentType("application/json; charset=UTF-8");
			
			PrintWriter out = null;
			try{
				out = response.getWriter();
				out.println(new Gson().toJson(result));
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				out.flush();
				out.close();
			}
		}catch (Exception e) {
			logger.error("获取远程文件出错", e);
		}
	}
	
	public class NameComparator implements Comparator<Object> {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
			}
		}
	}
	
	public class SizeComparator implements Comparator<Object> {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
					return 1;
				} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}
	public class TypeComparator implements Comparator<Object> {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
			}
		}
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgFileFileName() {
		return imgFileFileName;
	}

	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}

}
