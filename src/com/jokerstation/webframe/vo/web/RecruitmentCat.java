package com.jokerstation.webframe.vo.web;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 招聘类目vo
 * @author Joker
 *
 */
@Table(name="web_recruitmentcat")
public class RecruitmentCat extends POJO {
	
	private static final long serialVersionUID = -9003372304671983995L;

	@Id
	private Integer id;
	
	private String name;
	
	private Integer sort;
	
	private Boolean showIn;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Boolean getShowIn() {
		return showIn;
	}

	public void setShowIn(Boolean showIn) {
		this.showIn = showIn;
	}

}
