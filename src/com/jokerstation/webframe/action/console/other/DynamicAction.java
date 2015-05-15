package com.jokerstation.webframe.action.console.other;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;
import com.jokerstation.webframe.dao.web.DynamicDao;
import com.jokerstation.webframe.vo.web.Dynamic;

/**
 * 动态设置的action
 * @author Joker
 *
 */
public class DynamicAction extends BaseAction {

	private static final long serialVersionUID = 6239911682279615889L;

	private static final Logger logger = Logger.getLogger(DynamicAction.class);
	
	private static final String LIST = "list";
	
	private static final String ADD = "add";
	
	private static final String EDIT = "edit";
	
	/**
	 * 列表页
	 * @return
	 */
	public String list() {
		try{
			DynamicDao dao = new DynamicDao();
			
			String keyWord = request.getParameter("keyWord");
			int count = (int)dao.countLikeTitle(keyWord);
			pager.setTotalRowsAmount(count);
			List<Dynamic> list = dao.list(keyWord, pager.getCurrentPage(), pager.getPageSize());
			if(list.size() > 0){
				setAttribute("list", list);
			}
			setAttribute("keyWord", keyWord);
		}catch (Exception e) {
			
		}
		return LIST;
	}
	
	/**
	 * 新增页
	 * @return
	 */
	public String add() {
		setAttribute("breadcrumb", "新增");
		return ADD;
	}
	
	/**
	 * 编辑页
	 * @return
	 */
	public String edit() {
		try{
			setAttribute("breadcrumb", "编辑");
			String id = request.getParameter("id");
			if(StringUtils.isNotBlank(id)){
				Dynamic dynamic = new DynamicDao().get(Long.valueOf(id));
				setAttribute("dynamic", dynamic);
			}
		}catch (Exception e) {
			logger.error("动态编辑页出错", e);
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
			String content = request.getParameter("content");
			String type = request.getParameter("type");
			
			DynamicDao dao = new DynamicDao();
			if(StringUtils.isNotBlank(id)){
				//编辑
				Dynamic dynamic = new DynamicDao().get(Long.valueOf(id));
				if(null != dynamic){
					dynamic.setTitle(title);
					dynamic.setContent(content);
					dynamic.setType(Integer.valueOf(type));
					dynamic.setModified(new Date());
					dao.update(dynamic);
				}
			}else{
				//新增
				Dynamic dynamic = new Dynamic();
				dynamic.setTitle(title);
				dynamic.setContent(content);
				dynamic.setType(Integer.valueOf(type));
				dynamic.setModified(new Date());
				dao.save(dynamic);
			}
			
			flushJSONData(true);
			return;
		}catch (Exception e) {
			logger.error("动态保存出错", e);
		}
		
		flushJSONData(false);
	}
	
	/**
	 * 删除
	 */
	public void del() {
		try{
			String id = request.getParameter("id");
			if(StringUtils.isNotBlank(id)){
				new DynamicDao().delete(Long.valueOf(id));
				flushJSONData(true);
				return;
			}
		}catch (Exception e) {
			logger.error("动态删除出错", e);
		}
		
		flushJSONData(false);
	}
}
