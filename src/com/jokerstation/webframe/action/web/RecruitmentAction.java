package com.jokerstation.webframe.action.web;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.base.action.BaseAction;
import com.jokerstation.webframe.dao.web.RecruitmentDao;
import com.jokerstation.webframe.vo.web.Recruitment;

/**
 * 招聘相关操作
 * @author Joker
 *
 */
public class RecruitmentAction extends BaseAction {

	private static final long serialVersionUID = 947202004550169581L;

	private static final Logger logger = Logger.getLogger(RecruitmentAction.class);
	
	/**
	 * 招聘详细页面
	 * @return
	 */
	public String detail() {
		try{
			String id = request.getParameter("id");
			if(StringUtils.isNotBlank(id)){
				Recruitment recruitment = new RecruitmentDao().get(Long.valueOf(id));
				setAttribute("recruitment", recruitment);
			}
		}catch (Exception e) {
			logger.error("查看招聘详细出错", e);
		}
		
		return "detail";
	}
}
