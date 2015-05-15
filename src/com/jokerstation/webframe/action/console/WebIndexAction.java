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
import com.jokerstation.webframe.dao.web.CarouselDao;
import com.jokerstation.webframe.vo.web.Carousel;

/**
 * 首页设置的action
 * @author Joker
 *
 */
public class WebIndexAction extends BaseAction {

	private static final long serialVersionUID = 7936116835846364273L;

	private static final Logger logger = Logger.getLogger(WebIndexAction.class);
	
	private static final String WEBINDEX = "webIndex";
	private static final String SETTING = "setting";
	private static final String CAROUSEL = "carousel";
	
	private File carouselImg = null;
	private String carouselImgFileName = null;
	
	/**
	 * 跳转首页设置页面
	 * @return
	 */
	public String webIndex() {
		setAttribute("menu", "webindex");
		return WEBINDEX;
	}
	
	/**
	 * 跳转首页基本设置页面
	 * @return
	 */
	public String setting() {
		
		return SETTING;
	}
	
	/**
	 * 获取轮播图
	 * @return
	 */
	public String carousel() {
		try{
			List<Carousel> carouselList = new CarouselDao().listAllBySort();
			
			setAttribute("carouselList", carouselList);
		}catch (Exception e) {
			logger.error("获取轮播图出错", e);
		}
		
		return CAROUSEL;
	}
	
	/**
	 * 新增轮播图
	 * @return
	 */
	public String addCarousel() {
		InputStream in = null;
		OutputStream op = null;
		try{
			if(null != carouselImg && null != carouselImgFileName){
				String formate = carouselImgFileName.substring(carouselImgFileName.lastIndexOf(".") + 1);
				String imgPath = "/assets/img/carousel/" + System.currentTimeMillis() + "." + formate;
				String savePath = Utils.getWebRootPath() + imgPath;
				
				in = new FileInputStream(carouselImg);
				op = new FileOutputStream(new File(savePath));
				IOUtils.copy(in, op);
				
				Carousel carousel = new Carousel();
				carousel.setPic(imgPath);
				carousel.setSort(1);
				new CarouselDao().save(carousel);
			}
		}catch (Exception e) {
			logger.error("新增轮播图出错", e);
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
		
		return carousel();
	}
	
	/**
	 * 更新轮播图
	 */
	public void updateCarousel() {
		try{
			String id = request.getParameter("id");
			String url = request.getParameter("url");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			if(null != id){
				CarouselDao dao = new CarouselDao();
				
				Carousel carousel = dao.get(Long.valueOf(id));
				if(null != carousel){
					carousel.setUrl(url);
					carousel.setTitle(title);
					carousel.setContent(content);
					dao.update(carousel);
					flushJSONData(true);
				}
			}else{
				setJSONAttribute("errMsg", "参数非法");
			}
		}catch (Exception e) {
			logger.error("更新轮播图出错", e);
			setJSONAttribute("errMsg", e.getMessage());
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 保存轮播图顺序
	 * @return
	 */
	public String saveSort() {
		try{
			String ids = request.getParameter("ids");
			if(null != ids){
				String[] arr = ids.split(",");
				CarouselDao dao = new CarouselDao();
				Carousel carousel = null;
				int sort = 1;
				List<Carousel> carouselList = new ArrayList<Carousel>();
				for(String id : arr){
					if(StringUtils.isNotBlank(id)){
						carousel = dao.get(Long.valueOf(id));
						if(null == carousel){
							continue;
						}
						carousel.setSort(sort++);
						carouselList.add(carousel);
					}
				}
				if(carouselList.size() > 0){
					dao.batchUpdate(carouselList);
				}
				
				setAttribute("saveResult", true);
			}
		}catch (Exception e) {
			logger.error("保存轮播图顺序出错", e);	
		}
		
		return carousel();
	}
	
	/**
	 * 删除轮播图
	 * @return
	 */
	public String delCarousel() {
		try{
			String id = request.getParameter("id");
			if(null != id){
				CarouselDao dao = new CarouselDao();
				Carousel carousel = dao.get(Long.valueOf(id));
				if(null != carousel){
					new CarouselDao().delete(Long.valueOf(id));
					File file = new File(Utils.getWebRootPath() + carousel.getPic());
					if(file.exists()){
						file.delete();
					}
				}
				
			}
		}catch (Exception e) {
			logger.error("删除轮播图出错", e);	
		}
		
		return carousel();
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public File getCarouselImg() {
		return carouselImg;
	}

	public void setCarouselImg(File carouselImg) {
		this.carouselImg = carouselImg;
	}

	public String getCarouselImgFileName() {
		return carouselImgFileName;
	}

	public void setCarouselImgFileName(String carouselImgFileName) {
		this.carouselImgFileName = carouselImgFileName;
	}
	
}
