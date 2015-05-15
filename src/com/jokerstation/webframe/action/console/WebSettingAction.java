package com.jokerstation.webframe.action.console;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;
import com.jokerstation.base.util.Utils;
import com.jokerstation.webframe.dao.comm.LinkDao;
import com.jokerstation.webframe.dao.comm.WebSettingDao;
import com.jokerstation.webframe.dao.web.PageSettingDao;
import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.vo.comm.Link;
import com.jokerstation.webframe.vo.comm.WebSetting;
import com.jokerstation.webframe.vo.web.PageSetting;

/**
 * 站点设置的action
 * @author Joker
 *
 */
public class WebSettingAction extends BaseAction{

	private static final long serialVersionUID = 6317624677961461202L;

	private static final Logger logger = Logger.getLogger(WebSettingAction.class);
	
	private static final String WEBSETTING = "webSetting";
	
	private static final String COMM = "comm";
	
	private static final String LINKS = "links";
	
	private static final String TITLESET = "titleSet";
	
	private File logo = null;
	private String logoFileName = null;
	
	private String webName = null;
	private String domain = null;
	private String keyWord = null;
	private String description = null;
	private String icp = null;
	
	/**
	 * 跳转站点设置页面
	 * @return
	 */
	public String webSetting() {
		setAttribute("menu", "websetting");
		return WEBSETTING;
	}
	
	/**
	 * 跳转基本设置页面
	 * @return
	 */
	public String comm(){
		try{
			WebSettingDao WebSettingDao = new WebSettingDao();
			WebSetting webSetting = WebSettingDao.getOne();
			
			setAttribute("webSetting", webSetting);
		}catch (Exception e) {
			logger.error("获取站点基本信息出错", e);
		}
		
		return COMM;
	}
	
