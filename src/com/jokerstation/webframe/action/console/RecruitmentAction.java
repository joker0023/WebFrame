package com.jokerstation.webframe.action.console;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;
import com.jokerstation.webframe.dao.web.RecruitmentCatDao;
import com.jokerstation.webframe.dao.web.RecruitmentDao;
import com.jokerstation.webframe.vo.web.Recruitment;
import com.jokerstation.webframe.vo.web.RecruitmentCat;

/**
 * 招聘页面action
 * @author Joker
 *
 */
public class RecruitmentAction extends BaseAction {

	private static final long serialVersionUID = -2261896082860639828L;

	private static final Logger logger = Logger.getLogger(RecruitmentAction.class);
	
	private static final String CATEGORY = "category";
	private static final String RECRUITMENT = "recruitment";
	private static final String LIST = "list";
	private static final String ADD = "add";
	private static final String EDIT = "edit";
	
	/**
	 * 跳转招聘页面
	 * @return
	 */
	public String recruitment() {
		setAttribute("menu", "recruitment");
		
		return RECRUITMENT;
	}
	
	/**
	 * 跳转招聘类目设置页面
	 * @return
	 */
	public String category() {
		try{
			List<RecruitmentCat> list = new RecruitmentCatDao().listAll();
			setAttribute("list", list);
		}catch (Exception e) {
			logger.error("跳转招聘类目设置页面出错", e);
		}
		return CATEGORY;
	}
	
	/**
	 * 保存招聘类目出错
	 */
	public void saveCat() {
		try{
			String id = request.getParameter("id");
			String name= request.getParameter("name");
			String sort = request.getParameter("sort");
			String showIn = request.getParameter("showIn");
			
			RecruitmentCatDao dao = new RecruitmentCatDao();
			RecruitmentCat cat = new RecruitmentCat();
			if(null != id){
				cat = dao.get(Integer.valueOf(id));
				if(null == cat){
					flushJSONData(false);
					return;
				}
			}else{
				cat = new RecruitmentCat();
			}
			
			if(StringUtils.isNotBlank(name)){
				cat.setName(name);
			}
			if(StringUtils.isNotBlank(sort)){
				cat.setSort(Integer.valueOf(sort));
			}else{
				cat.setSort(1);
			}
			if("1".equals(showIn)){
				cat.setShowIn(true);
			}else{
				cat.setShowIn(false);
			}
			
			if(null != id){
				dao.update(cat);
			}else{
				dao.save(cat);
			}
			flushJSONData(true);
			return;
		}catch (Exception e) {
			logger.error("保存招聘类目出错", e);
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 删除招聘类目
	 */
	public void delCat() {
		try{
			String id = request.getParameter("id");
			if(null != id){
				new RecruitmentCatDao().delete(Integer.valueOf(id));
				flushJSONData(true);
				return;
			}
		}catch (Exception e) {
			logger.error("删除招聘类目出错", e);
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 跳转招聘设置页面
	 * @return
	 */
	public String list() {
		try{
			String catId = request.getParameter("catId");
			String showIn = request.getParameter("showIn");
			
			Integer _catId = StringUtils.isBlank(catId) ? null : Integer.valueOf(catId);
			Boolean _showIn = StringUtils.isBlank(showIn) ? null : Boolean.valueOf(showIn);
			
			RecruitmentDao dao = new RecruitmentDao();
			int rows = (int)dao.countByCat(_catId, _showIn);
			pager.setTotalRowsAmount(rows);
			
			List<Recruitment> recruitmentList = new RecruitmentDao().listByCat(_catId, _showIn, pager.getCurrentPage(), pager.getPageSize());
			if(null != recruitmentList && recruitmentList.size() > 0){
				setAttribute("recruitmentList", recruitmentList);
			}
			
			List<RecruitmentCat> catList = new RecruitmentCatDao().listAll();
			setAttribute("catList", catList);
			
			setAttribute("catId", catId);
			setAttribute("showIn", showIn);
		}catch (Exception e) {
			logger.error("跳转招聘设置页面出错", e);
		}
		return LIST;
	}
	
	/**
	 * 新增
	 * @return
	 */
	public String add() {
		try{
			setAttribute("breadcrumb", "新增");
			List<RecruitmentCat> catList = new RecruitmentCatDao().listAll();
			setAttribute("catList", catList);
			
		}catch (Exception e) {
			logger.error("新增招聘信息出错", e);
		}
		
		return ADD;
	}
	
	/**
	 * 编辑
	 * @return
	 */
	public String edit() {
		try{
			setAttribute("breadcrumb", "编辑");
			
			String id = request.getParameter("id");
			if(null == id){
				return LIST;
			}
			RecruitmentDao dao = new RecruitmentDao();
			Recruitment recruitment = dao.get(Long.valueOf(id));
			setAttribute("recruitment", recruitment);
			
			List<RecruitmentCat> catList = new RecruitmentCatDao().listAll();
			setAttribute("catList", catList);
		}catch (Exception e) {
			logger.error("跳转编辑'招聘'页面出错", e);
			return LIST;
		}
		
		return EDIT;
	}
	
	/**
	 * 保存
	 */
	public void save() {
		try{
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String showin = request.getParameter("showin");
			String html = request.getParameter("html");
			String catId = request.getParameter("catId");
			
			RecruitmentDao recruitmentDao = new RecruitmentDao();
			Recruitment recruitment = null;
			if(StringUtils.isBlank(id)){
				//新增
				recruitment = new Recruitment();
			}else{
				//编辑
				recruitment = recruitmentDao.get(Long.valueOf(id));
				if(null == recruitment){
					flushJSONData(false);
					return;
				}
			}
			
			recruitment.setTitle(title);
			if("1".equals(showin)){
				recruitment.setShowIn(true);
			}else{
				recruitment.setShowIn(false);
			}
			recruitment.setHtml(html);
			recruitment.setModified(new Date());
			recruitment.setCatId(Integer.valueOf(catId));
			
			if(StringUtils.isBlank(id)){
				recruitmentDao.save(recruitment);
			}else{
				recruitmentDao.update(recruitment);
			}
			
			flushJSONData(true);
		}catch (Exception e) {
			logger.error("保存recruitment出错", e);
		}
	}
	
	/**
	 * 删除
	 */
	public void del() {
		try{
			String id = request.getParameter("id");
			if(null != id){
				new RecruitmentDao().delete(Long.valueOf(id));
				flushJSONData(true);
				return;
			}
		}catch (Exception e) {
			logger.error("删除recruitment出错", e);
		}
		
		flushJSONData(false);
	}
}
