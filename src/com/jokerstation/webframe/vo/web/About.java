package com.jokerstation.webframe.vo.web;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 关于我们vo
 * @author Joker
 *
 */
@Table(name="web_about")
public class About extends POJO {

	private static final long serialVersionUID = -3306670506548967879L;

	@Id
	private Long id;
	
	private String tabName;
	
	private Integer sort;
	
	private String html;
	
	private Date modified;
	
	private Boolean showIn;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTabName() {
		return tabName;
	}

	public void setTabName(String tabName) {
		this.tabName = tabName;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public Date getModified() {
		return modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}

	public Boolean getShowIn() {
		return showIn;
	}

	public void setShowIn(Boolean showIn) {
		this.showIn = showIn;
	}

}