	/**
	 * 保存基本设置
	 * @return
	 */
	public String saveSetting() {
		InputStream in = null;
		OutputStream op = null;
		try{
			if(null != logo){
				String logoPath = Utils.getWebRootPath() + "/favicon.ico";
				in = new FileInputStream(logo);
				op = new FileOutputStream(new File(logoPath));
				IOUtils.copy(in, op);
			}
			
			WebSettingDao WebSettingDao = new WebSettingDao();
			WebSetting webSetting = new WebSetting();
			WebSettingDao.delete(webSetting);
			webSetting.setWebName(webName);
			webSetting.setDomain(domain);
			webSetting.setKeyWord(keyWord);
			webSetting.setDescription(description);
			webSetting.setIcp(icp);
			WebSettingDao.save(webSetting);
			
			Data.webName = webSetting.getWebName();
			Data.DOMAIN = webSetting.getDomain();
			
			setAttribute("saveResult", "true");
		}catch (Exception e) {
			logger.error("保存站点基本信息出错", e);
			setAttribute("saveResult", "false");
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
		
		return comm();
	}
	
	/**
	 * 跳转友情链接设置页面
	 * @return
	 */
	public String links() {
		try{
			LinkDao linkDao = new LinkDao();
			
			int rows = (int)linkDao.count(new Link());
			pager.setTotalRowsAmount(rows);
			List<Link> linkList = linkDao.list(new Link(), pager.getCurrentPage(), pager.getPageSize());
			
			setAttribute("linkList", linkList);
		}catch (Exception e) {
			logger.error("查询友情链接出错", e);
		}
		
		return LINKS;
	}
	
	/**
	 * 新增友情链接
	 */
	public void linkAdd() {
		try{
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			
			if(null != name && null != url){
				LinkDao linkDao = new LinkDao();
				Link link = new Link();
				link.setName(name);
				link.setUrl(url);
				
				linkDao.save(link);
				
				flushJSONData(true);
			}else{
				setJSONAttribute("errMsg", "参数非法");
			}
		}catch (Exception e) {
			logger.error("新增友情链接出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 更新链接
	 */
	public void linkUpdate() {
		try{
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			
			if(null != id && null != name && null != url){
				LinkDao linkDao = new LinkDao();
				Link link = linkDao.get(Long.valueOf(id));
				
				if(null != link){
					link.setName(name);
					link.setUrl(url);
					
					linkDao.update(link);
				
					flushJSONData(true);
				}
			}else{
				setJSONAttribute("errMsg", "参数非法");
			}
		}catch (Exception e) {
			logger.error("更新友情链接出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 删除友情链接
	 */
	public void linkDel() {
		try{
			String id = request.getParameter("id");
			if(null != id){
				new LinkDao().delete(Long.valueOf(id));
				
				flushJSONData(true);
			}else{
				setJSONAttribute("errMsg", "参数非法");
			}
		}catch (Exception e) {
			logger.error("删除友情链接出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 批量删除友情链接
	 */
	public void batchDel() {
		try{
			String ids = request.getParameter("ids");
			
			if(null != ids){
				List<Long> idList = new ArrayList<Long>();
				String[] arr = ids.split(",");
				if(null != arr){
					for(String id : arr){
						if(StringUtils.isNotBlank(id)){
							idList.add(Long.valueOf(id));
						}
					}
					if(idList.size() > 0){
						new LinkDao().batchDelete(idList);
					}
				}
				
				flushJSONData(true);
			}else{
				setJSONAttribute("errMsg", "参数非法");
			}
		}catch (Exception e) {
			logger.error("批量删除友情链接出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 跳转页面的标题关键字设置页面
	 * @return
	 */
	public String titleSet() {
		try{
			PageSettingDao webPageSettingDao = new PageSettingDao();
			List<PageSetting> webPageSettingList = webPageSettingDao.listAll();
			setAttribute("webPageSettingList", webPageSettingList);
			
			PageSetting indexPage = webPageSettingDao.getByPageId("index");
			setAttribute("indexPage", indexPage);
		}catch (Exception e) {
			logger.error("跳转页面的标题关键字设置页面出错", e);
		}
		
		return TITLESET;
	}
	
	/**
	 * 获取页面标题设置
	 */
	public void getPageSetting() {
		try{
			String pageId = request.getParameter("pageId");
			
			if(null != pageId){
				PageSetting webPageSetting = new PageSettingDao().getByPageId(pageId);
				
				if(null == webPageSetting){
					webPageSetting = new PageSetting();
				}
				
				setJSONAttribute("webPageSetting", webPageSetting);
				flushJSONData(true);
			}else{
				setJSONAttribute("errMsg", "参数非法");
			}
		}catch (Exception e) {
			logger.error("获取页面标题设置出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 保存页面的标题关键字设置
	 */
	public void saveTitle() {
		try{
			String pageId = request.getParameter("pageId");
			String title = request.getParameter("title");
			String keyWord = request.getParameter("keyWord");
			String description = request.getParameter("description");
			
			if(null != pageId){
				PageSettingDao dao = new PageSettingDao();
				PageSetting webPageSetting = dao.getByPageId(pageId);
				if(null == webPageSetting){
					webPageSetting = new PageSetting();
					webPageSetting.setPageId(pageId);
					webPageSetting.setTitle(title);
					webPageSetting.setKeyWord(keyWord);
					webPageSetting.setDescription(description);
					dao.save(webPageSetting);
				}else{
					webPageSetting.setPageId(pageId);
					webPageSetting.setTitle(title);
					webPageSetting.setKeyWord(keyWord);
					webPageSetting.setDescription(description);
					dao.update(webPageSetting);
				}
				flushJSONData(true);
			}else{
				setJSONAttribute("errMsg", "参数非法");
			}
		}catch (Exception e) {
			logger.error("保存页面的标题关键字设置出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public String getWebName() {
		return webName;
	}

	public void setWebName(String webName) {
		this.webName = webName;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcp() {
		return icp;
	}

	public void setIcp(String icp) {
		this.icp = icp;
	}

}
