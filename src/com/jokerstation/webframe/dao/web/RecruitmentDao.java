package com.jokerstation.webframe.dao.web;

import java.util.List;

import com.jokerstation.base.dao.BaseDao;
import com.jokerstation.webframe.vo.web.Recruitment;

/**
 * 招聘条目对象vo的Dao
 * @author Joker
 *
 */
public class RecruitmentDao extends BaseDao<Recruitment> {
	
	public RecruitmentDao() {
		super(Recruitment.class);
	}
	
	public List<Recruitment> listByCat(Integer catId, Boolean showIn, int page, int size) throws Exception {
		Recruitment entity = new Recruitment();
		if(null != catId){
			entity.setCatId(catId);
		}
		if(null != showIn){
			entity.setShowIn(showIn);
		}
		
		return this.filter(entity, null, page, size, "modified desc");
	}
	
	public long countByCat(Integer catId, Boolean showIn) throws Exception {
		Recruitment entity = new Recruitment();
		if(null != catId){
			entity.setCatId(catId);
		}
		if(null != showIn){
			entity.setShowIn(showIn);
		}
		
		return this.count(entity);
	}

}
