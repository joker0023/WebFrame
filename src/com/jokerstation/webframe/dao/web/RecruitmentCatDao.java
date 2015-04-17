package com.jokerstation.webframe.dao.web;

import java.util.List;

import com.jokerstation.webframe.dao.BaseDao;
import com.jokerstation.webframe.vo.web.RecruitmentCat;

/**
 * 招聘类目vo的Dao
 * @author Joker
 *
 */
public class RecruitmentCatDao extends BaseDao<RecruitmentCat> {
	
	public RecruitmentCatDao() {
		super(RecruitmentCat.class);
	}
	
	/**
	 * 获取展示的招聘类目
	 * @return
	 * @throws Exception
	 */
	public List<RecruitmentCat> listShow() throws Exception {
		RecruitmentCat entity = new RecruitmentCat();
		entity.setShowIn(true);
		
		return this.list(entity, 0, 0);
	}

}
